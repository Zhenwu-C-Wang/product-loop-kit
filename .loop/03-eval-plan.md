# Product Loop Kit Eval Plan

Created: 2026-06-29

## Scope

This eval plan covers:

- Product slice: v0.1 plain-file loop kit.
- Critical workflows: initialize `.loop/`, inspect generated artifacts, understand next steps from README, and validate YAML artifacts.
- Known risks: template drift, broken script behavior, vague self-application artifacts, and README links that do not match repo structure.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Shell syntax | `bash -n scripts/init-loop-kit.sh` | Yes | Verifies initializer parses. |
| Init smoke test | Run script against `mktemp -d` and count generated files | Yes | Must generate 9 files. |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(...)'` | Yes | Applies to `.loop/00-loop-map.yaml`, `templates/00-loop-map.yaml`, and examples. |
| Whitespace check | `git diff --check` | Yes | Catches trailing whitespace and patch issues. |
| Link/path inspection | Manual README and docs inspection | Yes | Ensure referenced files exist. |
| Vocabulary inspection | `rg "Agentic coding loop|Developer feedback loop|External feedback loop|agentic_coding|developer_feedback|external_feedback"` | Should | Confirms three-loop model appears consistently. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Init smoke test | Script creates 9 files in a temporary `.loop/`. |
| A2 | Manual `.loop/` inspection | Vision, spec, eval plan, and agent task contain Product Loop Kit v0.1 content. |
| A3 | Vocabulary inspection | Three-loop terms appear in framework, templates, and self-application artifacts. |
| A4 | YAML parse | YAML parser exits successfully. |
| A5 | README inspection | README links to framework, templates, example, script, and roadmap. |

## Manual Review Checklist

- [ ] README makes the first action obvious.
- [ ] Framework doc explains why each loop exists and when to stop.
- [ ] Templates are useful when blank, not just after being filled.
- [ ] Self-application artifacts show how to use the kit on itself.
- [ ] Initializer avoids overwriting existing `.loop/` files.
- [ ] No artifact encourages committing secrets or raw sensitive feedback.

## Regression Evals

Add an eval when the same defect appears twice.

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Broken or stale README links | Add markdown link checker or local path checker | Maintainer | TBD |
| Template fields drift from framework vocabulary | Add vocabulary consistency script | Maintainer | TBD |
| Generated `.loop/` files overwrite existing work | Add overwrite-policy test | Maintainer | TBD |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Basic init | `Product Loop Kit`, `.` | Creates `.loop/` when absent; skips files when present. |
| Temp init | `Demo/Product & Loop`, `mktemp -d` | Preserves slash and ampersand in generated project name. |
| Missing target | Project name plus nonexistent path | Exits non-zero with clear error. |

## Evidence Required From Agent

- Commands run and results.
- File list for generated or changed artifacts.
- Notes for skipped checks.
- Known risks or unverified assumptions.
