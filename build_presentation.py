#!/usr/bin/env python3
"""Generate the work-report presentation (presentation/index.html).

Architecture component: auto-called by sync_all.py --quick. Self-contained
output — inline CSS + inline SVG (mmdc-rendered mermaid) + inline vanilla JS
(SVG viewer engine, layered drill-down architecture diagram, accordions,
scrollspy). No CDN.

All dynamic numbers are injected from live scans (cases_src walk, GHDL result
parse, .claude/ dir scan); the layered drill-down chart renders generically
from the architecture spec JSON ({{ARCH_SPEC}} = project_facts.
extract_arch_spec() over architecture_mindmap.md §2.2–§2.5 — the single
source of truth); the §8.5 debt table mirrors the test plan's Active Items;
historical narrative stays hand-maintained. A `PRESENTATION_SNAPSHOT` marker
is embedded for sync_all.py's verify_presentation() freshness gate.

Usage: python3 build_presentation.py
"""

import os
import re
import sys
import csv
import json
import html as html_mod
import shutil
import tempfile
import subprocess
from collections import Counter

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

ROOT = os.path.dirname(os.path.abspath(__file__))
PRES_DIR = os.path.join(ROOT, 'presentation')
MINDMAP_MD = os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports', 'architecture_mindmap.md')
CASES_SRC = os.path.join(ROOT, 'vhdl2008_grammar_test', 'test_case_db', 'cases_src')
GHDL_RESULTS = os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports', 'ghdl_test_results.md')
TEST_PLAN = os.path.join(ROOT, 'vhdl2008_grammar_test', 'test_plan',
                         'VHDL2008_Grammar_Semantic_Test_Plan.md')
GHDL_ALLOWLIST = os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports',
                              'ghdl_allowlist.csv')
SKILLS_DIR = os.path.join(ROOT, '.claude', 'skills')
AGENTS_DIR = os.path.join(ROOT, '.claude', 'agents')
LEGACY_DIR = os.path.join(ROOT, 'legacy_scripts')
ASSETS_DIR = os.path.join(PRES_DIR, 'assets')

try:
    import project_facts
except ImportError:  # belt-and-braces: the script dir is always on sys.path when run directly
    sys.path.insert(0, ROOT)
    import project_facts

NPM_BIN = os.path.expanduser(r'~\AppData\Roaming\npm')
NODE_PATH_DIR = r'C:\Program Files\nodejs'

ATTACHMENTS = [
    (os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports', 'architecture_mindmap.pdf'),
     'architecture_mindmap.pdf'),
    (os.path.join(ROOT, 'vhdl2008_grammar_test', 'test_plan', 'VHDL2008_Test_Plan_latest.html'),
     'VHDL2008_Test_Plan_latest.html'),
    (os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports', 'coverage_summary.md'),
     'coverage_summary.md'),
    (os.path.join(ROOT, 'vhdl2008_grammar_test', 'reports', 'ghdl_test_results.md'),
     'ghdl_test_results.md'),
    (os.path.join(ROOT, 'PRODUCTION_TRACKER.md'),
     'PRODUCTION_TRACKER.md'),
]


def find_mmdc():
    for d in [NPM_BIN] + os.environ.get('PATH', '').split(os.pathsep):
        for name in ['mmdc.cmd', 'mmdc']:
            p = os.path.join(d, name)
            if os.path.exists(p):
                return p
    return None


def render_svg(mmd_text, name):
    mmdc = find_mmdc()
    if not mmdc:
        print(f'  WARN: mmdc not found — {name} skipped')
        return None
    env = os.environ.copy()
    env['PATH'] = NODE_PATH_DIR + os.pathsep + NPM_BIN + os.pathsep + env.get('PATH', '')
    env['NODE_PATH'] = os.path.join(NPM_BIN, 'node_modules')
    with tempfile.TemporaryDirectory(prefix='pres_') as tmp:
        mmd_file = os.path.join(tmp, name + '.mmd')
        svg_file = os.path.join(tmp, name + '.svg')
        with open(mmd_file, 'w', encoding='utf-8') as f:
            f.write(mmd_text)
        try:
            result = subprocess.run(
                [mmdc, '-i', mmd_file, '-o', svg_file, '-b', 'transparent', '-s', '1'],
                env=env, capture_output=True, text=True, timeout=180,
                encoding='utf-8', errors='replace')
        except subprocess.TimeoutExpired:
            print(f'  WARN: mmdc timeout — {name} skipped')
            return None
        if not os.path.exists(svg_file):
            err = result.stderr.strip()[:300] if result.stderr else 'unknown'
            print(f'  WARN: mmdc error ({name}): {err}')
            return None
        with open(svg_file, 'r', encoding='utf-8', errors='replace') as f:
            return pad_viewbox(f.read())


def pad_viewbox(svg_text, pad=16):
    m = re.search(r'viewBox="([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)"', svg_text)
    if not m:
        return svg_text
    x, y, w, h = (float(m.group(i)) for i in range(1, 5))
    new = 'viewBox="{:.1f} {:.1f} {:.1f} {:.1f}"'.format(x - pad, y - pad, w + 2 * pad, h + 2 * pad)
    return svg_text.replace(m.group(0), new, 1)


def extract_mermaid_blocks(md_text):
    return re.findall(r'```mermaid\n(.*?)```', md_text, re.DOTALL)


def chapter_stats():
    """Per-chapter folder/file counts computed live from cases_src."""
    rows = []
    total_files = total_folders = 0
    for ch in sorted(os.listdir(CASES_SRC)):
        p = os.path.join(CASES_SRC, ch)
        if not os.path.isdir(p) or not ch.startswith('ch'):
            continue
        n_files = n_folders = 0
        for sub in os.listdir(p):
            sp = os.path.join(p, sub)
            if os.path.isdir(sp):
                n_folders += 1
                n_files += sum(1 for f in os.listdir(sp) if f.endswith('.vhd'))
        rows.append((ch, n_folders, n_files))
        total_folders += n_folders
        total_files += n_files
    return rows, total_folders, total_files


def ghdl_chapter_rows():
    """Parse the By-Chapter table from ghdl_test_results.md."""
    rows = []
    if os.path.exists(GHDL_RESULTS):
        with open(GHDL_RESULTS, 'r', encoding='utf-8') as f:
            text = f.read()
        m = re.search(r'## By Chapter(.*?)(\n## |\Z)', text, re.DOTALL)
        if m:
            for line in m.group(1).splitlines():
                mm = re.match(r'\|\s*(\S+?)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|', line)
                if mm and mm.group(1) != 'Chapter':
                    rows.append((mm.group(1), mm.group(2), mm.group(3)))
    return rows


def type_counts():
    """SYN/SNN/SEM/SMN file counts by filename marker (same rule as sync scan)."""
    c = Counter()
    for _, _, fnames in os.walk(CASES_SRC):
        for f in fnames:
            if not f.endswith('.vhd'):
                continue
            if '_SYN_' in f:
                c['SYN'] += 1
            elif '_SNN_' in f:
                c['SNN'] += 1
            elif '_SMN_' in f:
                c['SMN'] += 1
            elif '_SEM_' in f:
                c['SEM'] += 1
    return c


def specific_stats():
    """SYN_S specific-test file count + folder coverage (files with SYN_S)."""
    n_files = 0
    folders_with = 0
    folders_total = 0
    for root, _, fnames in os.walk(CASES_SRC):
        vhds = [f for f in fnames if f.endswith('.vhd')]
        if vhds:
            folders_total += 1
        has = any('_SYN_S' in f for f in vhds)
        n_files += sum(1 for f in vhds if '_SYN_S' in f)
        if has:
            folders_with += 1
    return n_files, folders_with, folders_total


def tf_cjk_count():
    """Count Test Focus lines that still contain Chinese chars (INFO-level style-debt counter)."""
    n = 0
    tf_re = re.compile(r'--\s*Test Focus\s*:\s*(.+)')
    cjk_re = re.compile(r'[\u4e00-\u9fff]')
    for root, _, fnames in os.walk(CASES_SRC):
        for f in fnames:
            if not f.endswith('.vhd'):
                continue
            try:
                with open(os.path.join(root, f), encoding='utf-8', errors='replace') as fh:
                    for _ in range(40):
                        line = fh.readline()
                        if not line:
                            break
                        m = tf_re.match(line)
                        if m:
                            if cjk_re.search(m.group(1)):
                                n += 1
                            break
            except Exception:
                pass
    return n


def ghdl_matrix():
    """Parse ghdl_test_results.md: date, tool, files tested, By-Type rows, Notes."""
    if not os.path.exists(GHDL_RESULTS):
        return None
    with open(GHDL_RESULTS, 'r', encoding='utf-8') as f:
        text = f.read()
    date_m = re.search(r'\*\*Date\*\*:\s*(.+)', text)
    tool_m = re.search(r'\*\*Tool\*\*:\s*(.+)', text)
    files_m = re.search(r'\*\*Files tested\*\*:\s*(\d+)', text)
    bt = re.search(r'## By Type(.*?)(\n## |\Z)', text, re.DOTALL)
    rows = []
    if bt:
        for line in bt.group(1).splitlines():
            m = re.match(r'\|\s*(\S+?)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*([\d.%\-]+)\s*\|', line)
            if m and m.group(1) != 'Type':
                rows.append((m.group(1), m.group(2), m.group(3), m.group(4)))
    notes = re.search(r'## Notes(.*?)(\n## |\Z)', text, re.DOTALL)
    note_rows = []
    if notes:
        for line in notes.group(1).splitlines():
            m = re.match(r'\|\s*(\S+?)\s*\|\s*(\d+)\s*\|\s*(.*?)\s*\|', line)
            if m and m.group(1) != 'Note':
                note_rows.append((m.group(1), m.group(2), m.group(3)))
    return {'date': date_m.group(1).strip() if date_m else '—',
            'tool': tool_m.group(1).strip() if tool_m else 'GHDL',
            'files': int(files_m.group(1)) if files_m else 0,
            'rows': rows, 'notes': note_rows}


def live_skills_agents():
    """Skills/agents from .claude/ dirs (same rule as sync_all's live scans)."""
    skills = sorted(f.replace('.md', '') for f in os.listdir(SKILLS_DIR) if f.endswith('.md')) \
        if os.path.isdir(SKILLS_DIR) else []
    agents = sorted(f.replace('.md', '') for f in os.listdir(AGENTS_DIR) if f.endswith('.md')) \
        if os.path.isdir(AGENTS_DIR) else []
    return skills, agents


def live_root_scripts():
    """Root *.py scripts (legacy one-offs live under legacy_scripts/ — a dir)."""
    return sorted(f for f in os.listdir(ROOT) if f.endswith('.py'))


