#!/usr/bin/env bash
# Render a morning-paper HTML edition to PDF with headless Chrome/Chromium and print the page count.
# Usage: render_pdf.sh editions/YYYY-MM-DD.html   (writes editions/YYYY-MM-DD.pdf next to it)
set -euo pipefail

html="$1"
pdf="${html%.html}.pdf"

chrome=""
for c in \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "/Applications/Chromium.app/Contents/MacOS/Chromium" \
  "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" \
  "$(command -v google-chrome 2>/dev/null || true)" \
  "$(command -v chromium 2>/dev/null || true)" \
  "$(command -v chromium-browser 2>/dev/null || true)"; do
  if [ -n "$c" ] && [ -x "$c" ]; then chrome="$c"; break; fi
done
if [ -z "$chrome" ]; then
  echo "No Chrome, Chromium or Edge found. Install Google Chrome to render the paper." >&2
  exit 1
fi

"$chrome" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=8000 \
  --print-to-pdf="$pdf" "$html" >/dev/null 2>&1

pages=$(python3 -c "import re,sys;print(len(re.findall(rb'/Type\s*/Page[^s]',open(sys.argv[1],'rb').read())))" "$pdf")
echo "$pdf: $pages page(s)"
