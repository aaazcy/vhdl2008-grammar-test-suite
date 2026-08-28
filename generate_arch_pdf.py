#!/usr/bin/env python3
"""Report renderer: PDFs, self-contained HTML, and the reports portal.

Architecture mindmap: mmdc renders mermaid → PyPDF2 merges pages → single PDF
                      (P2: safe-replace — rendered in a temp dir, the tracked
                      PDF is only replaced after full success; a failed run
                      never deletes the old PDF)
Architecture HTML: pandoc MD → HTML with mermaid blocks replaced by inline SVG
                   (mmdc-rendered) — fully self-contained, works offline
Test plan HTML: pandoc converts MD → standalone HTML + CDN mermaid.js
Reports portal: reports/index.html — static nav page linking all reports

Requires: Node.js + @mermaid-js/mermaid-cli + PyPDF2 + pandoc
"""

import os, sys, subprocess, glob, re, tempfile, shutil
from datetime import datetime

# stdout/stderr may be pipes (called from sync_all.py) — force UTF-8 so
# printing mmdc error text (which can contain replacement chars) never crashes
# on GBK-locale Windows.
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

BASE = os.path.dirname(os.path.abspath(__file__))
REPORTS = os.path.join(BASE, 'vhdl2008_grammar_test', 'reports')
TEST_PLAN_DIR = os.path.join(BASE, 'vhdl2008_grammar_test', 'test_plan')

ARCH_HTML = os.path.join(REPORTS, 'architecture_mindmap.html')
PORTAL_HTML = os.path.join(REPORTS, 'index.html')

NPM_BIN = os.path.expanduser(r'~\AppData\Roaming\npm')
NODE_PATH_DIR = r'C:\Program Files\nodejs'

CSS_STYLE = '''<style>
  body { font-family: "Microsoft YaHei", -apple-system, sans-serif; max-width: 1200px; margin: 30px auto; padding: 0 20px; color: #1a1a1a; }
  table { border-collapse: collapse; width: 100%; margin: 10px 0; font-size: 0.85em; }
  th, td { border: 1px solid #ccc; padding: 4px 8px; text-align: left; }
  th { background: #f0f0f0; }
  h1, h2, h3 { color: #1a3a5c; }
  pre, code { background: #f5f5f5; padding: 1px 4px; border-radius: 3px; }
  .mermaid { margin: 20px 0; padding: 16px; background: #fafafa; border-radius: 8px; border: 1px solid #e5e7eb; }
  .mermaid svg { max-width: 100%; height: auto; }
  @media print { body { max-width: none; font-size: 10px; } table { font-size: 8px; } pre, .mermaid { break-inside: avoid; } }
</style>'''

# Portal nav: (relative link, description)
PORTAL_LINKS = [
    ('architecture_mindmap.html', 'Architecture reference — self-contained inline SVG, works offline'),
    ('architecture_mindmap.pdf', 'Architecture mindmap PDF (mmdc + PyPDF2)'),
    ('../test_plan/VHDL2008_Test_Plan_latest.html', 'Test plan HTML (mermaid via CDN — needs network)'),
    ('../test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md', 'Test plan Markdown (source document — includes §8.5 known issues and technical debt)'),
    ('../test_plan/Appendix_E_Traceability_Matrix.md', 'Appendix E traceability matrix'),
    ('coverage_summary.md', 'Coverage report (auto-generated)'),
    ('ghdl_test_results.md', 'GHDL results matrix (includes Notes: WARN_REJECT / EXPECTED_FAIL)'),
    ('ghdl_failures.csv', 'GHDL failure details — should contain only the header (0 rows)'),
    ('ghdl_allowlist.csv', 'GHDL 6.0 known limitation list (relpath + reason)'),
    ('../../PRODUCTION_TRACKER.md', 'Production tracker'),
    ('../logs/generation.log', 'Generation log'),
]


def find_mmdc():
    for d in [NPM_BIN] + os.environ.get('PATH', '').split(os.pathsep):
        for name in ['mmdc.cmd', 'mmdc']:
            p = os.path.join(d, name)
            if os.path.exists(p):
                return p
    return None


