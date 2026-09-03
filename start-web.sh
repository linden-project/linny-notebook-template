#!/usr/bin/env bash
# Start the Linny web-view (Hugo + linny-web-theme) on http://localhost:9999/.
#
# This is SEPARATE from the linny.vim JSON indexer (./RUNME.sh start). It renders
# your notes as a searchable static site using the linny-web-theme Hugo module.
#
# Requirements: Hugo (extended, >= 0.100), Go (>= 1.21) on PATH, python3.
set -euo pipefail

cd "$(dirname "$0")"

PORT="${PORT:-9999}"
STAGING=".web-staging"

# 1. Fetch/refresh the theme module (best-effort; no-op once cached).
hugo mod get github.com/torreirow/linny-web-theme || true

# 2. Box-drawing CLI-output (e.g. `aws … --output table`, U+2500–U+259F) breaks
#    Markdown. Wrap it in ```text fences on a STAGING COPY so your notes stay
#    untouched. Idempotent. A theme can't do this (it only sees parsed content).
rm -rf "$STAGING"
mkdir -p "$STAGING/content"
cp -r content/. "$STAGING/content/"
while IFS= read -r -d '' f; do
  python3 fence.py < "$f" > "$f.pf" && mv "$f.pf" "$f"
done < <(find "$STAGING/content" -name '*.md' -print0)

# 3. Serve. --configDir doesnotexist keeps the linny.vim indexer config out of
#    the web build; --contentDir points Hugo at the fenced staging copy.
exec hugo server \
  --config hugo-web.yaml \
  --configDir doesnotexist \
  --contentDir "$STAGING/content" \
  --bind 0.0.0.0 \
  --port "$PORT" \
  --ignoreCache \
  --disableFastRender \
  --cleanDestinationDir
