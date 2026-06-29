#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/init-loop-kit.sh "Project Name" [target-dir]

Creates a .loop/ directory in the target repo and copies the loop engineering templates.

Examples:
  ./scripts/init-loop-kit.sh "Product Loop Kit" .
  ./scripts/init-loop-kit.sh "New SaaS Tool" /path/to/repo
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

project_name="${1:-}"
target_dir="${2:-.}"

if [[ -z "$project_name" ]]; then
  usage
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"
template_dir="$repo_root/templates"

if [[ ! -d "$template_dir" ]]; then
  echo "Template directory not found: $template_dir" >&2
  exit 1
fi

if [[ ! -d "$target_dir" ]]; then
  echo "Target directory not found: $target_dir" >&2
  exit 1
fi

target_abs="$(cd -- "$target_dir" && pwd)"
dest_dir="$target_abs/.loop"
mkdir -p "$dest_dir"

escape_sed_replacement() {
  printf '%s' "$1" | sed 's/[\/&]/\\&/g'
}

project_name_escaped="$(escape_sed_replacement "$project_name")"
date_value="$(date +%Y-%m-%d)"

created=0
skipped=0

for src in "$template_dir"/*; do
  [[ -f "$src" ]] || continue
  dest="$dest_dir/$(basename "$src")"

  if [[ -e "$dest" ]]; then
    echo "skip: $dest already exists"
    skipped=$((skipped + 1))
    continue
  fi

  sed \
    -e "s/{{PROJECT_NAME}}/$project_name_escaped/g" \
    -e "s/{{DATE}}/$date_value/g" \
    "$src" > "$dest"

  echo "create: $dest"
  created=$((created + 1))
done

echo "done: created $created file(s), skipped $skipped file(s)"
