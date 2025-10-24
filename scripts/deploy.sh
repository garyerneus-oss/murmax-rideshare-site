#!/usr/bin/env bash
set -euo pipefail

# Navigate to project root (where this script resides -> up one)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR/.."

echo "▶ Installing dependencies..."
npm install

echo "▶ Building production bundle..."
npm run build

echo "▶ Zipping dist/ for upload..."
cd dist
zip -r ../dist_upload.zip . >/dev/null
cd ..

echo "✅ Done. Upload dist_upload.zip to your CPANEL public_html (extract there)."