def run_mmdc(md_file, output_pdf):
    """Run mmdc to render mermaid blocks to PDF. Returns list of generated PDF files.

    Callers pass a TEMP output path (P2 hardening): this function may create
    and delete files around that path freely — the tracked PDF in reports/ is
    never touched here, so a failed render can no longer destroy it."""
    mmdc = find_mmdc()
    if not mmdc:
        print("  ERROR: mmdc not found. Install: npm install -g @mermaid-js/mermaid-cli")
        return []

    env = os.environ.copy()
    env['PATH'] = NODE_PATH_DIR + os.pathsep + NPM_BIN + os.pathsep + env.get('PATH', '')
    env['NODE_PATH'] = os.path.join(NPM_BIN, 'node_modules')

    result = subprocess.run(
        [mmdc, '-i', md_file, '-o', output_pdf, '--pdfFit', '-s', '1'],
        cwd=os.path.dirname(md_file) or '.', env=env,
        capture_output=True, text=True, timeout=180,
        encoding='utf-8', errors='replace'
    )

    pdfs = sorted(glob.glob(output_pdf.replace('.pdf', '') + '-*.pdf'))
    if pdfs:
        return pdfs

    # Maybe it was a single output
    if os.path.exists(output_pdf):
        return [output_pdf]

    # Print error
    err = result.stderr.strip()[:300] if result.stderr else 'unknown'
    print(f"  mmdc error: {err}")
    return []


def merge_pdfs(pdf_files, output_file):
    """Merge multiple PDFs into one using PyPDF2.

    Any failure (PyPDF2 missing, unreadable page, write error) returns False
    without touching the tracked reports/ artifacts — the caller keeps the
    old PDF (P2 safe-replace contract)."""
    try:
        from PyPDF2 import PdfFileReader, PdfFileWriter
        writer = PdfFileWriter()
        for pf in pdf_files:
            reader = PdfFileReader(pf)
            for i in range(reader.getNumPages()):
                writer.addPage(reader.getPage(i))
    except ImportError:
        print("  ERROR: PyPDF2 not installed. Run: pip install PyPDF2")
        return False
    except Exception as e:
        print(f"  ERROR: PDF merge failed ({e})")
        return False

    try:
        with open(output_file, 'wb') as f:
            writer.write(f)
    except Exception as e:
        print(f"  ERROR: PDF write failed ({e})")
        return False

    size_kb = os.path.getsize(output_file) / 1024
    print(f"  Merged -> {output_file} ({size_kb:.0f} KB)")

    for pf in pdf_files:
        try:
            os.remove(pf)
        except Exception:
            pass

    return True


def generate_mindmap_pdf():
    """Generate single PDF from architecture_mindmap.md (safe-replace, P2).

    Renders into a temp dir and only replaces the tracked
    reports/architecture_mindmap.pdf AFTER everything succeeded. Any failure
    (mmdc error, PyPDF2 missing, merge failure) leaves the old PDF untouched
    and cleans up the temp files — the previous destructive path (delete old
    PDF first, then render/merge) could leave the tracked artifact deleted and
    -1/-2.pdf residue behind."""
    md_file = os.path.join(REPORTS, 'architecture_mindmap.md')
    pdf_file = os.path.join(REPORTS, 'architecture_mindmap.pdf')

    if not os.path.exists(md_file):
        print(f"  ERROR: {md_file} not found")
        return False

    # Sweep temp dirs left by a crashed previous run (same-drive guard)
    for stale in glob.glob(os.path.join(REPORTS, 'archpdf_*')):
        if os.path.isdir(stale):
            shutil.rmtree(stale, ignore_errors=True)

    # Temp dir must live on the SAME drive as the target: os.replace fails
    # with WinError 17 when the system temp drive differs from the repo drive.
    tmp_dir = tempfile.mkdtemp(prefix='archpdf_', dir=REPORTS)
    try:
        tmp_base = os.path.join(tmp_dir, 'architecture_mindmap')
        pdfs = run_mmdc(md_file, tmp_base + '.pdf')

        if len(pdfs) == 0:
            print(f'  Skipped: render failed — keeping existing {pdf_file}')
            return False
        if len(pdfs) == 1:
            merged_tmp = pdfs[0]
        else:
            merged_tmp = os.path.join(tmp_dir, 'architecture_mindmap_merged.pdf')
            if not merge_pdfs(pdfs, merged_tmp):
                print(f'  Skipped: merge failed — keeping existing {pdf_file}')
                return False

        # Success — replace the old PDF and drop stale page residue (if any)
        os.replace(merged_tmp, pdf_file)
        base = pdf_file.replace('.pdf', '')
        for old in glob.glob(base + '-*.pdf'):
            try:
                os.remove(old)
            except OSError:
                pass

        size_kb = os.path.getsize(pdf_file) / 1024
        print(f"  {pdf_file} ({size_kb:.0f} KB)")
        return True
    finally:
        shutil.rmtree(tmp_dir, ignore_errors=True)


