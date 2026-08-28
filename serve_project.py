#!/usr/bin/env python3
"""LAN web access for the VHDL 2008 test suite project.

Routes (serves the whole project root):
  GET /                -> 302 /presentation/      (work-report page is the front door)
  GET /browse/...      -> directory browser (breadcrumbs, dirs first, name/size/mtime)
  GET /<anything else> -> static file from the project root
                          (.vhd/.md served as text for in-browser preview,
                           .html rendered, everything else downloaded)

Usage: python3 serve_project.py [--port 8090] [--bind 0.0.0.0]

SECURITY: exposes the ENTIRE project directory read-only to every host on the
LAN while running. Stop it when the presentation is over (Ctrl+C).
If other hosts on the LAN cannot connect, allow the port through Windows Firewall:
  netsh advfirewall firewall add rule name="vhdltest-presentation" dir=in action=allow protocol=TCP localport=8090
"""

import os
import sys
import argparse
import socket
import html
import urllib.parse
from datetime import datetime
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

ROOT = os.path.dirname(os.path.abspath(__file__))

BROWSE_CSS = """
body { font-family:"Microsoft YaHei",-apple-system,sans-serif; margin:0; background:#eef2f6; color:#1a1a1a; }
header { background:linear-gradient(135deg,#16324f,#2c6b9c); color:#fff; padding:14px 22px; }
header h1 { margin:0; font-size:1.2em; }
.crumb { padding:10px 22px; font-size:.9em; background:#f7f9fb; border-bottom:1px solid #dde4ec; }
.crumb a { color:#2c6b9c; text-decoration:none; }
.crumb a:hover { text-decoration:underline; }
table { border-collapse:collapse; width:100%; }
th,td { text-align:left; padding:7px 12px; border-bottom:1px solid #e3e9f0; font-size:.9em; }
th { background:#e9f0f7; color:#16324f; }
tr:hover td { background:#f0f5fa; }
a { color:#2c6b9c; text-decoration:none; }
a:hover { text-decoration:underline; }
.dir { font-weight:600; }
.size, .mtime { color:#5a6b7b; white-space:nowrap; }
main { max-width:1000px; margin:16px auto; background:#fff; border:1px solid #dde4ec; border-radius:10px; overflow:hidden; }
.foot { color:#5a6b7b; font-size:.8em; text-align:center; padding:12px; }
"""


