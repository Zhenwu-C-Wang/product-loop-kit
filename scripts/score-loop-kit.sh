#!/usr/bin/env bash
set -u

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/score-loop-kit.sh [target-dir]

Scores a target repo's .loop/ artifacts for product-loop readiness.

The score measures artifact completeness and does not prove external adoption
or product-market validation.

This complements validate-loop-kit.sh:
  - validate-loop-kit.sh is a strict pass/fail gate.
  - score-loop-kit.sh shows maturity across product context, agent handoff,
    implementation evidence, review, and artifact hygiene.

Examples:
  ./scripts/score-loop-kit.sh .
  ./scripts/score-loop-kit.sh /path/to/product-repo
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

target_dir="${1:-.}"

if [[ ! -d "$target_dir" ]]; then
  printf 'error: target directory not found: %s\n' "$target_dir" >&2
  exit 1
fi

target_abs="$(cd -- "$target_dir" && pwd)"
loop_dir="$target_abs/.loop"

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

structure_score=0
product_context_score=0
agent_handoff_score=0
evidence_review_score=0
hygiene_score=0
total_score=0
next_actions=()

add_points() {
  local category="$1"
  local points="$2"

  total_score=$((total_score + points))

  case "$category" in
    structure) structure_score=$((structure_score + points)) ;;
    product_context) product_context_score=$((product_context_score + points)) ;;
    agent_handoff) agent_handoff_score=$((agent_handoff_score + points)) ;;
    evidence_review) evidence_review_score=$((evidence_review_score + points)) ;;
    hygiene) hygiene_score=$((hygiene_score + points)) ;;
  esac
}

file_exists() {
  local rel="$1"
  [[ -f "$loop_dir/$rel" ]]
}

contains() {
  local rel="$1"
  local pattern="$2"
  file_exists "$rel" && grep -Eq "$pattern" "$loop_dir/$rel"
}

absent() {
  local rel="$1"
  local pattern="$2"
  file_exists "$rel" && ! grep -Eq "$pattern" "$loop_dir/$rel"
}

all_required_files_exist() {
  local rel
  [[ -d "$loop_dir" ]] || return 1

  for rel in "${required_files[@]}"; do
    file_exists "$rel" || return 1
  done

  return 0
}

all_absent() {
  local pattern="$1"
  local rel

  all_required_files_exist || return 1

  for rel in "${required_files[@]}"; do
    absent "$rel" "$pattern" || return 1
  done

  return 0
}

if [[ -d "$loop_dir" ]]; then
  add_points structure 2
else
  next_actions+=("Run ./scripts/init-loop-kit.sh to create .loop/ artifacts.")
fi

for rel in "${required_files[@]}"; do
  if file_exists "$rel"; then
    add_points structure 2
  fi
done

if [[ "$structure_score" -lt 20 ]]; then
  next_actions+=("Restore the complete 9-file .loop/ artifact set.")
fi

if contains "00-loop-map.yaml" '^project:[[:space:]]*"?.+"?$'; then
  add_points product_context 4
fi

if contains "01-product-vision.md" '^- Primary user:[[:space:]]+[^[:space:]].+'; then
  add_points product_context 4
fi

if contains "01-product-vision.md" '^> For [^[]+.+'; then
  add_points product_context 4
fi

if contains "01-product-vision.md" '^## Current Risks'; then
  add_points product_context 3
fi

if contains "07-external-feedback-digest.md" '^## Observations'; then
  add_points product_context 3
fi

if contains "07-external-feedback-digest.md" '^Decision:[[:space:]]+(continue|refine|pivot|pause)$'; then
  add_points product_context 2
fi

if [[ "$product_context_score" -lt 20 ]]; then
  next_actions+=("Fill product vision, risks, and external feedback interpretation before adding more agent work.")
fi

if contains "02-product-spec.md" '^- Name:[[:space:]]+[^[:space:]].+'; then
  add_points agent_handoff 4
fi

if contains "02-product-spec.md" '^- Status:[[:space:]]+[^[:space:]].+'; then
  add_points agent_handoff 3
fi

if contains "02-product-spec.md" '^\| R[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points agent_handoff 5
fi

if contains "02-product-spec.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points agent_handoff 5
fi

if contains "03-eval-plan.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points agent_handoff 4
fi

if contains "04-agent-task.md" '^## Goal'; then
  add_points agent_handoff 1
fi

if contains "04-agent-task.md" '^## Scope'; then
  add_points agent_handoff 1
fi

if contains "04-agent-task.md" '^\| [^|]+[[:space:]]*\|[[:space:]]*`?[^|[:space:]][^|]*\|'; then
  add_points agent_handoff 1
