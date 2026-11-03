#!/usr/bin/env bash
# Publica a landing page na branch gh-pages (GitHub Pages).
# Uso: ./deploy.sh
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
REPO="${REPO:-https://github.com/robjunior/revenda.git}"
NAME="${GIT_AUTHOR_NAME:-robjunior}"
MAIL="${GIT_AUTHOR_EMAIL:-contato.paulorobertodev@gmail.com}"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

cp "$SRC/index.html" "$TMP/"
cp -r "$SRC/img" "$TMP/"
touch "$TMP/.nojekyll"          # serve os arquivos sem passar pelo Jekyll

cd "$TMP"
git init -q -b gh-pages
git add -A
git -c user.name="$NAME" -c user.email="$MAIL" commit -q -m "Publica landing page"
git remote add origin "$REPO"
git push -f origin gh-pages

echo "publicado: https://robjunior.github.io/revenda/"
