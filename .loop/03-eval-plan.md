# Product Loop Kit Eval Plan

Created: 2026-06-29

## Scope

This eval plan covers:

- Product slice: v0.2 validation and status.
- Critical workflows: validate this repo, detect missing `.loop/`, detect unfilled fresh templates, keep initializer behavior working, and preserve README/roadmap guidance.
- Known risks: validation rules may be too strict, too loose, or accidentally depend on tooling users do not have.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` | Yes | Verifies both scripts parse. |
| Validation pass | `./scripts/validate-loop-kit.sh .` | Yes | This repo should pass. |
| Missing `.loop` failure | Run validator against a new empty temp directory | Yes | Must exit non-zero and name missing `.loop`. |
| Fresh template failure | Initialize temp repo, then run validator before filling fields | Yes | Must exit non-zero on unresolved/blank template content. |
| Init smoke test | Run initializer against `mktemp -d` and count generated files | Yes | Must still generate 9 files. |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(...)'` | Yes | Applies to `.loop/00-loop-map.yaml`, `templates/00-loop-map.yaml`, and examples. |
| Whitespace check | `git diff --check` | Yes | Catches trailing whitespace and patch issues. |
| README path inspection | `test -e` for linked local paths | Yes | Ensure referenced files exist. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Validation pass | Validator exits 0 on this repo. |
| A2 | Missing `.loop` failure | Validator exits non-zero and reports `.loop directory not found`. |
| A3 | Fresh template failure | Validator exits non-zero and reports placeholder or blank template failures. |
| A4 | Shell syntax | Both scripts parse with `bash -n`. |
| A5 | README inspection | README documents validation and fresh-template failure behavior. |

## Manual Review Checklist

- [ ] Validator output is readable without extra tooling.
- [ ] Failure messages point to concrete `.loop/` files.
- [ ] Rules catch fresh blank templates.
- [ ] Rules do not print sensitive artifact body content.
- [ ] README makes validation timing clear.
- [ ] Roadmap reflects v0.2 implementation without overclaiming.

## Regression Evals

Add an eval when the same defect appears twice.

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Validator misses fresh blank templates | Keep fresh-template failure test | Maintainer | 2026-06-29 |
| Validator blocks valid self-application artifacts | Keep pass test on this repo | Maintainer | 2026-06-29 |
| README mentions a removed script path | Keep README path inspection | Maintainer | 2026-06-29 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Valid repo | `.` | Validator exits 0. |
| Missing `.loop` | New empty temp directory | Validator exits non-zero. |
| Blank templates | Temp directory initialized with `init-loop-kit.sh` | Validator exits non-zero. |
| Init still works | `Demo/Product & Loop`, `mktemp -d` | Initializer creates 9 files and preserves project name. |

## Evidence Required From Agent

- Commands run and results.
- Success and failure-path output summaries.
- File list for changed artifacts.
- Notes for skipped checks or warnings.
- Known risks or unverified assumptions.
