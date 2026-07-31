#!/usr/bin/env bash
set -euo pipefail

HUGO_VERSION="0.164.0"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
BASE_URL="${VERCEL_PROJECT_PRODUCTION_URL:-my-blog.vercel.app}"

echo "==> Downloading Hugo Extended ${HUGO_VERSION}"
curl -L -o /tmp/hugo.tar.gz "${HUGO_URL}"
tar -xzf /tmp/hugo.tar.gz -C /tmp
chmod +x /tmp/hugo
/tmp/hugo version

echo "==> Building site"
cd my-blog
/tmp/hugo --gc --minify --baseURL "https://${BASE_URL}/"

echo "==> Build complete"