def generate_testplan_html():
    """Generate a standalone HTML from test plan markdown.
    The user can open this in a browser and Print → Save as PDF.
    """
    md_file = os.path.join(TEST_PLAN_DIR, 'VHDL2008_Grammar_Semantic_Test_Plan.md')
    html_file = os.path.join(TEST_PLAN_DIR, 'VHDL2008_Test_Plan_latest.html')

    if not os.path.exists(md_file):
        print(f"  ERROR: {md_file} not found")
        return False

    # Convert MD to HTML via pandoc
    result = subprocess.run(
        ['pandoc', md_file, '-o', html_file, '--standalone',
         '--metadata', 'title=VHDL 2008 Grammar Semantic Test Plan',
         '--toc', '--toc-depth=2'],
        capture_output=True, text=True, timeout=120,
        encoding='utf-8', errors='replace'
    )
    if result.returncode != 0:
        print(f"  pandoc error: {result.stderr[:200]}")
        return False

    # Inject mermaid support + print-friendly CSS
    with open(html_file, 'r', encoding='utf-8') as f:
        html = f.read()

    mermaid_cdn = '<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>'
    html = html.replace('</head>', mermaid_cdn + '\n' + CSS_STYLE + '\n</head>')
    html = re.sub(r'<pre class="mermaid"><code>', '<div class="mermaid">\n', html)
    html = re.sub(r'</code></pre>', '\n</div>', html)
    html = html.replace('</body>',
                         '<script>mermaid.initialize({startOnLoad:true,theme:"default"});</script>\n</body>')

    with open(html_file, 'w', encoding='utf-8') as f:
        f.write(html)

    size_kb = os.path.getsize(html_file) / 1024
    print(f"  {html_file} ({size_kb:.0f} KB)")
    print(f"  Open this file in browser, then Ctrl+P → Save as PDF")
    return True


def extract_mermaid_blocks(md_text):
    """Extract fenced ```mermaid blocks from the RAW markdown (not pandoc HTML —
    pandoc escapes entities inside code blocks)."""
    return re.findall(r'```mermaid\n(.*?)```', md_text, re.DOTALL)


def render_mermaid_svg(mmd_code, index):
    """Render one mermaid block to SVG via mmdc. Returns svg text or None."""
    mmdc = find_mmdc()
    if not mmdc:
        print("  ERROR: mmdc not found. Install: npm install -g @mermaid-js/mermaid-cli")
        return None

    env = os.environ.copy()
    env['PATH'] = NODE_PATH_DIR + os.pathsep + NPM_BIN + os.pathsep + env.get('PATH', '')
    env['NODE_PATH'] = os.path.join(NPM_BIN, 'node_modules')

    with tempfile.TemporaryDirectory(prefix='mmd_') as tmp:
        mmd_file = os.path.join(tmp, f'block{index}.mmd')
        svg_file = os.path.join(tmp, f'block{index}.svg')
        with open(mmd_file, 'w', encoding='utf-8') as f:
            f.write(mmd_code)
        try:
            result = subprocess.run(
                [mmdc, '-i', mmd_file, '-o', svg_file, '-b', 'transparent', '-s', '1'],
                env=env, capture_output=True, text=True, timeout=180,
                encoding='utf-8', errors='replace')
        except subprocess.TimeoutExpired:
            print(f'  mmdc timeout rendering mermaid block #{index}')
            return None
        if not os.path.exists(svg_file):
            err = result.stderr.strip()[:300] if result.stderr else 'unknown'
            print(f'  mmdc svg error (block #{index}): {err}')
            return None
        with open(svg_file, 'r', encoding='utf-8', errors='replace') as f:
            return f.read()