def fmt_size(n):
    for unit in ('B', 'KB', 'MB', 'GB'):
        if n < 1024 or unit == 'GB':
            return f'{n:.0f} {unit}' if unit == 'B' else f'{n:.1f} {unit}'
        n /= 1024
    return f'{n:.0f} B'


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=ROOT, **kwargs)

    def guess_type(self, path):
        """Serve .vhd/.md as inline text (browser preview) instead of octet-stream download."""
        ext = os.path.splitext(path)[1].lower()
        if ext == '.vhd':
            return 'text/plain; charset=utf-8'
        if ext == '.md':
            return 'text/markdown; charset=utf-8'
        return super().guess_type(path)

    def do_GET(self):
        path = urllib.parse.unquote(self.path.split('?', 1)[0])
        if path == '/':
            self.send_response(302)
            self.send_header('Location', '/presentation/')
            self.end_headers()
            return
        if path == '/browse' or path.startswith('/browse/'):
            self._browse(path)
            return
        super().do_GET()

    def _browse(self, path):
        rel = path[len('/browse'):].strip('/')
        target = os.path.abspath(os.path.join(ROOT, rel))
        if not target.startswith(os.path.abspath(ROOT)) or not os.path.isdir(target):
            self.send_error(404, 'Directory not found')
            return
        entries = []
        with os.scandir(target) as it:
            for e in it:
                try:
                    st = e.stat()
                except OSError:
                    continue
                entries.append((e.name, e.is_dir(), st.st_size, st.st_mtime))
        entries.sort(key=lambda x: (not x[1], x[0].lower()))

        crumbs = [('<a href="/presentation/">Report page</a>', '')]
        parts, acc = rel.split('/') if rel else [], ''
        crumbs.append(('<a href="/browse/">Project root</a>', '/browse/'))
        for p in parts:
            acc = f'{acc}/{p}' if acc else p
            crumbs.append((html.escape(p), f'/browse/{acc}/'))
        crumb_html = ' / '.join(
            f'<a href="{href}">{label}</a>' if href else label for label, href in crumbs)

        rows = []
        if rel:
            parent = '/browse/' + '/'.join(rel.split('/')[:-1]) + '/'
            rows.append(f'<tr><td colspan="3"><a href="{parent}">⬆ Up one level</a></td></tr>')
        for name, is_dir, size, mtime in entries:
            if is_dir:
                link = f'/browse/{acc}/{name}/' if acc else f'/browse/{name}/'
                rows.append(f'<tr><td class="dir">📁 <a href="{link}">{html.escape(name)}/</a></td>'
                            f'<td class="size"></td>'
                            f'<td class="mtime">{datetime.fromtimestamp(mtime):%Y-%m-%d %H:%M}</td></tr>')
            else:
                link = f'/{acc}/{name}' if acc else f'/{name}'
                rows.append(f'<tr><td>📄 <a href="{urllib.parse.quote(link)}">{html.escape(name)}</a></td>'
                            f'<td class="size">{fmt_size(size)}</td>'
                            f'<td class="mtime">{datetime.fromtimestamp(mtime):%Y-%m-%d %H:%M}</td></tr>')

        body = f"""<!DOCTYPE html>
<html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File repository /{rel} — vhdltest</title>
<style>{BROWSE_CSS}</style></head>
<body>
<header><h1>📁 vhdltest file repository <span style="font-weight:400;font-size:.8em">read-only · LAN</span></h1></header>
<div class="crumb">{crumb_html}</div>
<main><table><tr><th>Name</th><th>Size</th><th>Modified</th></tr>{''.join(rows)}</table></main>
<div class="foot">served by serve_project.py · click a file to view or download it · stop the service when the presentation is over</div>
</body></html>"""
        data = body.encode('utf-8')
        self.send_response(200)
        self.send_header('Content-Type', 'text/html; charset=utf-8')
        self.send_header('Content-Length', str(len(data)))
        self.end_headers()
        self.wfile.write(data)


def lan_ips():
    ips = []
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ips.append(s.getsockname()[0])
        s.close()
    except OSError:
        pass
    try:
        for info in socket.getaddrinfo(socket.gethostname(), None, socket.AF_INET):
            ip = info[4][0]
            if ip not in ips and not ip.startswith('127.'):
                ips.append(ip)
    except OSError:
        pass
    return ips


def main():
    parser = argparse.ArgumentParser(description='LAN web access for the vhdltest project')
    parser.add_argument('--port', type=int, default=8090)
    parser.add_argument('--bind', default='0.0.0.0')
    args = parser.parse_args()

    server = ThreadingHTTPServer((args.bind, args.port), Handler)
    print('=' * 60)
    print('vhdltest LAN access service started (read-only)')
    print(f'  Presentation:   http://<this-host>:{args.port}/          (/) redirects to /presentation/')
    print(f'  File repository: http://<this-host>:{args.port}/browse/   browse or download any file in the project')
    for ip in lan_ips():
        print(f'    This host: http://{ip}:{args.port}/')
    print('Stop: Ctrl+C')
    print('Note: while the server is running, this project is accessible (read-only) from any host on the LAN. Stop the service when the presentation is over.')
    print('If other hosts on the LAN cannot connect (firewall blocking), run as administrator:')
    print(f'  netsh advfirewall firewall add rule name="vhdltest-presentation" dir=in action=allow protocol=TCP localport={args.port}')
    print('=' * 60)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print('\nServer stopped.')
    finally:
        server.server_close()


if __name__ == '__main__':
    main()
