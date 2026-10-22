#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${PROJECT_DIR:-$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)}"
REPO_NAME="git-komento-opas"

cd "$PROJECT_DIR"

if ! command -v git >/dev/null 2>&1; then
  echo "Virhe: git-komentoa ei löydy." >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "Virhe: GitHub CLI (gh) puuttuu. Asenna se esimerkiksi: brew install gh" >&2
  exit 1
fi

gh auth status

if [[ ! -d .git ]]; then
  git init -b main
fi

git status --short

if [[ -n "$(git status --porcelain)" ]]; then
  git add README.md .gitignore PUBLISH.sh
  git diff --staged --check
  git diff --staged
  git commit -m "docs: add Finnish Git command guide"
fi

gh repo create "$REPO_NAME" \
  --public \
  --description "Käytännönläheinen suomenkielinen Git-komento-opas" \
  --source=. \
  --remote=origin \
  --push

echo
echo "Valmis: https://github.com/$(gh api user --jq .login)/$REPO_NAME"