def build_arch_html():
    """Generate self-contained architecture HTML: pandoc md→html with mermaid
    blocks replaced by inline SVG (mmdc-rendered) — works offline/intranet.
    Falls back to CDN mermaid.js if SVG rendering fails, so sync never hard-fails."""
    md_file = os.path.join(REPORTS, 'architecture_mindmap.md')

    if not os.path.exists(md_file):
        print(f"  ERROR: {md_file} not found")
        return False

    with open(md_file, 'r', encoding='utf-8') as f:
        md_text = f.read()

    # 1. Render mermaid blocks from the RAW markdown to SVG
    blocks = extract_mermaid_blocks(md_text)
    svgs = [render_mermaid_svg(b, i) for i, b in enumerate(blocks)]

    # 2. pandoc md → html
    result = subprocess.run(
        ['pandoc', md_file, '-o', ARCH_HTML, '--standalone',
         '--metadata', 'title=VHDL 2008 Test Suite — Architecture'],
        capture_output=True, text=True, timeout=120,
        encoding='utf-8', errors='replace'
    )
    if result.returncode != 0:
        print(f"  pandoc error: {result.stderr[:200]}")
        return False

    with open(ARCH_HTML, 'r', encoding='utf-8') as f:
        html = f.read()

    # 3. Replace pandoc's <pre class="mermaid"> blocks with inline SVGs
    pre_pattern = re.compile(r'<pre class="mermaid"><code>.*?</code></pre>', re.DOTALL)
    n_pre = len(pre_pattern.findall(html))

    if n_pre == len(svgs) and all(svgs):
        for svg in svgs:
            html, _ = pre_pattern.subn(
                lambda m, svg=svg: f'<div class="mermaid">\n{svg}\n</div>', html, count=1)
        html = html.replace('</head>', CSS_STYLE + '\n</head>')
        mode = 'inline SVG (offline)'
    else:
        # Fallback: CDN mermaid.js (needs network) — sync must never hard-fail
        print(f'  WARNING: SVG render mismatch ({len(svgs)} svg vs {n_pre} pre blocks) — '
              f'falling back to CDN mermaid.js')
        mermaid_cdn = '<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>'
        html = html.replace('</head>', mermaid_cdn + '\n' + CSS_STYLE + '\n</head>')
        html = re.sub(r'<pre class="mermaid"><code>', '<div class="mermaid">\n', html)
        html = re.sub(r'</code></pre>', '\n</div>', html)
        html = html.replace('</body>',
                            '<script>mermaid.initialize({startOnLoad:true,theme:"default"});</script>\n</body>')
        mode = 'CDN mermaid (fallback)'

    with open(ARCH_HTML, 'w', encoding='utf-8') as f:
        f.write(html)

    size_kb = os.path.getsize(ARCH_HTML) / 1024
    print(f"  {ARCH_HTML} ({size_kb:.0f} KB, {mode})")
    return True


def build_portal():
    """Regenerate reports/index.html — static navigation portal for all reports."""
    rows = '\n'.join(
        f'    <tr><td><a href="{href}">{href}</a></td><td>{desc}</td></tr>'
        for href, desc in PORTAL_LINKS
    )
    now = datetime.now().strftime('%Y-%m-%d %H:%M')
    page = f'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reports Portal — VHDL 2008 Test Suite</title>
{CSS_STYLE}
</head>
<body>
<h1>Reports Portal</h1>
<p>VHDL 2008 Grammar &amp; Semantic Test Suite — entry point for all reports. Auto-generated on {now}, regenerated by <code>generate_arch_pdf.py --portal</code>.</p>
<table>
  <tr><th>File</th><th>Description</th></tr>
{rows}
</table>
<p><strong>Verified by:</strong> <code>python3 sync_all.py --verify-only</code> — must show 0 issues found.</p>
</body>
</html>
'''
    with open(PORTAL_HTML, 'w', encoding='utf-8') as f:
        f.write(page)
    size_kb = os.path.getsize(PORTAL_HTML) / 1024
    print(f"  {PORTAL_HTML} ({size_kb:.0f} KB)")
    return True


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description='Report renderer: PDF + self-contained HTML + portal')
    parser.add_argument('--mindmap', action='store_true', help='Architecture mindmap PDF')
    parser.add_argument('--archhtml', action='store_true', help='Architecture self-contained HTML (inline SVG)')
    parser.add_argument('--testplan', action='store_true', help='Test plan HTML')
    parser.add_argument('--portal', action='store_true', help='Reports portal index.html')
    parser.add_argument('--all', action='store_true', help='All outputs')
    args = parser.parse_args()

    if not (args.mindmap or args.archhtml or args.testplan or args.portal or args.all):
        args.all = True

    if args.all or args.mindmap:
        print('[Mindmap PDF]')
        generate_mindmap_pdf()

    if args.all or args.archhtml:
        print('[Architecture HTML]')
        build_arch_html()

    if args.all or args.testplan:
        print('[Test Plan HTML]')
        generate_testplan_html()

    # Portal LAST so every artifact it links to already exists
    if args.all or args.portal:
        print('[Reports Portal]')
        build_portal()