def debt_rows():
    """Parse the hand-maintained §8.5 Active Items table of the Test Plan and
    render Category / Item / Status rows (Count/Scope, Owner and Destination
    columns dropped). The debt chapter keeps its internal numbers — it is
    hand-maintained prose with its own verify gate (verify_debt_chapter)."""
    if not os.path.exists(TEST_PLAN):
        return '<tr><td colspan="3">(test plan not found)</td></tr>'
    with open(TEST_PLAN, 'r', encoding='utf-8', errors='replace') as f:
        text = f.read()
    m = re.search(r'### Active Items\s*(.*?)\s*### Migration Log', text, re.DOTALL)
    if not m:
        return '<tr><td colspan="3">(unable to parse §8.5 Active Items — '
        'run sync_all.py --quick)</td></tr>'
    rows = []
    for line in m.group(1).splitlines():
        line = line.strip()
        if not line.startswith('|'):
            continue
        cells = [c.strip() for c in line.strip('|').split('|')]
        if len(cells) < 6:
            continue  # header / separator rows
        cat, item, status = cells[0], cells[1], cells[4]
        if cat.lower() == 'category' or all(
                set(c) <= set('-: ') for c in cells):
            continue
        rows.append(f'        <tr><td>{html_mod.escape(cat)}</td>'
                    f'<td>{html_mod.escape(item)}</td>'
                    f'<td>{html_mod.escape(status)}</td></tr>')
    if not rows:
        return '<tr><td colspan="3">(no active items)</td></tr>'
    return '\n'.join(rows)


def allowlist_rows():
    """Live count of ghdl_allowlist.csv data rows (the gap catalog size)."""
    if not os.path.exists(GHDL_ALLOWLIST):
        return 0
    try:
        with open(GHDL_ALLOWLIST, 'r', encoding='utf-8-sig') as f:
            return max(0, len(list(csv.DictReader(f))))
    except Exception:
        return 0


TIMELINE_MMD = """timeline
  title Iteration and Evolution Timeline 2026-07-23 to 2026-08-20
  Phase 1 Batch Generation Kickoff : 07-23 : 1,347 files : templating problems exposed
  Phase 2 Restructure and De-templating : 07-28 : chapterized, de-templated : 5 agents handwriting in parallel
  Phase 3 Scale-up Completed : 08-06 : 319 productions DONE : recurring doc drift
  Phase 4 External Verification Campaign : 08-19 : GHDL 1,251 failures to 0 : four-way-classification fixes
  Phase 5 Architecture Autonomy : 08-20 : GHDL into the loop : debt chapter, architect team
"""