fi

if contains "04-agent-task.md" '^## Completion Contract'; then
  add_points agent_handoff 1
fi

if [[ "$agent_handoff_score" -lt 25 ]]; then
  next_actions+=("Tighten spec, eval mapping, and agent task before handing work to an AI coding agent.")
fi

if contains "05-pr-evidence.md" '^- Status:[[:space:]]+[^[:space:]].+'; then
  add_points evidence_review 4
fi

if contains "05-pr-evidence.md" '^\| A[0-9]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points evidence_review 5
fi

if contains "05-pr-evidence.md" '^\| [^|]+[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*[[:space:]]*\|[[:space:]]*(Pass|Complete|Skipped|Pending|Fail)'; then
  add_points evidence_review 5
fi

if contains "06-developer-review.md" '^Decision:[[:space:]]+(accept|iterate|change spec|change vision|stop)$'; then
  add_points evidence_review 5
fi

if contains "06-developer-review.md" '^\| Does the product behavior match the intended user outcome\?[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points evidence_review 3
fi

if contains "08-decision-log.md" '^\| [0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]]*\|[[:space:]]+[^|[:space:]][^|]*\|'; then
  add_points evidence_review 3
fi

if [[ "$evidence_review_score" -lt 25 ]]; then
  next_actions+=("Record PR evidence, developer review, and a dated decision before treating the slice as complete.")
fi

placeholder_pattern='\{\{PROJECT_NAME\}\}|\{\{DATE\}\}|\[target user\]|\[product\]|\[job/outcome\]|\[core mechanism\]|\[evidence\]|\[user\]|\[action\]|\[outcome\]'
empty_template_row_pattern='^\|[[:space:]]*\|[[:space:]\|]*$|^\|[[:space:]]*[A-Z]?[0-9]+[[:space:]]*\|[[:space:]]*\|'
blank_bullet_pattern='^-[[:space:]]*$'

if all_absent "$placeholder_pattern"; then
  add_points hygiene 4
fi

if all_absent "$empty_template_row_pattern"; then
  add_points hygiene 3
fi

if all_absent "$blank_bullet_pattern"; then
  add_points hygiene 2
fi

if command -v ruby >/dev/null 2>&1 && contains "00-loop-map.yaml" '^project:'; then
  if ruby -e 'require "yaml"; YAML.load_file(ARGV.fetch(0))' "$loop_dir/00-loop-map.yaml" >/dev/null 2>&1; then
    add_points hygiene 1
  fi
fi

if [[ "$hygiene_score" -lt 10 ]]; then
  next_actions+=("Resolve placeholders, empty template rows, blank bullets, or YAML issues.")
fi

if [[ "$total_score" -ge 90 ]]; then
  level="P4 external-learning-ready"
elif [[ "$total_score" -ge 75 ]]; then
  level="P3 evidence-ready"
elif [[ "$total_score" -ge 50 ]]; then
  level="P2 agent-ready"
elif [[ "$total_score" -ge 25 ]]; then
  level="P1 initialized"
else
  level="P0 not-ready"
fi

printf 'Product Loop Readiness: %d/100 (%s)\n' "$total_score" "$level"
printf 'target: %s\n\n' "$target_abs"

printf 'Categories:\n'
printf '%s\n' "- Structure: $structure_score/20"
printf '%s\n' "- Product context: $product_context_score/20"
printf '%s\n' "- Agent handoff: $agent_handoff_score/25"
printf '%s\n' "- Evidence and review: $evidence_review_score/25"
printf '%s\n\n' "- Artifact hygiene: $hygiene_score/10"

printf 'Levels:\n'
printf '%s\n' '- P0 not-ready: missing or unusable loop artifacts'
printf '%s\n' '- P1 initialized: .loop/ exists but product context is incomplete'
printf '%s\n' '- P2 agent-ready: spec, evals, and task can guide implementation'
printf '%s\n' '- P3 evidence-ready: implementation evidence and developer review are recorded'
printf '%s\n\n' '- P4 external-learning-ready: artifacts can capture external learning; the score does not prove external adoption'

printf '%s\n\n' 'Evidence boundary: readiness scores artifact completeness; they do not prove external adoption or product-market validation.'

if [[ "${#next_actions[@]}" -eq 0 ]]; then
  printf 'Next action: run the next external feedback loop with a real user or real product repo.\n'
else
  printf 'Next actions:\n'
  for action in "${next_actions[@]}"; do
    printf '%s\n' "- $action"
  done
fi
