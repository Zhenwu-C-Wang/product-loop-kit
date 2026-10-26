#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"
score_script="$script_dir/score-loop-kit.sh"
init_script="$script_dir/init-loop-kit.sh"
expected_file="$repo_root/tests/fixtures/score/expected-levels.tsv"
evidence_boundary='Evidence boundary: readiness scores artifact completeness; they do not prove external adoption or product-market validation.'

tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT

write_agent_ready_files() {
  local target="$1"
  local loop_dir="$target/.loop"

  cat > "$loop_dir/00-loop-map.yaml" <<'EOF'
project: "Fixture Product"
created_at: "2026-07-06"
loops:
  agentic_coding:
    owner: "AI coding agent"
  developer_feedback:
    owner: "developer"
  external_feedback:
    owner: "users"
EOF

  cat > "$loop_dir/01-product-vision.md" <<'EOF'
# Fixture Product Vision

## Target User

- Primary user: Product-minded builder

## Product Bet

> For product-minded builders, Fixture Product will help them test a loop by making the next product slice concrete, and we will know it is working when an agent can act without extra prompting.

## Current Risks

| Risk | Why It Matters | How We Will Learn |
| --- | --- | --- |
| Ambiguous scope | Agent may build the wrong thing | Run a small implementation loop |
EOF

  cat > "$loop_dir/02-product-spec.md" <<'EOF'
# Fixture Product Spec

## Slice

- Name: First useful slice
- Status: draft

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Show one useful action. | Must | Keep scope small. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | User can complete the action. | Manual workflow check. |
EOF

  cat > "$loop_dir/03-eval-plan.md" <<'EOF'
# Fixture Eval Plan

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Manual workflow | Open the app and complete the action | Yes | Product behavior matters. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Manual workflow | Completion note. |
EOF

  cat > "$loop_dir/04-agent-task.md" <<'EOF'
# Fixture Agent Task

## Goal

Implement one useful action.

## Scope

In scope:

- One small product behavior.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Smoke test | `true` |

## Completion Contract

Return summary, evidence, and risks.
EOF

  cat > "$loop_dir/07-external-feedback-digest.md" <<'EOF'
# Fixture External Feedback Digest

## Observations

| Observation | Source | Frequency | Confidence |
| --- | --- | --- |
| Builder needs a bounded first task. | Interview | 1 | Medium |

## Decisions

Decision: refine
EOF
}

write_pr_evidence_file() {
  local target="$1"

  cat > "$target/.loop/05-pr-evidence.md" <<'EOF'
# Fixture PR Evidence

## Summary

- Status: ready for review

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | Manual workflow completed. | Complete |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Smoke test | `true` | Pass | Command succeeded. |
EOF
}

setup_case() {
  local scenario="$1"
  local target="$tmp_root/$scenario"

  mkdir -p "$target"

  case "$scenario" in
    p0_missing_loop)
      ;;
    p1_initialized)
      "$init_script" "Fixture Product" "$target" >/dev/null
      ;;
    p2_agent_ready)
      "$init_script" "Fixture Product" "$target" >/dev/null
      write_agent_ready_files "$target"
      ;;
    p3_evidence_ready)
      "$init_script" "Fixture Product" "$target" >/dev/null
      write_agent_ready_files "$target"
      write_pr_evidence_file "$target"
      ;;
    p4_current_repo)
      target="$repo_root"
      ;;
    *)
      printf 'unknown score fixture scenario: %s\n' "$scenario" >&2
      return 1
      ;;
  esac

  printf '%s\n' "$target"
}

assert_contains() {
  local output="$1"
  local expected="$2"
  local scenario="$3"

  if grep -Fq -- "$expected" <<<"$output"; then
    printf 'pass: %s contains %s\n' "$scenario" "$expected"
  else
    printf 'fail: %s missing expected output: %s\n' "$scenario" "$expected" >&2
    printf '%s\n' "$output" >&2
    return 1
  fi
}

while IFS=$'\t' read -r scenario expected_line expected_category; do
  [[ -n "${scenario:-}" ]] || continue
  [[ "$scenario" == \#* ]] && continue

  target="$(setup_case "$scenario")"
  output="$("$score_script" "$target")"

  assert_contains "$output" "$expected_line" "$scenario"
  assert_contains "$output" "$expected_category" "$scenario"
  assert_contains "$output" "$evidence_boundary" "$scenario"
done < "$expected_file"