# ---------------------------------------------------------------------------
# HTML template
# ---------------------------------------------------------------------------
TEMPLATE = r'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VHDL 2008 Test Suite — Work Report</title>
<style>
  :root { --ink:#1a1a1a; --muted:#5a6b7b; --accent:#16324f; --accent2:#2c6b9c; --bg:#eef2f6; --card:#ffffff; --line:#dde4ec; }
  * { box-sizing:border-box; }
  html { scroll-behavior:smooth; }
  body { font-family:"Microsoft YaHei",-apple-system,sans-serif; color:var(--ink); background:var(--bg); margin:0; line-height:1.75; }
  nav { position:sticky; top:0; z-index:99; background:rgba(22,50,79,.97); backdrop-filter:blur(4px); padding:10px 1.5vw; display:flex; flex-wrap:wrap; gap:2px 12px; justify-content:center; box-shadow:0 2px 10px rgba(0,0,0,.22); }
  nav a { color:#c9d9ea; text-decoration:none; font-size:clamp(.78rem, 1vw, .92rem); padding:5px 10px; border-radius:6px; transition:background .15s,color .15s; }
  nav a:hover { background:rgba(255,255,255,.14); color:#fff; }
  nav a.active { background:#fff; color:var(--accent); font-weight:600; }
  header.hero { background:linear-gradient(135deg,#16324f 0%,#1d4e7a 55%,#2c6b9c 100%); color:#fff; text-align:center; padding:clamp(40px,6vh,72px) 2vw clamp(36px,5vh,60px); }
  header.hero h1 { font-size:clamp(1.6rem, 3.2vw, 2.6rem); margin:0 0 10px; letter-spacing:1px; }
  header.hero .sub { color:#d5e4f2; max-width:min(920px,80vw); margin:8px auto 0; font-size:clamp(.92rem, 1.15vw, 1.08rem); }
  header.hero .sub a { color:#ffd28a; text-decoration:underline; }
  header.hero .meta { color:#9fbdd8; font-size:.9em; margin-top:14px; }
  main { width:100%; max-width:none; padding:0 clamp(12px, 2.5vw, 44px) 90px; }
  section { background:var(--card); border:1px solid var(--line); border-radius:14px; padding:clamp(20px, 2.2vw, 36px) clamp(18px, 2.2vw, 40px); margin-top:clamp(18px, 2.4vw, 32px); box-shadow:0 2px 8px rgba(22,50,79,.06); }
  section > h2 { display:flex; align-items:center; gap:12px; font-size:clamp(1.18rem, 1.8vw, 1.5rem); color:var(--accent); border-bottom:2px solid var(--accent2); padding-bottom:10px; margin:0 0 16px; }
  section > h2 .no { background:var(--accent2); color:#fff; font-size:.72em; border-radius:8px; padding:2px 10px; letter-spacing:1px; }
  h3 { color:var(--accent2); margin:24px 0 10px; font-size:clamp(1.02rem, 1.25vw, 1.14rem); }
  h4 { margin:0 0 6px; color:var(--accent); font-size:1em; }
  h5 { margin:10px 0 4px; color:var(--accent); font-size:.95em; }
  p { margin:8px 0; }
  code { background:#eef3f8; padding:1px 6px; border-radius:4px; font-size:.88em; color:#23486b; }
  table { border-collapse:collapse; width:100%; margin:12px 0; font-size:clamp(.8rem, .95vw, .89rem); }
  th,td { border:1px solid #d3dce5; padding:7px 11px; text-align:left; vertical-align:top; }
  th { background:#e9f0f7; color:var(--accent); white-space:nowrap; }
  tr.anchor-row { scroll-margin-top:70px; }
  .cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(180px,1fr)); gap:clamp(10px,1.2vw,16px); margin-top:16px; }
  .card { background:linear-gradient(160deg,#f3f7fb,#eaf1f8); border:1px solid var(--line); border-radius:12px; padding:20px 14px; text-align:center; }
  .card .num { font-size:clamp(1.4rem, 2vw, 1.9rem); font-weight:700; color:var(--accent2); line-height:1.2; }
  .card .lbl { font-size:clamp(.76rem, .9vw, .86rem); color:var(--muted); margin-top:6px; }
  .grid2 { display:grid; grid-template-columns:minmax(0,1.15fr) minmax(0,.85fr); gap:clamp(14px,2vw,26px); align-items:start; }
  @media (max-width:960px) { .grid2 { grid-template-columns:1fr; } }
  .gates { display:grid; gap:10px; }
  .gate { background:#f4f8fc; border:1px solid var(--line); border-left:4px solid var(--accent2); border-radius:8px; padding:12px 14px; font-size:.9em; }
  .gate b { color:var(--accent); }
  /* ---- bento ---- */
  .bento { display:grid; grid-template-columns:repeat(4,1fr); gap:clamp(10px,1.3vw,16px); }
  .bento .cell { grid-column:span 2; background:#f4f8fc; border:1px solid var(--line); border-radius:12px; padding:16px 18px; font-size:.9em; }
  @media (max-width:760px) { .bento { grid-template-columns:1fr; } .bento .cell { grid-column:span 1; } }
  /* ---- layered drill-down architecture diagram ---- */
  .drill-bar { display:flex; align-items:center; gap:10px; flex-wrap:wrap; margin-bottom:12px; }
  .drill-bar .crumb { font-size:.85em; color:var(--muted); }
  .drill-bar .crumb b { color:var(--accent2); }
  .drill-bar button { border:1px solid #c6d4e2; background:#fff; color:var(--accent); border-radius:6px; padding:3px 11px; font-size:.8em; cursor:pointer; margin-left:auto; }
  .drill-bar button:hover { background:var(--accent2); color:#fff; }
  .drill-l1 { display:grid; grid-template-columns:repeat(auto-fit,minmax(190px,1fr)); gap:12px; }
  .dnode { border:1px solid var(--line); border-radius:12px; background:#fff; padding:14px 16px; cursor:pointer; transition:box-shadow .15s,transform .15s; position:relative; }
  .dnode:hover { box-shadow:0 4px 14px rgba(22,50,79,.14); transform:translateY(-2px); }
  .dnode .bar { position:absolute; left:0; top:0; bottom:0; width:6px; min-width:0; height:auto; padding:0; border-radius:12px 0 0 12px; }
  .dnode .dn { font-weight:700; color:var(--accent); font-size:.98em; }
  .dnode .dt { display:inline-block; font-size:.72em; border-radius:9px; padding:0 8px; margin-left:6px; color:#fff; }
  .dnode .do { color:var(--muted); font-size:.8em; margin-top:4px; }
  .dnode .cnt { position:absolute; right:10px; top:10px; background:#eef3f8; border-radius:10px; font-size:.72em; padding:0 8px; color:var(--muted); }
  .dnode .exp { font-size:.74em; color:var(--accent2); margin-top:6px; }
  .dnode.single { cursor:pointer; }
  .drill-l2 { margin-top:14px; padding:14px 16px 14px 22px; background:#f6f9fc; border:1px dashed #c6d4e2; border-radius:12px; display:none; }
  .drill-l2.open { display:block; }
  .drill-l2 .l2title { font-size:.86em; color:var(--accent2); font-weight:700; margin-bottom:10px; }
  .l2grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(240px,1fr)); gap:10px; }
  .l2node { border:1px solid var(--line); border-radius:10px; background:#fff; padding:11px 14px; cursor:pointer; transition:box-shadow .15s; }
  .l2node:hover, .l2node.on { box-shadow:0 2px 10px rgba(22,50,79,.16); border-color:var(--accent2); }
  .l2node .dn { font-weight:600; color:var(--accent); font-size:.92em; }
  .l2node .dt { display:inline-block; font-size:.7em; border-radius:9px; padding:0 8px; margin-left:6px; color:#fff; background:var(--accent2); }
  .l2node .do { color:var(--muted); font-size:.78em; margin-top:3px; }
  .drill-detail { margin-top:14px; border:1px solid var(--accent2); border-radius:12px; background:#fbfdff; padding:16px 20px; display:none; }
  .drill-detail.open { display:block; }
  .drill-detail .dhead { display:flex; align-items:center; gap:10px; flex-wrap:wrap; }
  .drill-detail .dhead b { color:var(--accent); font-size:1.02em; }
  .drill-detail .dclose { margin-left:auto; border:1px solid #c6d4e2; background:#fff; border-radius:6px; font-size:.78em; padding:2px 10px; cursor:pointer; color:var(--muted); }
  .drill-detail table { font-size:.85em; }
  .drill-detail ol, .drill-detail ul { margin:6px 0; padding-left:22px; font-size:.88em; }
  /* ---- SVG viewer ---- */
  .viewer { border:1px solid var(--line); border-radius:12px; background:#fbfcfe; margin:14px 0; }
  .viewer-bar { display:flex; align-items:center; gap:6px; padding:8px 12px; background:#eef3f8; border-radius:12px 12px 0 0; border-bottom:1px solid var(--line); flex-wrap:wrap; }
  .viewer-bar .cap { font-size:clamp(.78rem,.9vw,.84rem); color:var(--muted); margin-right:auto; padding-left:4px; }
  .viewer-bar button { border:1px solid #c6d4e2; background:#fff; color:var(--accent); border-radius:6px; padding:3px 11px; font-size:.8em; cursor:pointer; }
  .viewer-bar button:hover { background:var(--accent2); color:#fff; border-color:var(--accent2); }
  .viewer-stage { position:relative; height:62vh; min-height:420px; overflow:hidden; border-radius:0 0 12px 12px; cursor:grab; background:#fff; }
  .viewer-stage.dragging { cursor:grabbing; }
  .viewer-stage .wrap { position:absolute; left:50%; top:50%; transform-origin:center center; }
  .viewer-stage svg { display:block; max-width:none; height:auto; }
  .hint { font-size:.78em; color:var(--muted); margin:4px 0 0; }
  .lightbox { position:fixed; inset:0; background:rgba(10,20,32,.93); z-index:200; display:none; flex-direction:column; }
  .lightbox.open { display:flex; }
  .lightbox .lb-bar { display:flex; gap:6px; padding:10px 16px; align-items:center; flex-wrap:wrap; }
  .lightbox .lb-title { color:#c9d9ea; font-size:.86em; margin-right:auto; }
  .lightbox .lb-bar button { border:1px solid #5a7ea6; background:rgba(255,255,255,.08); color:#dbe7f3; border-radius:6px; padding:4px 12px; font-size:.82em; cursor:pointer; }
  .lightbox .lb-bar button:hover { background:#2c6b9c; }
  .lightbox .lb-canvas { flex:1; display:flex; align-items:center; justify-content:center; padding:0 2vw 2vh; }
  .lightbox .lb-stage { position:relative; width:96vw; height:88vh; background:#fff; border-radius:14px; box-shadow:0 14px 60px rgba(0,0,0,.55); overflow:hidden; cursor:grab; }
  .lightbox .lb-stage .wrap { position:absolute; left:50%; top:50%; transform-origin:center center; }
  .lightbox .lb-stage svg { display:block; max-width:none; height:auto; }
  /* ---- accordions ---- */
  details.phase { border:1px solid var(--line); border-radius:12px; background:#fbfcfe; margin:14px 0; overflow:hidden; }
  details.phase > summary { cursor:pointer; list-style:none; padding:16px 20px; display:flex; align-items:center; gap:12px; flex-wrap:wrap; background:linear-gradient(90deg,#f0f5fa,#fbfcfe); }
  details.phase > summary::-webkit-details-marker { display:none; }
  details.phase > summary:hover { background:#e8f0f8; }
  details.phase[open] > summary { border-bottom:1px solid var(--line); }
  details.phase .pno { background:var(--accent2); color:#fff; border-radius:9px; padding:2px 12px; font-size:.82em; letter-spacing:1px; }
  details.phase .ptitle { font-weight:700; color:var(--accent); font-size:1.02em; }
  details.phase .pwhen { color:var(--muted); font-size:.84em; }
  details.phase .pstat { margin-left:auto; color:var(--accent2); font-size:.84em; white-space:nowrap; }
  details.phase .arrow { margin-left:6px; color:var(--muted); transition:transform .2s; }
  details.phase[open] .arrow { transform:rotate(90deg); }
  details.phase .pbody { padding:18px 22px; }
  .substeps { margin:10px 0 14px; padding-left:0; list-style:none; }
  .substeps li { position:relative; padding:5px 0 5px 20px; font-size:.9em; }
  .substeps li::before { content:""; position:absolute; left:4px; top:13px; width:8px; height:8px; border-radius:50%; background:var(--accent2); }
  .substeps li .d { color:var(--accent2); font-weight:600; margin-right:6px; }
  .pain { background:#fdf3f0; border:1px solid #f2d4c9; border-left:4px solid #b5483f; border-radius:8px; padding:11px 14px; margin:12px 0; font-size:.9em; }
  .gain { background:#f0f7f2; border:1px solid #cfe5d5; border-left:4px solid #3f9d5e; border-radius:8px; padding:11px 14px; margin:12px 0; font-size:.9em; }
  .scripts { display:flex; flex-wrap:wrap; gap:6px; margin:10px 0; }
  .scripts span { background:#eef2f6; border:1px solid var(--line); color:#41586f; border-radius:6px; padding:1px 9px; font-size:.78em; font-family:Consolas,monospace; }
  .xlink { color:var(--accent2); text-decoration:none; border-bottom:1px dashed var(--accent2); }
  .xlink:hover { background:#e8f0f8; }
  /* ---- bars ---- */
  .bar-row { display:flex; align-items:center; gap:12px; margin:8px 0; font-size:.86em; }
  .bar-row .lbl { width:clamp(150px,18vw,260px); text-align:right; color:var(--muted); flex-shrink:0; }
  .bar-track { flex:1; background:#e9eef4; border-radius:6px; height:24px; overflow:hidden; }
  .bar { height:100%; background:linear-gradient(90deg,#2c6b9c,#4a90c2); color:#fff; padding-left:9px; line-height:24px; font-size:.8em; white-space:nowrap; border-radius:6px 0 0 6px; min-width:52px; }
  .bar.red { background:linear-gradient(90deg,#b5483f,#d4734a); }
  /* ---- attachments ---- */
  .att { display:grid; grid-template-columns:repeat(auto-fit,minmax(300px,1fr)); gap:12px; }
  .att a { display:block; background:#f2f6fa; border:1px solid var(--line); border-radius:10px; padding:14px 18px; text-decoration:none; color:var(--accent2); font-weight:600; transition:background .15s,transform .15s; }
  .att a:hover { background:#e8f0f8; transform:translateY(-2px); }
  .att a span { display:block; color:var(--muted); font-weight:400; font-size:.8em; margin-top:3px; }
  .foot { text-align:center; color:var(--muted); font-size:.84em; margin-top:34px; }
  #toTop { position:fixed; right:22px; bottom:26px; width:42px; height:42px; border-radius:50%; border:none; background:var(--accent2); color:#fff; font-size:18px; cursor:pointer; box-shadow:0 3px 10px rgba(0,0,0,.25); display:none; z-index:150; }
  @media (max-width:800px) { .viewer-stage { height:48vh; } .bar-row .lbl { width:120px; } section { padding:18px 14px; } }
  @media print { nav, #toTop, .viewer-bar, header.hero { display:none; } section { box-shadow:none; border:none; } }
</style>
</head>
<body>
<nav id="top">
  <a href="#overview">Overview</a><a href="#numbers">Key Results</a><a href="#arch">Current Architecture</a>
  <a href="#evolution">Iteration History</a><a href="#method">Methodology</a><a href="#trend">Data Trends</a>
  <a href="#future">Status &amp; Outlook</a><a href="#assets">Attachments</a>
</nav>

<header class="hero" id="overview">
  <h1>IEEE 1076-2008 Syntax &amp; Semantic Test Suite</h1>
  <p class="sub">GitHub: <a href="https://github.com/aaazcy/vhdl2008-grammar-test-suite">github.com/aaazcy/vhdl2008-grammar-test-suite</a> · this page is the work-report presentation for this project</p>
  <p class="sub">Covers all {{IN_SCOPE_BNF}} in-scope Annex C BNF productions + {{SEM_TOTAL}} core semantic rules, totaling <b>{{TOTAL_FILES}} test files</b>;
  fully verified by the public analyzer GHDL 6.0 with <b>0 failures</b>; an engineered system driven by an AI agent team, script-verified, and deliverable as an on-premises test system.</p>
  <p class="meta">Development period 2026-07-23 ~ 2026-08-20 (4 weeks) · AI agents lead, human review assists · this page is fully offline and self-contained</p>
</header>

<main>

<section id="numbers">
  <h2><span class="no">01</span>Key Result Numbers</h2>
  <div class="cards">
    <div class="card"><div class="num">{{TOTAL_FILES}}</div><div class="lbl">test files ({{N_CHAPTERS}} chapters / {{TOTAL_FOLDERS}} folders)</div></div>
    <div class="card"><div class="num">{{IN_SCOPE_BNF}}+{{SEM_TOTAL}}</div><div class="lbl">BNF productions + semantic rules, 100% coverage</div></div>
    <div class="card"><div class="num">0</div><div class="lbl">GHDL full-run failures ({{GHDL_FILES}} testable files)</div></div>
    <div class="card"><div class="num">{{SPEC_PCT}}%</div><div class="lbl">production-specific test coverage ({{SPEC_FOLDERS}}/{{TOTAL_FOLDERS}} folders, {{SPEC_FILES}} SYN_S)</div></div>
    <div class="card"><div class="num">{{N_SKILLS}}+{{N_AGENTS}}+{{N_SCRIPTS}}</div><div class="lbl">Skills + Agents + root scripts</div></div>
  </div>
  <div class="grid2">
    <div>
      <h3>Files by chapter (live count at build time)</h3>
      <table>
        <tr><th>Chapter</th><th>Production folders</th><th>Files</th></tr>
        <!--INJ:CHAPTERS-->{{CHAPTERS}}<!--/INJ:CHAPTERS-->
      </table>
    </div>
    <div>
      <h3>GHDL verification matrix ({{GHDL_DATE}} full run)</h3>
      <table>
        <tr><th>Verification type</th><th>PASS</th><th>FAIL</th></tr>
        <!--INJ:GHDL_MATRIX_ROWS-->{{GHDL_MATRIX_ROWS}}<!--/INJ:GHDL_MATRIX_ROWS-->
      </table>
      <p style="font-size:.82em;color:var(--muted)"><!--INJ:GHDL_NOTES-->{{GHDL_NOTES}}<!--/INJ:GHDL_NOTES--></p>
    </div>
  </div>
  <h3>GHDL verification by chapter (all green)</h3>
  <table>
    <tr><th>Chapter</th><th>PASS</th><th>FAIL</th></tr>
    <!--INJ:GHDL_CHAPTERS-->{{GHDL_CHAPTERS}}<!--/INJ:GHDL_CHAPTERS-->
  </table>
  <h3>Quality metrics</h3>
  <table>
    <tr><th>Metric</th><th>Value</th></tr>
    <tr><td>File type distribution (filename markers)</td><td><!--INJ:TYPE_COUNTS-->{{TYPE_COUNTS}}<!--/INJ:TYPE_COUNTS--></td></tr>
    <tr><td>Files with rich custom type declarations</td><td>spot-checked per chapter (quality-audit dimension 3)</td></tr>
    <tr><td>Complete compilable units (entity+architecture or pkg+body)</td><td>all files pass the GHDL full run (0 failures)</td></tr>
    <tr><td>Semantic-rule error injection across five categories</td><td>{{SEM_CATEGORIES}}</td></tr>
    <tr><td>VHDL 2008 new features</td><td>{{BNF_NEW}} new BNF productions + {{SEM_P0}} P0 semantic rules, 100% covered</td></tr>
  </table>
</section>

<section id="arch">
  <h2><span class="no">02</span>Current Architecture</h2>
  <p>The architecture is kept consistent with the filesystem by <code>sync_all.py --verify-only</code> ({{N_SKILLS}} skills, {{N_AGENTS}} agents, {{N_SCRIPTS}} root scripts, key-concept tokens — missing one errors out). The <b>layered drill-down diagram</b> below shows it: click a first-level card to expand that layer's members, click a member to see its full responsibility description.</p>

  <div class="drill-bar">
    <span class="crumb">Architecture / <b id="drill-crumb">Click the cards below to expand layer by layer</b></span>
    <button id="drill-all">Expand all</button>
    <button id="drill-none">Collapse all</button>
  </div>
  <div class="drill-l1" id="drill-l1"></div>
  <div class="drill-l2" id="drill-l2"></div>
  <div class="drill-detail" id="drill-detail"></div>

  <div class="grid2" style="margin-top:26px">
    <div>
      <h3>Layer responsibility table</h3>
      <table>
        <tr class="anchor-row" id="row-claude"><th>Orchestration</th><td>CLAUDE.md ({{IRON_RULES}} Iron Rules)</td><td>Tells the main agent when to call which skill / dispatch which agent; all methodology pushed down</td></tr>
        <tr class="anchor-row" id="row-skills"><th>Skills</th><td>{{SKILL_NAMES}}</td><td>Four protocols: generate / sync / audit / external verification</td></tr>
        <tr class="anchor-row" id="row-agents"><th>Agents</th><td>{{AGENT_NAMES}}</td><td>Doc sync, quality audit, project architecture upgrades, agent-system optimization — each owns a unique territory, none crosses boundaries</td></tr>
        <tr class="anchor-row" id="row-scripts"><th>Scripts</th><td>{{SCRIPT_NAMES}}</td><td>Unified sync + verify gate, traceability matrix, report rendering (PDF/HTML/portal), GHDL verifier, facts authority</td></tr>
        <tr class="anchor-row" id="row-docs"><th>Documents</th><td>{{DOC_NAMES}}</td><td>{{DOC_KINDS}} document kinds, fully generated or verify-checked</td></tr>
      </table>
    </div>
    <div>
      <h3>Three quality gates</h3>
      <div class="gates">
        <div class="gate"><b>① Content audit</b> — /quality-audit: five-dimension 12-Iron-Rule check (header quality / template residue / SNN error specificity / progressive complexity / VHDL body quality); violations must be fixed.</div>
        <div class="gate"><b>② External verification</b> — /ghdl-verify: full compile with the public tool GHDL; four-way failure classification (file bug / metadata misclassification / harness defect / tool gap); fix to 0 failures; tool gaps must be explicitly allowlisted with a reason.</div>
        <div class="gate"><b>③ Documentation consistency</b> — /doc-sync: unified sync_all.py sync + verify-only cross-check (§9 ↔ filesystem ↔ Tracker ↔ coverage ↔ appendix ↔ mindmap ↔ GHDL gate); 0 issues means done.</div>
      </div>
    </div>
  </div>

  <h3>Data flow (hover over the diagram and wheel to zoom · hold and drag to pan · double-click to smart fit)</h3>
  {{FLOW}}
  <h3>Data-flow step notes (expand to see each step's input / mechanism / output)</h3>
  <details class="phase" open><summary><span class="pno">Step 1</span><span class="ptitle">Generate</span><span class="pwhen">/vhdl-test-generator (fable)</span><span class="pstat">five-layer thinking → per-file handwriting → Iron Rule audit</span><i class="arrow">▶</i></summary>
    <div class="pbody">User request → main agent invokes the generation skill → 5-layer deep thinking (essence/variants/type usage/error modes/test dimensions) → handwrites VHD files into <code>cases_src/</code>.</div></details>
  <details class="phase"><summary><span class="pno">Step 2</span><span class="ptitle">Mandatory sync</span><span class="pwhen">/doc-sync (haiku) · Iron Rule #1</span><span class="pstat">must trigger after every file change</span><i class="arrow">▶</i></summary>
    <div class="pbody"><code>sync_all.py --quick</code> does it in one pass: Test Plan §3.1/§5.3/§6/§9, coverage report, tracker, generation log, architecture PDF/self-contained HTML/portal rendering.</div></details>
  <details class="phase"><summary><span class="pno">Step 3</span><span class="ptitle">Verify gate</span><span class="pwhen">sync_all.py --verify-only</span><span class="pstat">0 issues = the only definition of done</span><i class="arrow">▶</i></summary>
    <div class="pbody">Cross-checks the consistency groups (§9 counts / coverage totals / Tracker / Test Plan totals / Appendix E / mindmap skills-agents-scripts-tokens / <b>GHDL gate</b> / <b>§8.5 debt chapter</b> / <b>fact claims</b> / header-quality precheck); any inconsistency errors out immediately.</div></details>
  <details class="phase"><summary><span class="pno">Step 4</span><span class="ptitle">Independent content audit</span><span class="pwhen">/quality-audit (haiku)</span><span class="pstat">a parallel line to sync</span><i class="arrow">▶</i></summary>
    <div class="pbody">Runs the five-dimension 12-Iron-Rule check on generated files and reports the violation list to the main agent — the generator does not self-audit, the auditor does not modify.</div></details>
  <details class="phase"><summary><span class="pno">Step 5</span><span class="ptitle">GHDL fix loop</span><span class="pwhen">/ghdl-verify (fable) · Iron Rule #5</span><span class="pstat">four-way classification → fix → rerun to 0</span><i class="arrow">▶</i></summary>
    <div class="pbody">Run <code>run_ghdl_suite.py</code> → read the failure CSV → four-way classification (file bug / misclassification / harness / tool gap) → fix files or extend the allowlist (reason required) → rerun to 0 failures, then fold into sync.</div></details>
  <details class="phase"><summary><span class="pno">Step 6</span><span class="ptitle">Report rendering</span><span class="pwhen">generate_arch_pdf.py --all</span><span class="pstat">PDF + self-contained HTML + portal</span><i class="arrow">▶</i></summary>
    <div class="pbody">Architecture mindmap PDF (mmdc+PyPDF2), self-contained HTML (mermaid→inline SVG, viewable offline), Test Plan HTML, <code>reports/index.html</code> portal page — auto-refreshed on every sync.</div></details>

  <details class="phase" style="margin-top:18px">
    <summary><span class="pno">Reference</span><span class="ptitle">Full architecture mindmap SVG (large and complete, one-diagram overview; zoomable/fullscreen)</span><span class="pstat">mermaid mindmap rendering</span><i class="arrow">▶</i></summary>
    <div class="pbody">{{MINDMAP}}</div>
  </details>
</section>

<section id="evolution">
  <h2><span class="no">03</span>Iteration History — Problem-Driven</h2>
  <p>The timeline overview is below (zoomable/fullscreen); the 5 phases below it <b>expand on click</b> with the full story; a complete event-log table is at the end.</p>
  {{TIMELINE}}

  <details class="phase" id="phase1" open>
    <summary><span class="pno">Phase 1</span><span class="ptitle">Batch Generation Kickoff</span><span class="pwhen">07-23 ~ 07-28</span><span class="pstat">1,347 → 2,716 files</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><span class="d">07-23</span><b>First batch generation</b>: <code>batch_gen_all.py</code> generated 1,347 files from the BNF metadata CSV (930 syntax + 417 semantic), 310 productions, 9 modules, 100% metadata match — all productions covered in one day.</li>
        <li><span class="d">07-23</span><b>Predefined attributes special suite</b>: 37 attributes, one folder per attribute, attribute-specific error injection.</li>
        <li><span class="d">07-28</span><b>Architecture restructure day</b> (nine batches P1-P9): IEEE chapter structure rebuilt (12 dirs, 318 folders) → QSYN/QSNN quality batch (3,833) → semantic tests filed by production → 1,590 legacy-structure files deleted → 2,587 Q-prefix renames (167 conflicts handled one by one) → Appendix E traceability matrix (2,243 mappings) → Test Plan V2.0 + DOCX/HTML delivery.</li>
      </ul>
      <div class="pain"><b>Problems encountered:</b> script-templated generation — the same code skeleton repeated everywhere; "batch-shell" semantic tests of uneven quality; semantic and syntax tests mixed together; chaotic Q-prefix naming.</div>
      <div class="gain"><b>Mechanisms introduced:</b> 12 Iron Rules (one file one test point / progressive complexity / SNN errors must come from a specific BNF token / three-layer consistency ...); chapterized directories + unified naming conventions.</div>
      <div class="scripts"><span>batch_gen_all.py</span><span>gen_semantic_rules.py</span><span>build_attr_suite.py</span><span>parse_bnf.py</span><span>unify_naming.py</span></div>
      <p>Output: 2,716 files · 12 chapters · Appendix E 9,017 lines · <a class="xlink" href="#trend">see the file-count trajectory ↗</a></p>
    </div>
  </details>

  <details class="phase" id="phase2">
    <summary><span class="pno">Phase 2</span><span class="ptitle">Structure Restructure &amp; De-templating</span><span class="pwhen">07-28 ~ 07-29</span><span class="pstat">2,716 → 2,291 files (quality traded for quantity)</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><span class="d">07-29 09:27</span><b>First automated doc refresh</b>: <code>refresh_docs.py</code> + the CLAUDE.md prototype — the awareness that "docs auto-update after every file change" sprouted here (refresh_docs later evolved into sync_all.py).</li>
        <li><span class="d">09:33</span>Fixed the SEM/SMN double-counting in the coverage report.</li>
        <li><span class="d">P0-P4</span><b>Quality-tiered push</b>: 605 redundant template files deleted → 2,432 files.</li>
        <li><span class="d">Same day</span><b>Cross-chapter handwriting batch</b> (ch04/05/06/08/09/13/15): 1,576 zero-template pure-handwritten files.</li>
        <li><span class="d">From 13:25</span><b>5 agents in parallel</b> (ch04-ch15 shards): 14:04 interface declarations, 25 special tests; 17:22 all done — 956 template residues deleted, 700+ high-quality files added.</li>
      </ul>
      <div class="pain"><b>Problems encountered:</b> the inherent conflict between mass generation and "every file unique"; most folders had only thin base files; a single agent's serial throughput could not sustain 300+ productions.</div>
      <div class="gain"><b>Mechanisms introduced:</b> P0-P4 tiered progression; SYN_001 minimal → SYN_00N thorough → SYN_S production-specific tests; multi-agent parallel division of labor (one chapter per agent + shared audit protocol).</div>
      <div class="scripts"><span>enhance_quality.py</span><span>batch_ch06_round2.py</span><span>build_thorough.py</span><span>refresh_docs.py (sync_all predecessor)</span></div>
      <p>Output: 2,291 files (count shrunk 15%, quality fully upgraded) · <a class="xlink" href="#trend">see the file-count trajectory ↗</a></p>
    </div>
  </details>

  <details class="phase" id="phase3">
    <summary><span class="pno">Phase 3</span><span class="ptitle">Scale-Up Completed + Doc-Drift Defense</span><span class="pwhen">07-29 ~ 08-06</span><span class="pstat">2,291 → 5,187 files · 319 productions DONE</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><span class="d">08-04</span>Resumed after a multi-day break, entering the final sprint.</li>
        <li><span class="d">08-06</span>Largest chapter done: "ch05 ALL 50 DONE"; same day <b>all 319 productions (306 in scope) reached DONE</b>, 5,187 files, full 12-Iron-Rule check passed.</li>
      </ul>
      <div class="pain"><b>Problems encountered (this phase's core story) — repeated doc-stat drift:</b>
        ① §9 table column misalignment: 3 header columns but data rows written with only 2 values → file names landed in the "#" column and the "how to test" column went blank;<br>
        ② 84 files used ASCII <code>|</code> in Test Focus (the BNF alternative symbol) → blew up the markdown tables;<br>
        ③ Section 6 / Appendix E / PRODUCTION_TRACKER stats contradicted each other — "patch-style updates" fixed one place and missed two, silently going stale;<br>
        ④ Section 7 per-production details went unmaintained for a long time.<br>
        After rounds of "you always mess up the updates" feedback came the fundamental rethink: relying on a person to remember to update every number is impossible.</div>
      <div class="gain"><b>Mechanisms introduced:</b>
        ① <code>sync_all.py</code> unified sync — <b>full regeneration > line-by-line patches</b> (patches are the root cause of silent staleness);<br>
        ② <code>--verify-only</code> cross-check gate — "done" = 0 issues, by script not by memory;<br>
        ③ <code>render_test_table()</code> single table renderer (built-in column-count validation); <code>check_header_quality()</code> pre-generation precheck (pipes/missing);<br>
        ④ skill/agent separation of duties (generate fable / sync haiku / audit haiku); architecture mindmap + verify linkage (architecture changes must pass verification).</div>
      <div class="scripts"><span>sync_all.py</span><span>build_test_trace.py</span><span>generate_section7.py (legacy)</span></div>
      <p>Output: Test Plan V2.x, coverage report, tracker all auto-maintained · <a class="xlink" href="#method">see the verify-gate philosophy ↗</a></p>
    </div>
  </details>

  <details class="phase" id="phase4">
    <summary><span class="pno">Phase 4</span><span class="ptitle">External Verification Campaign</span><span class="pwhen">08-13 ~ 08-19</span><span class="pstat">GHDL 1,251 failures → 0</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><span class="d">08-19 first round</span>Full verification of 5,185 files with the public tool GHDL 6.0: SYN pass rate only 71.7%, SEM 45.9%, <b>1,251 failures</b>.</li>
        <li><span class="d">Classification</span><b>four-way failure classification</b>: A real file bugs ~560 · B metadata misclassification ~200 · C harness defects ~260 · D GHDL 6.0's own gaps ~45.</li>
        <li><span class="d">Class C</span>four harness improvements: warnings treated as rejection (fixed ~35 misjudgments) · two-pass analysis (same-file package visibility) · header-driven classification (Negative+SEM→SMN) · the allowlist mechanism.</li>
        <li><span class="d">Class A</span>fix campaign (batch scripts + 8 agents in parallel): f_checksum body-position defects 98 → self-containment stubs added 186+12 → guarded signals unresolved types 31 → generic packages uninstantiated 86 → comment-placeholder negative files rewritten 229 → remaining SYN 426 / SEM 22 → SEM→SMN reclassification 162.</li>
        <li><span class="d">Class D</span><b>GHDL 6.0 gap catalog</b>: 25 categories, 156 lines, all allowlisted with reasons (vunit 48 / force-release 54 / record constraints and resolution 27 / matching operators 4 / scalar \'range ...) — Iron Rule 5: never silently accepted.</li>
      </ul>
      <div class="pain"><b>Problems encountered:</b> failure root causes mixed across four classes — one-size-fits-all handling inevitably misfires; negative tests "silently accepted by the tool" are more insidious than errors; GHDL 6.0 support for new features is incomplete (vunit/force/record constraints etc.).</div>
      <div class="gain"><b>Mechanisms introduced:</b> four-way failure classification (a dedicated channel per class); allowlist entries must carry a reason; header-driven classification makes metadata the single source of truth; external verification promoted to the Iron Rule #5 quality gate.</div>
      <div class="scripts"><span>run_ghdl_suite.py</span><span>fix_f_checksum.py</span><span>fix_self_containment.py</span><span>fix_stub_ports.py</span><span>reclassify_sem_smn.py</span></div>
      <p>End state: SYN 2628 / SNN 1528 / SEM 207 / SMN 668 <b>all 100%</b>, 0 failures · <a class="xlink" href="#trend">see the convergence curve ↗</a></p>
    </div>
  </details>

  <details class="phase" id="phase5">
    <summary><span class="pno">Phase 5</span><span class="ptitle">Architecture Autonomy</span><span class="pwhen">08-20</span><span class="pstat">GHDL into the loop · debt ledger · architect team</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><b>GHDL gate</b>: any failure row in <code>ghdl_failures.csv</code> → verify reports GHDL GATE.</li>
        <li><b>Self-contained architecture HTML</b> (mermaid→inline SVG, viewable offline) + the <code>reports/index.html</code> portal page.</li>
        <li><b>Blind-spot sealing</b>: a retrospective found the mindmap went unmaintained after the GHDL script was added — verify only checked the skills/agents directories. Added <b>script-set + concept-token checks</b>; drift of this kind is now forcibly blocked.</li>
        <li><b>§8.5 debt chapter</b>: a "deleted-when-done + migration log" ledger inside the Test Plan (structure checked by verify 7i); "not done / done poorly" items no longer drift in conversations.</li>
        <li><b>203 header repositionings</b>: the idempotent <code>fix_header_position.py</code>. Classic case — the first version of the script accidentally deleted the <code>library ieee;</code> context clause from V2 files; <b>the GHDL gate caught 13 failures on the spot</b>, and the rerun after the fix went back to zero (live proof of the external-verification loop's value).</li>
        <li><b>Architect agent team</b>: project-architect (project architecture upgrades) / meta-architect (agent-system optimization); mutually exclusive territories, cross-boundary work handed over via the main agent, both finish with verify 0 issues.</li>
      </ul>
      <div class="pain"><b>Problems encountered:</b> verify had blind spots (didn't check root scripts) → architecture docs drifted silently; debt had no ledger; architecture upgrades had no dedicated owner.</div>
      <div class="gain"><b>Mechanisms introduced:</b> the blind-spot-sealing principle (every missed check found gets added to verify); debt made explicit; architecture autonomy (architecture problems routed to dedicated agents).</div>
      <div class="scripts"><span>sync_all.py (+GHDL/debt checks)</span><span>generate_arch_pdf.py (+HTML/portal)</span><span>fix_header_position.py</span><span>.claude/agents/project-architect.md</span><span>.claude/agents/meta-architect.md</span></div>
      <p>Output: the verify gate covers 10 consistency groups · <a class="xlink" href="#future">see Status &amp; Outlook ↗</a></p>
    </div>
  </details>

  <details class="phase" id="phase6">
    <summary><span class="pno">Phase 6</span><span class="ptitle">Claim Sealing: Facts Authority &amp; Claim Registry</span><span class="pwhen">09-04</span><span class="pstat">hardcoded drift extinct · touchstone-proven gate</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <ul class="substeps">
        <li><b>Problem</b>: factual claims in prose and templates were hardcoded and drifted silently — the tracker card claimed <b>319 BNF productions</b> while the tracker title and the disk say <b>314</b>, and the architecture section claimed <b>5 root scripts</b> while the root actually holds 7; no gate checked any of it.</li>
        <li><b>Method</b> (the user's idea): do not fix the symptom first — build the detector, leave the real bugs in place as a touchstone, let the gate's first run catch them, then fix through the mechanism.</li>
        <li><b>Mechanism</b>: <code>project_facts.py</code> single facts authority (live scans: cases_src walk, reference CSVs, tracker title, .claude/ skill/agent/hook counts); <code>CLAIM_REGISTRY</code> + two-sided gate — output claims must equal the facts, generator sources must be literal-free, filesystem claims must exist on disk; blind-spot sealing extended to the claim domain.</li>
        <li><b>Result</b>: the first run failed on the stale claims with <b>zero false positives</b> (the hardcoded 306-in-scope hero number happened to equal the live CSV truth in this export — the gate verified it instead of flagging it, and the source-side lint still expelled the literal); placeholders replaced every hardcoded current-state number; 0 issues since.</li>
      </ul>
      <div class="pain"><b>Problems encountered:</b> hardcoded numbers in prose age silently — sync only checked the generated docs, so "319 productions" or "5 root scripts" could stay wrong forever without any gate noticing.</div>
      <div class="gain"><b>Mechanisms introduced:</b> project_facts.py (single facts authority) + CLAIM_REGISTRY (claim patterns + exempt zones + priority resolver) + verify 7k (output side / source side / filesystem side); touchstone-first workflow — prove the detector on real bugs before fixing them.</div>
      <div class="scripts"><span>project_facts.py</span><span>sync_all.py (+verify 7k)</span><span>build_presentation.py (+placeholders)</span></div>
      <p>Output: the claim gate joins every verify run — 0 issues, 0 stale claims · <a class="xlink" href="#method">see the blind-spot sealing entry ↗</a></p>
    </div>
  </details>

  <details class="phase" style="margin-top:20px">
    <summary><span class="pno">Appendix</span><span class="ptitle">Complete event log (all batches P1-P22 + key milestones)</span><span class="pstat">23-row timeline detail</span><i class="arrow">▶</i></summary>
    <div class="pbody">
      <table>
        <tr><th>Date</th><th>Batch</th><th>Event</th><th>Numbers</th></tr>
        <tr><td>07-23</td><td>P0</td><td>First batch generation (batch_gen_all.py)</td><td>1,347 files (930 syntax + 417 semantic)</td></tr>
        <tr><td>07-23</td><td>—</td><td>Predefined-attributes special test suite</td><td>37 attributes</td></tr>
        <tr><td>07-28</td><td>P1</td><td>IEEE chapter structure rebuilt</td><td>12 dirs / 318 folders</td></tr>
        <tr><td>07-28</td><td>P2</td><td>QSYN/QSNN quality batch</td><td>3,833 files</td></tr>
        <tr><td>07-28</td><td>P3</td><td>Semantic tests filed by production</td><td>417 files</td></tr>
        <tr><td>07-28</td><td>P4</td><td>Legacy directory cleanup</td><td>-1,590 → 2,660</td></tr>
        <tr><td>07-28</td><td>P5</td><td>Naming unification (drop Q prefix)</td><td>2,587 renames / 167 conflicts</td></tr>
        <tr><td>07-28</td><td>P8</td><td>Appendix E traceability matrix</td><td>2,243 mappings</td></tr>
        <tr><td>07-28</td><td>P10</td><td>Test Plan V2.2 + DOCX/HTML</td><td>—</td></tr>
        <tr><td>07-29</td><td>P11</td><td>First automated doc refresh (refresh_docs.py + CLAUDE.md)</td><td>automation kickoff</td></tr>
        <tr><td>07-29</td><td>P13</td><td>P0-P4 quality enhancement (redundant templates deleted)</td><td>-605 → 2,432</td></tr>
        <tr><td>07-29</td><td>P14</td><td>Cross-chapter zero-template handwriting batch</td><td>1,576 files</td></tr>
        <tr><td>07-29</td><td>P17</td><td>5 agents in parallel, quality regeneration</td><td>1,797 files</td></tr>
        <tr><td>07-29</td><td>P20</td><td>Parallel batches all completed</td><td>2,291 files</td></tr>
        <tr><td>08-06</td><td>P21</td><td>Large-scale finish (ch05 ALL 50 DONE)</td><td>4,994 files</td></tr>
        <tr><td>08-06</td><td>P22</td><td><b>All 319 productions DONE</b> (full 12-Iron-Rule check passed)</td><td>5,187 files</td></tr>
        <tr><td>08-19</td><td>—</td><td>GHDL 6.0 first full verification run</td><td><b>1,251 failures</b></td></tr>
        <tr><td>08-19</td><td>—</td><td>Four-way-classification fix campaign (batch + 8 agents in parallel)</td><td>→ <b>0 failures</b></td></tr>
        <tr><td>08-20</td><td>—</td><td>§8.5 debt chapter + architect agent team</td><td>verify 7i / +2 agents</td></tr>
        <tr><td>09-04</td><td>—</td><td>Claim Sealing: Facts Authority + Claim Registry (touchstone-proven)</td><td>verify 7k / 0 stale claims</td></tr>
        <tr><td>08-20</td><td>—</td><td>203 Test Focus header repositionings (regression caught by the GHDL gate)</td><td>203 files</td></tr>
        <tr><td>08-20</td><td>—</td><td>End state: full verify 0 issues + GHDL 0 failures</td><td>5,185 files</td></tr>
      </table>
    </div>
  </details>
</section>

<section id="method">
  <h2><span class="no">04</span>Methodology Accumulated</h2>
  <div class="bento">
    <div class="cell">
      <h4>{{IRON_RULES}} Iron Rules (non-negotiable)</h4>
      <ul style="margin:4px 0;padding-left:18px;font-size:.87em">
        <li><b>Sync is mandatory</b>: after any cases_src change /doc-sync is required and the output must be 0 issues — never skipped</li>
        <li><b>Batch = track + complete</b>: read PRODUCTION_TRACKER before batch work, sync every ~5 productions</li>
        <li><b>Quality is verified</b>: must pass /quality-audit before reporting "done"</li>
        <li><b>Methodology lives in skills</b>: CLAUDE.md only orchestrates; all {{SKILL_IRON_RULES}} Iron Rules etc. are pushed down into skills</li>
        <li><b>External verification is the quality gate</b>: GHDL 0 non-allowlist failures; gaps must be explicitly allowlisted with a reason</li>
        <li><b>Facts come from one source</b>: every factual claim derives from project_facts.py compute_facts() / CLAIM_REGISTRY — hardcoded fact literals in generator sources are verify failures (step 7k)</li>
      </ul>
    </div>
    <div class="cell">
      <h4>{{SKILL_IRON_RULES}} Iron Rules (content quality)</h4>
      <ul style="margin:4px 0;padding-left:18px;font-size:.87em">
        <li><b>9 content rules</b>: one file one test point / the body exercises the production's real syntax / meaningful entity names / multi-variant ports / zero dead code / SNN errors must come from a specific BNF token / SNN parseable up to the error point / SYN_001 minimal → SYN_00N progressively thorough / realistic hardware style</li>
        <li><b>3 traceability rules</b>: Test Focus format [dimension]:[mechanism] / reports write HOW not WHAT / report ↔ header ↔ code three-layer consistency</li>
      </ul>
    </div>
    <div class="cell">
      <h4>Four-way failure classification (external verification)</h4>
      <table style="font-size:.82em">
        <tr><th>Class</th><th>Identifying trait</th><th>Fix channel</th><th>This campaign's scale</th></tr>
        <tr><td>A file bug</td><td>VHDL violates the standard or contradicts the header</td><td>batch script / agent fix</td><td>~560</td></tr>
        <tr><td>B misclassified</td><td>header Case Type contradicts the filename</td><td>fix header / rename</td><td>~200</td></tr>
        <tr><td>C harness</td><td>judgment logic misjudges</td><td>fix run_ghdl_suite.py</td><td>~260</td></tr>
        <tr><td>D tool gap</td><td>GHDL 6.0 lacks the new feature</td><td>allowlist with reason</td><td>~45 ({{ALLOWLIST_ROWS}} lines final)</td></tr>
      </table>
    </div>
    <div class="cell">
      <h4>verify gate philosophy (anti-drift)</h4>
      <ul style="margin:4px 0;padding-left:18px;font-size:.87em">
        <li><b>Single source of truth</b>: the filesystem is the only truth, docs are fully generated — real case: after the three-way stat contradiction, no more patching</li>
        <li><b>Full regeneration beats patching</b>: patch-style updates fix one place and miss two — the root cause of silent staleness</li>
        <li><b>Blind-spot sealing</b>: every "unchecked thing" discovered gets added to verify — blind-spot sealing now also covers factual claims (numbers/paths/architecture counts), not just missing checks — already sealed: the script set (GHDL drift), the debt-chapter structure, the claim domain (Facts Authority + Claim Registry, verify 7k)</li>
        <li><b>Done = verify 0 issues</b>: not by memory, enforced by script; reverse tests proved the gate really blocks (a fake failure row → GHDL GATE alarm)</li>
      </ul>
    </div>
  </div>
</section>

<section id="trend">
  <h2><span class="no">05</span>Data Trends</h2>
  <h3>Test file count trajectory (deliberate de-templating contractions between phases)</h3>
  <div class="bar-row"><span class="lbl">07-23 first generation</span><div class="bar-track"><div class="bar" style="width:26%">1,347</div></div></div>
  <div class="bar-row"><span class="lbl">07-28 chapter structure + semantic migration</span><div class="bar-track"><div class="bar" style="width:52%">2,716</div></div></div>
  <div class="bar-row"><span class="lbl">07-29 P0-P4 quality enhancement</span><div class="bar-track"><div class="bar" style="width:47%">2,432</div></div></div>
  <div class="bar-row"><span class="lbl">07-29 de-templating (pure handwriting)</span><div class="bar-track"><div class="bar" style="width:30%">1,576</div></div></div>
  <div class="bar-row"><span class="lbl">08-06 all productions DONE</span><div class="bar-track"><div class="bar" style="width:100%">5,187</div></div></div>
  <div class="bar-row"><span class="lbl">08-20 end state (after fixes + reclassification)</span><div class="bar-track"><div class="bar" style="width:99%">5,185</div></div></div>
  <h3>GHDL failure convergence (1,251 → 0)</h3>
  <div class="bar-row"><span class="lbl">initial full verification</span><div class="bar-track"><div class="bar red" style="width:100%">1,251 failures</div></div></div>
  <div class="bar-row"><span class="lbl">after harness fixes + reclassification</span><div class="bar-track"><div class="bar red" style="width:72%">~900</div></div></div>
  <div class="bar-row"><span class="lbl">after file fixes (batch + 8 agents in parallel)</span><div class="bar-track"><div class="bar red" style="width:22%">~280</div></div></div>
  <div class="bar-row"><span class="lbl">end state (0 failures + 154 allowlisted)</span><div class="bar-track"><div class="bar" style="width:2%; min-width:64px; background:#3f9d5e">0</div></div></div>
</section>

<section id="future">
  <h2><span class="no">06</span>Status &amp; Outlook</h2>
  <p>All currently known debt is registered in the §8.5 debt chapter of the Test Plan (hand-maintained, deleted-when-done + migration log); the table below mirrors its Active Items:</p>
  <table>
    <tr><th>Category</th><th>Item</th><th>Status</th></tr>
    <!--INJ:DEBT_ROWS-->{{DEBT_ROWS}}<!--/INJ:DEBT_ROWS-->
  </table>
  <p>Outlook: the architect agent team (project-architect / meta-architect) keeps absorbing follow-up requirements and problems; the verify gate keeps sealing new blind spots.</p>
</section>

<section id="assets">
  <h2><span class="no">07</span>Attachments</h2>
  <p>The files below are all copied into the <code>assets/</code> subfolder of this folder; double-click to open:</p>
  <div class="att">
    <a href="assets/architecture_mindmap.pdf">Architecture mindmap PDF<span>Full architecture reference ({{N_SKILLS}} skills / {{N_AGENTS}} agents / {{N_SCRIPTS}} root scripts / data flow / design principles), printable</span></a>
    <a href="assets/VHDL2008_Test_Plan_latest.html">Test Plan HTML<span>Full test plan (strategy / coverage / §9 per-production test points / appendices); mermaid diagrams need network</span></a>
    <a href="assets/coverage_summary.md">Coverage report<span>Complete stats by chapter/type/semantic rule/quality metric</span></a>
    <a href="assets/ghdl_test_results.md">GHDL test results<span>By-type/by-chapter matrix + WARN_REJECT / EXPECTED_FAIL notes</span></a>
    <a href="assets/PRODUCTION_TRACKER.md">Production tracker<span>Status and file counts of the {{PROD_COUNT}} BNF productions</span></a>
  </div>
</section>

<div class="foot">Auto-rebuilt by sync_all.py · live dynamic data injection (verify checks the snapshot against the filesystem) · offline self-contained</div>
</main>

<button id="toTop" title="Back to top">↑</button>

<script>
/* ================= SVG viewer engine =================
 * transform-origin is the canvas center (wrap anchored at 50%/50%),
 * so tx/ty = offset of the canvas center from the stage center.
 * Smart fit: contain by default; when the diagram would shrink below 0.55,
 * use the larger of fit-width/fit-height instead.
 * Pan is clamped so the canvas always covers >=60% of the viewport.
 * Wheel over the stage always zooms (cursor-anchored) — hovering the
 * diagram is the explicit intent to zoom it; the page scrolls elsewhere. */
function viewerEngine(stage, svg) {
  var wrap = document.createElement('div');
  wrap.className = 'wrap';
  svg.parentElement.insertBefore(wrap, svg);
  wrap.appendChild(svg);
  var scale = 1, tx = 0, ty = 0;
  function dims() {
    var vb = svg.viewBox.baseVal;
    return { w: svg.clientWidth || (vb && vb.width) || 800,
             h: svg.clientHeight || (vb && vb.height) || 600 };
  }
  function apply() {
    wrap.style.transform = 'translate(' + tx + 'px,' + ty + 'px) scale(' + scale + ')';
  }
  function clamp() {
    var d = dims();
    var cw = stage.clientWidth, ch = stage.clientHeight;
    var ws = d.w * scale, hs = d.h * scale;
    if (ws < cw) tx = 0; else tx = Math.min(ws / 2 - 0.1 * cw, Math.max(0.1 * cw - ws / 2, tx));
    if (hs < ch) ty = 0; else ty = Math.min(hs / 2 - 0.1 * ch, Math.max(0.1 * ch - hs / 2, ty));
    apply();
  }
  function fitContain() {
    var d = dims();
    var cw = stage.clientWidth - 40, ch = stage.clientHeight - 40;
    scale = Math.min(cw / d.w, ch / d.h);
    if (!isFinite(scale) || scale <= 0) scale = 1;
    tx = 0; ty = 0; clamp();
  }
  function fitWidth() {
    var d = dims();
    scale = Math.min((stage.clientWidth - 40) / d.w, 4);
    if (!isFinite(scale) || scale <= 0) scale = 1;
    tx = 0; ty = 0; clamp();
  }
  function fitHeight() {
    var d = dims();
    scale = Math.min((stage.clientHeight - 40) / d.h, 4);
    if (!isFinite(scale) || scale <= 0) scale = 1;
    tx = 0; ty = 0; clamp();
  }
  function smartFit() {
    var d = dims();
    var cw = stage.clientWidth - 40, ch = stage.clientHeight - 40;
    var contain = Math.min(cw / d.w, ch / d.h);
    if (contain < 0.55) {
      if (cw / d.w >= ch / d.h) fitWidth(); else fitHeight();
    } else {
      fitContain();
    }
  }
  function zoom(factor, cx, cy) {
    var rect = stage.getBoundingClientRect();
    var px = cx === undefined ? rect.width / 2 : cx - rect.left;
    var py = cy === undefined ? rect.height / 2 : cy - rect.top;
    var ns = Math.min(10, Math.max(0.2, scale * factor));
    var k = ns / scale;
    var ox = px - rect.width / 2 - tx;
    var oy = py - rect.height / 2 - ty;
    tx = px - rect.width / 2 - ox * k;
    ty = py - rect.height / 2 - oy * k;
    scale = ns;
    clamp();
  }
  var drag = null;
  stage.addEventListener('mousedown', function (e) {
    if (e.target.closest('button')) return;
    drag = { x: e.clientX, y: e.clientY, tx: tx, ty: ty };
    stage.classList.add('dragging');
  });
  window.addEventListener('mousemove', function (e) {
    if (!drag) return;
    tx = drag.tx + (e.clientX - drag.x);
    ty = drag.ty + (e.clientY - drag.y);
    clamp();
  });
  window.addEventListener('mouseup', function () { drag = null; stage.classList.remove('dragging'); });
  stage.addEventListener('dblclick', smartFit);
  var ro = null;
  if (typeof ResizeObserver !== 'undefined') {
    ro = new ResizeObserver(function () {
      clearTimeout(ro._t);
      ro._t = setTimeout(clamp, 120);
    });
    ro.observe(stage);
  }
  return {
    smartFit: smartFit, fitContain: fitContain, fitWidth: fitWidth,
    fitHeight: fitHeight, zoom: zoom, clamp: clamp
  };
}

/* ================= viewer shell ================= */
function makeViewer(container) {
  var stage = container.querySelector('.viewer-stage');
  var svg = stage.querySelector('svg');
  if (!svg) return;
  var eng = viewerEngine(stage, svg);
  container.querySelector('[data-act="in"]').addEventListener('click', function () { eng.zoom(1.25); });
  container.querySelector('[data-act="out"]').addEventListener('click', function () { eng.zoom(0.8); });
  container.querySelector('[data-act="contain"]').addEventListener('click', eng.fitContain);
  container.querySelector('[data-act="width"]').addEventListener('click', eng.fitWidth);
  container.querySelector('[data-act="height"]').addEventListener('click', eng.fitHeight);
  container.querySelector('[data-act="full"]').addEventListener('click', openFullscreen);

  // hover-to-zoom: pointer over the diagram = intent to zoom it
  stage.addEventListener('wheel', function (e) {
    e.preventDefault();
    eng.zoom(e.deltaY < 0 ? 1.12 : 0.89, e.clientX, e.clientY);
  }, { passive: false });

  function openFullscreen() {
    // document-viewer lightbox: white canvas on a dimmed backdrop
    var lb = document.createElement('div');
    lb.className = 'lightbox open';
    lb.innerHTML = '<div class="lb-bar"><span class="lb-title"></span>'
      + '<button data-act="in">Zoom in</button><button data-act="out">Zoom out</button>'
      + '<button data-act="contain">Fit window</button><button data-act="width">Fit width</button>'
      + '<button data-act="height">Fit height</button><button data-act="close">Close (Esc)</button></div>'
      + '<div class="lb-canvas"><div class="lb-stage"></div></div>';
    lb.querySelector('.lb-title').textContent = container.querySelector('.cap').textContent;
    document.body.appendChild(lb);
    var lbStage = lb.querySelector('.lb-stage');
    var clone = svg.cloneNode(true);
    lbStage.appendChild(clone);
    var leng = viewerEngine(lbStage, clone);
    lb.querySelector('[data-act="in"]').addEventListener('click', function () { leng.zoom(1.25); });
    lb.querySelector('[data-act="out"]').addEventListener('click', function () { leng.zoom(0.8); });
    lb.querySelector('[data-act="contain"]').addEventListener('click', leng.fitContain);
    lb.querySelector('[data-act="width"]').addEventListener('click', leng.fitWidth);
    lb.querySelector('[data-act="height"]').addEventListener('click', leng.fitHeight);
    lbStage.addEventListener('wheel', function (e) {
      e.preventDefault();
      leng.zoom(e.deltaY < 0 ? 1.12 : 0.89, e.clientX, e.clientY);
    }, { passive: false });
    function close() { lb.remove(); document.removeEventListener('keydown', esc); }
    function esc(e) { if (e.key === 'Escape') close(); }
    document.addEventListener('keydown', esc);
    lb.querySelector('[data-act="close"]').addEventListener('click', close);
    requestAnimationFrame(leng.smartFit);
  }

  requestAnimationFrame(eng.smartFit);
}
document.querySelectorAll('.viewer').forEach(makeViewer);

/* ================= layered drill-down architecture diagram =================
 * Rendered generically from the architecture spec JSON — ARCH_SPEC is
 * injected by build_presentation.py from project_facts.extract_arch_spec()
 * (architecture_mindmap.md §2.2–§2.5 = the single source of truth; no
 * hand-maintained data copy lives here). The DOM shape (classes, expand/
 * collapse behavior) is unchanged from the hand-written version. */
var ARCH_SPEC = /*ARCH_SPEC_BEGIN*/{{ARCH_SPEC}}/*ARCH_SPEC_END*/;

var GROUP_META = [
  { key: 'skills',  name: 'Skills',    color: '#2c6b9c', tagSuffix: 'total', one: 'four protocols: generate / sync / audit / external verification' },
  { key: 'agents',  name: 'Agents',    color: '#3f9d5e', tagSuffix: 'total', one: 'sync / audit / project architecture / meta-architecture, each with its own role' },
  { key: 'scripts', name: 'Scripts',   color: '#b5743a', tagSuffix: 'root scripts', one: 'sync engine / traceability matrix / report rendering / GHDL verification / facts authority' },
  { key: 'docs',    name: 'Documents', color: '#8a7a4d', tagSuffix: 'kinds', one: 'test plan / coverage / tracker / appendices / logs / rendered artifacts / verification reports' }
];

var GROUPS = GROUP_META.map(function (g) {
  var members = ARCH_SPEC[g.key] || [];
  g.items = members.map(function (m) {
    var parts = (m.name || '').split(' — ');
    return {
      name: parts[0],
      sub: parts.slice(1).join(' — '),
      tag: m.model || '',
      one: m.one || m.contents || '',
      tables: m.tables || [],
      fields: m
    };
  });
  g.tag = members.length + ' ' + g.tagSuffix;
  g.single = !g.items.length;
  return g;
});

function esc(s) {
  return String(s == null ? '' : s)
    .replace(/&/g, '&amp;').replace(/</g, '&lt;')
    .replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function detailHTML(item) {
  var html = '';
  var tables = item.tables || [];
  for (var i = 0; i < tables.length; i++) {
    var t = tables[i];
    if (t.title) html += '<h5>' + esc(t.title) + '</h5>';
    html += '<table><tr>';
    for (var h = 0; h < t.header.length; h++) html += '<th>' + esc(t.header[h]) + '</th>';
    html += '</tr>';
    for (var r = 0; r < t.rows.length; r++) {
      html += '<tr>';
      for (var c = 0; c < t.rows[r].length; c++) {
        html += '<td>' + esc(t.rows[r][c]).replace(/\n/g, '<br>') + '</td>';
      }
      html += '</tr>';
    }
    html += '</table>';
  }
  if (!html && item.fields && item.fields.path) {
    html += '<h5>Document</h5><table>'
      + '<tr><th>Path</th><td>' + esc(item.fields.path) + '</td></tr>'
      + '<tr><th>Update Method</th><td>' + esc(item.fields.update) + '</td></tr>'
      + '<tr><th>Contents</th><td>' + esc(item.fields.contents) + '</td></tr></table>';
  }
  if (!html) html = '<p>' + esc(item.one) + '</p>';
  return html;
}

(function () {
  var l1 = document.getElementById('drill-l1');
  var l2 = document.getElementById('drill-l2');
  var detail = document.getElementById('drill-detail');
  var crumb = document.getElementById('drill-crumb');
  var state = {};   // groupKey -> open bool

  function closeDetail() { detail.classList.remove('open'); detail.innerHTML = ''; }

  function openDetail(item, group) {
    crumb.textContent = group.name + ' / ' + item.name;
    detail.innerHTML = '<div class="dhead"><b>' + esc(item.name) + '</b>'
      + (item.tag ? '<span class="dt" style="background:' + group.color + '">' + esc(item.tag) + '</span>' : '')
      + '<button class="dclose">Close</button></div>'
      + detailHTML(item);
    detail.classList.add('open');
    detail.querySelector('.dclose').addEventListener('click', closeDetail);
    detail.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  }

  function renderL2(group) {
    l2.innerHTML = '';
    if (!group.items || group.items.length === 0) {
      crumb.textContent = group.name;
      l2.classList.remove('open');
      return;
    }
    crumb.textContent = group.name + ' (' + group.items.length + ' members)';
    l2.innerHTML = '<div class="l2title">' + esc(group.name) + ' members (click to see the full description)</div>'
      + '<div class="l2grid">' + group.items.map(function (it) {
        return '<div class="l2node" data-name="' + esc(it.name) + '">'
          + '<div><span class="dn">' + esc(it.name) + '</span>'
          + (it.tag ? '<span class="dt" style="background:' + group.color + '">' + esc(it.tag) + '</span>' : '')
          + '</div><div class="do">' + esc(it.sub || it.one) + '</div></div>';
      }).join('') + '</div>';
    l2.querySelectorAll('.l2node').forEach(function (node) {
      node.addEventListener('click', function () {
        var name = node.getAttribute('data-name');
        var item = group.items.find(function (x) { return x.name === name; });
        l2.querySelectorAll('.l2node').forEach(function (n) { n.classList.remove('on'); });
        node.classList.add('on');
        if (item) openDetail(item, group);
      });
    });
    l2.classList.add('open');
  }

  function renderL1() {
    l1.innerHTML = GROUPS.map(function (g) {
      var cnt = g.items ? g.items.length : 1;
      return '<div class="dnode' + (g.single ? ' single' : '') + '" data-id="' + g.key + '">'
        + '<div class="bar" style="background:' + g.color + '"></div>'
        + '<span class="cnt">' + cnt + '</span>'
        + '<div><span class="dn">' + esc(g.name) + '</span>'
        + '<span class="dt" style="background:' + g.color + '">' + esc(g.tag) + '</span></div>'
        + '<div class="do">' + esc(g.one) + '</div>'
        + '<div class="exp">' + (state[g.key] ? '▾ expanded — click to collapse' : '▸ click to expand') + '</div>'
        + '</div>';
    }).join('');
    l1.querySelectorAll('.dnode').forEach(function (node) {
      node.addEventListener('click', function () {
        var g = GROUPS.find(function (x) { return x.key === node.getAttribute('data-id'); });
        state[g.key] = !state[g.key];
        if (state[g.key]) {
          renderL1();
          renderL2(g);
        } else {
          renderL1();
          l2.classList.remove('open');
          l2.innerHTML = '';
          crumb.textContent = 'Click the cards below to expand layer by layer';
          closeDetail();
        }
      });
    });
  }

  document.getElementById('drill-all').addEventListener('click', function () {
    var first = GROUPS[0];
    GROUPS.forEach(function (g) { state[g.key] = true; });
    renderL1();
    renderL2(first);
  });
  document.getElementById('drill-none').addEventListener('click', function () {
    GROUPS.forEach(function (g) { state[g.key] = false; });
    renderL1();
    l2.classList.remove('open');
    l2.innerHTML = '';
    closeDetail();
    crumb.textContent = 'Click the cards below to expand layer by layer';
  });

  renderL1();
})();

/* ============ scrollspy + smooth anchors + back-to-top ============ */
(function () {
  var links = document.querySelectorAll('nav a');
  var secs = [];
  links.forEach(function (a) {
    var s = document.querySelector(a.getAttribute('href'));
    if (s) secs.push({ link: a, sec: s });
  });
  function onScroll() {
    var y = window.scrollY + 140;
    var cur = secs[0];
    secs.forEach(function (p) { if (p.sec.offsetTop <= y) cur = p; });
    links.forEach(function (a) { a.classList.remove('active'); });
    if (cur) cur.link.classList.add('active');
    var btn = document.getElementById('toTop');
    btn.style.display = window.scrollY > 600 ? 'block' : 'none';
  }
  window.addEventListener('scroll', onScroll, { passive: true });
  document.getElementById('toTop').addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
  onScroll();
})();
</script>
</body>
</html>
'''


def main():
    print('Building presentation...')
    os.makedirs(ASSETS_DIR, exist_ok=True)

    # 1. Live data
    ch_rows, n_folders, n_files = chapter_stats()
    n_chapters = len(ch_rows)
    tcounts = type_counts()
    spec_files, spec_folders, _ = specific_stats()
    spec_pct = round(spec_folders / n_folders * 100) if n_folders else 0
    tf_cjk = tf_cjk_count()
    gmat = ghdl_matrix()
    skills, agents = live_skills_agents()
    scripts = live_root_scripts()

    chapters_html = '\n'.join(
        f'        <tr><td>{ch}</td><td>{f}</td><td>{n}</td></tr>' for ch, f, n in ch_rows)
    ghdl_rows = ghdl_chapter_rows()
    ghdl_html = '\n'.join(
        f'        <tr><td>{ch}</td><td>{p}</td><td>{f}</td></tr>' for ch, p, f in ghdl_rows) \
        if ghdl_rows else '<tr><td colspan="3">(ghdl_test_results.md not found — run /ghdl-verify first)</td></tr>'
    if gmat and gmat['rows']:
        matrix_html = '\n'.join(
            f'        <tr><td>{t}</td><td>{p}</td><td>{f}</td></tr>'
            for t, p, f, r in gmat['rows'] if t != 'UNK')
    else:
        matrix_html = '<tr><td colspan="3">(ghdl_test_results.md not found — run /ghdl-verify first)</td></tr>'
    notes_html = ' · '.join(
        f'{name} {cnt} ({desc})' for name, cnt, desc in (gmat['notes'] if gmat else [])) \
        if gmat else '(ghdl_test_results.md not found)'
    ghdl_date = gmat['date'] if gmat else '—'
    ghdl_files = gmat['files'] if gmat else 0
    print(f'  Live data: {n_folders} folders / {n_files} files / {n_chapters} chapters / '
          f'{ghdl_files} ghdl-tested / {tf_cjk} TF-still-Chinese')

    # 2. Render the 3 diagrams
    with open(MINDMAP_MD, 'r', encoding='utf-8') as f:
        md_text = f.read()
    blocks = extract_mermaid_blocks(md_text)
    mindmap_svg = render_svg(blocks[0], 'mindmap') if blocks else None
    flow_svg = render_svg(blocks[1], 'flow') if len(blocks) > 1 else None
    timeline_svg = render_svg(TIMELINE_MMD, 'timeline')

    # 3. Assemble
    def viewer(svg, cap):
        if not svg:
            return f'<p>({cap} SVG rendering failed — see assets/architecture_mindmap.pdf)</p>'
        # INJ markers keep the injected diagram out of the style-fingerprint
        # skeleton (diagram structure is data, not style)
        return f'''<div class="viewer">
  <div class="viewer-bar"><span class="cap">{cap}</span>
    <button data-act="in">Zoom in</button><button data-act="out">Zoom out</button>
    <button data-act="contain">Fit window</button><button data-act="width">Fit width</button>
    <button data-act="height">Fit height</button><button data-act="full">Fullscreen</button>
  </div>
  <div class="viewer-stage"><!--INJ:SVG-->{svg}<!--/INJ:SVG--></div>
  <div class="hint">Controls: hover over the diagram and wheel to zoom · hold and drag to pan · double-click to smart fit · fullscreen is a whiteboard document view (Esc to close)</div>
</div>'''

    html = TEMPLATE
    html = html.replace('{{CHAPTERS}}', chapters_html)
    html = html.replace('{{GHDL_CHAPTERS}}', ghdl_html)
    html = html.replace('{{TOTAL_FILES}}', f'{n_files:,}')
    html = html.replace('{{TOTAL_FOLDERS}}', str(n_folders))
    html = html.replace('{{N_CHAPTERS}}', str(n_chapters))
    html = html.replace('{{N_SCRIPTS}}', str(len(scripts)))
    html = html.replace('{{SPEC_PCT}}', str(spec_pct))
    html = html.replace('{{SPEC_FOLDERS}}', str(spec_folders))
    html = html.replace('{{SPEC_FILES}}', str(spec_files))
    html = html.replace('{{TF_CN}}', f'{tf_cjk:,}')
    html = html.replace('{{GHDL_FILES}}', f'{ghdl_files:,}')
    html = html.replace('{{GHDL_DATE}}', ghdl_date)
    html = html.replace('{{GHDL_MATRIX_ROWS}}', matrix_html)
    html = html.replace('{{GHDL_NOTES}}', notes_html)
    html = html.replace('{{TYPE_COUNTS}}',
                        f"SYN {tcounts.get('SYN', 0):,} / SNN {tcounts.get('SNN', 0):,} / "
                        f"SEM {tcounts.get('SEM', 0):,} / SMN {tcounts.get('SMN', 0):,}")
    html = html.replace('{{MINDMAP}}', viewer(mindmap_svg, 'Full architecture mindmap — {{N_SKILLS}} skills / {{N_AGENTS}} agents / {{N_SCRIPTS}} root scripts / {{DOC_KINDS}} document kinds (one-diagram mermaid overview)'))
    html = html.replace('{{FLOW}}', viewer(flow_svg, 'Data flow — generate → sync → verify → render'))
    html = html.replace('{{TIMELINE}}', viewer(timeline_svg, 'Iteration and evolution timeline — the five phases of 2026-07-23 ~ 08-20'))

    # Architecture spec (single source: architecture_mindmap.md §2.2–§2.5) —
    # the drill-down chart renders generically from this JSON; no hand-written
    # data array lives in the template. Escaped for <script> embedding.
    spec = project_facts.extract_arch_spec()
    arch_spec_json = json.dumps(spec, ensure_ascii=False).replace('</', '<\\/')
    html = html.replace('{{ARCH_SPEC}}', arch_spec_json)

    # Debt table: live parse of the hand-maintained §8.5 Active Items
    html = html.replace('{{DEBT_ROWS}}', debt_rows())

    # Facts Authority injection — resolved AFTER the viewer injections so any
    # placeholder tokens carried into the page by injected captions resolve too.
    facts = project_facts.compute_facts()
    html = html.replace('{{IN_SCOPE_BNF}}', str(facts['bnf_in_scope']))
    html = html.replace('{{SEM_TOTAL}}', str(facts['sem_total']))
    html = html.replace('{{PROD_COUNT}}', str(facts['production_count']))
    html = html.replace('{{N_SKILLS}}', str(facts['skills']))
    html = html.replace('{{N_AGENTS}}', str(facts['agents']))
    html = html.replace('{{IRON_RULES}}', str(facts['iron_rules']))
    html = html.replace('{{SKILL_IRON_RULES}}', str(facts['skill_iron_rules']))
    html = html.replace('{{DOC_KINDS}}', str(facts['doc_kinds']))
    html = html.replace('{{BNF_NEW}}', str(facts['bnf_new_2008']))
    html = html.replace('{{SEM_P0}}', str(facts['sem_p0']))
    sem_cats = ' / '.join(f'{cat} {c["rules"]}'
                          for cat, c in facts['sem_categories'][:5])
    html = html.replace('{{SEM_CATEGORIES}}', sem_cats)
    html = html.replace('{{ALLOWLIST_ROWS}}', str(allowlist_rows()))
    # Layer-responsibility table: component names/models from the spec
    def short(name):
        return name.split(' — ')[0].strip()
    html = html.replace('{{SKILL_NAMES}}',
                        ' · '.join(f'{short(s["name"])} ({s["model"]})'
                                   for s in spec['skills'] if s.get('model')))
    html = html.replace('{{AGENT_NAMES}}',
                        ' · '.join(f'{short(a["name"])} ({a["model"]})'
                                   for a in spec['agents'] if a.get('model')))
    html = html.replace('{{SCRIPT_NAMES}}',
                        ' · '.join(short(x['name']) for x in spec['scripts']))
    html = html.replace('{{DOC_NAMES}}',
                        ' · '.join(d['name'] for d in spec['docs']))
    # N_SCRIPTS is also replaced earlier (before the viewer injections), but the
    # mindmap caption injected by {{MINDMAP}} carries its own copy — re-resolve
    # it here so no placeholder token survives the build.
    html = html.replace('{{N_SCRIPTS}}', str(facts['root_scripts']))

    # 4. Freshness snapshot marker (verify_presentation reads it back)
    snapshot = ('<!-- PRESENTATION_SNAPSHOT: files={} folders={} skills={} agents={} scripts={} ghdl_files={} -->'
                .format(n_files, n_folders, ','.join(skills), ','.join(agents),
                        ','.join(scripts), ghdl_files))
    html = html.replace('<body>', '<body>\n' + snapshot, 1)

    out = os.path.join(PRES_DIR, 'index.html')
    with open(out, 'w', encoding='utf-8') as f:
        f.write(html)
    print(f'  {out} ({os.path.getsize(out) / 1024:.0f} KB)')

    # 5. Copy attachments
    for src, name in ATTACHMENTS:
        dst = os.path.join(ASSETS_DIR, name)
        if os.path.exists(src):
            shutil.copy2(src, dst)
            print(f'  assets/{name} ({os.path.getsize(dst) / 1024:.0f} KB)')
        else:
            print(f'  WARN: source missing, skipped: {src}')

    print('Done. Open presentation/index.html in a browser (works offline).')


if __name__ == '__main__':
    main()
