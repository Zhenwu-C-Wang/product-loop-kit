#!/usr/bin/env bash
set -u

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/validate-loop-kit.sh [target-dir]

Checks whether a target repo has a usable .loop/ setup for the Loop Engineering Framework.

The validator is intentionally strict about blank template placeholders. A freshly initialized
.loop/ directory is expected to fail until the first product slice is filled in.

Examples:
  ./scripts/validate-loop-kit.sh .
  ./scripts/validate-loop-kit.sh /path/to/product-repo
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

target_dir="${1:-.}"

pass_count=0
warn_count=0
fail_count=0

pass() {
  printf 'pass: %s\n' "$1"
  pass_count=$((pass_count + 1))
}

warn() {
  printf 'warn: %s\n' "$1"
  warn_count=$((warn_count + 1))
}

fail() {
  printf 'fail: %s\n' "$1"
  fail_count=$((fail_count + 1))
}

if [[ ! -d "$target_dir" ]]; then
  fail "target directory not found: $target_dir"
  printf 'summary: %d passed, %d warning(s), %d failed\n' "$pass_count" "$warn_count" "$fail_count"
  exit 1
fi

target_abs="$(cd -- "$target_dir" && pwd)"
loop_dir="$target_abs/.loop"

if [[ ! -d "$loop_dir" ]]; then
  fail ".loop directory not found in $target_abs"
  printf 'summary: %d passed, %d warning(s), %d failed\n' "$pass_count" "$warn_count" "$fail_count"
  exit 1
fi

required_files=(
  "00-loop-map.yaml"
  "01-product-vision.md"
  "02-product-spec.md"
  "03-eval-plan.md"
  "04-agent-task.md"
  "05-pr-evidence.md"
  "06-developer-review.md"
  "07-external-feedback-digest.md"
  "08-decision-log.md"
)

require_file() {
  local rel="$1"
  if [[ -f "$loop_dir/$rel" ]]; then
    pass "found .loop/$rel"
  else
    fail "missing .loop/$rel"
  fi
}

require_contains() {
  local rel="$1"
  local pattern="$2"
  local message="$3"
  local file="$loop_dir/$rel"

  if [[ ! -f "$file" ]]; then
    fail "cannot check .loop/$rel: file missing"
    return
  fi

  if grep -Eq "$pattern" "$file"; then
    pass "$message"
  else
    fail "$message"
  fi
}

require_absent() {
  local rel="$1"
  local pattern="$2"
  local message="$3"
  local file="$loop_dir/$rel"

  if [[ ! -f "$file" ]]; then
    fail "cannot check .loop/$rel: file missing"
    return
  fi

  if grep -Eq "$pattern" "$file"; then
    fail "$message"
  else
    pass "$message"
  fi
}

for rel in "${required_files[@]}"; do
  require_file "$rel"
done

require_contains "00-loop-map.yaml" '^project:[[:space:]]*"?.+"?$' "loop map has project"
require_contains "00-loop-map.yaml" '^loops:' "loop map has loops section"
require_contains "00-loop-map.yaml" '^[[:space:]]+agentic_coding:' "loop map has agentic coding loop"
require_contains "00-loop-map.yaml" '^[[:space:]]+developer_feedback:' "loop map has developer feedback loop"
require_contains "00-loop-map.yaml" '^[[:space:]]+external_feedback:' "loop map has external feedback loop"

if command -v ruby >/dev/null 2>&1; then
  if ruby -e 'require "yaml"; YAML.load_file(ARGV.fetch(0))' "$loop_dir/00-loop-map.yaml" >/dev/null 2>&1; then
    pass "loop map parses as YAML"
  else
    fail "loop map parses as YAML"
  fi
else
  warn "ruby not found; skipped strict YAML parse"
fi

placeholder_pattern='\{\{PROJECT_NAME\}\}|\{\{DATE\}\}|\[target user\]|\[product\]|\[job/outcome\]|\[core mechanism\]|\[evidence\]|\[user\]|\[action\]|\[outcome\]'
empty_template_row_pattern='^\|[[:space:]]*\|[[:space:]\|]*$|^\|[[:space:]]*[A-Z]?[0-9]+[[:space:]]*\|[[:space:]]*\|'
blank_bullet_pattern='^-[[:space:]]*$'

for rel in "${required_files[@]}"; do
  require_absent "$rel" "$placeholder_pattern" ".loop/$rel has no unresolved placeholders"
  require_absent "$rel" "$empty_template_row_pattern" ".loop/$rel has no empty template table rows"
  require_absent "$rel" "$blank_bullet_pattern" ".loop/$rel has no blank bullets"
done

require_contains "01-product-vision.md" '^- Primary user:[[:space:]]+[^[:space:]].+' "vision names a primary user"
require_contains "01-product-vision.md" '^> For [^[]+.+' "vision has a filled product bet"
require_contains "01-product-vision.md" '^## Current Risks' "vision tracks current risks"

require_contains "02-product-spec.md" '^- Name:[[:space:]]+[^[:space:]].+' "spec names the current slice"
require_contains "02-product-spec.md" '^- Status:[[:space:]]+[^[:space:]].+' "spec has a status"
require_contains "02-product-spec.md" '^\| R[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "spec has at least one filled requirement"
require_contains "02-product-spec.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "spec has at least one filled acceptance criterion"

require_contains "03-eval-plan.md" '^## Required Checks' "eval plan has required checks"
require_contains "03-eval-plan.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "eval plan maps acceptance criteria"

require_contains "04-agent-task.md" '^## Goal' "agent task has goal section"
require_contains "04-agent-task.md" '^## Scope' "agent task has scope section"
require_contains "04-agent-task.md" '^\| [^|]+[[:space:]]*\|[[:space:]]*`?[^|[:space:]][^|]*\|' "agent task lists executable or review commands"
require_contains "04-agent-task.md" '^## Completion Contract' "agent task has completion contract"

require_contains "05-pr-evidence.md" '^- Status:[[:space:]]+[^[:space:]].+' "PR evidence has status"
require_contains "05-pr-evidence.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "PR evidence covers acceptance criteria"
require_contains "05-pr-evidence.md" '^\| [^|]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*[[:space:]]*\|[[:space:]]*(Pass|Complete|Skipped|Pending|Fail)' "PR evidence records check results"

require_contains "06-developer-review.md" '^Decision:[[:space:]]+(accept|iterate|change spec|change vision|stop)$' "developer review has a single decision"
require_contains "06-developer-review.md" '^\| Does the product behavior match the intended user outcome\?[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "developer review includes product judgment"

require_contains "07-external-feedback-digest.md" '^Decision:[[:space:]]+(continue|refine|pivot|pause)$' "external feedback digest has a single decision"
require_contains "07-external-feedback-digest.md" '^## Observations' "external feedback digest separates observations"

require_contains "08-decision-log.md" '^\| [0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|' "decision log has at least one dated decision"

printf 'summary: %d passed, %d warning(s), %d failed\n' "$pass_count" "$warn_count" "$fail_count"

if [[ "$fail_count" -gt 0 ]]; then
  exit 1
fi

exit 0
