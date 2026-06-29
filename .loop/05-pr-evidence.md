# Product Loop Kit PR Evidence

Created: 2026-06-29

## Summary

- Slice: v0.2 validation and status
- Branch/PR: local working tree
- Agent: Codex
- Status: ready for developer review

## Changes

- Added `scripts/validate-loop-kit.sh`.
- Documented validation usage in README.
- Updated roadmap to describe v0.2 validation behavior.
- Updated `.loop/` spec, eval plan, and agent task for the validation slice.

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | `./scripts/validate-loop-kit.sh .` passes on this repo with `63 passed, 0 warning(s), 0 failed`. | Complete |
| A2 | Validator fails clearly when `.loop/` is missing with `.loop directory not found`. | Complete |
| A3 | Validator fails clearly on freshly initialized but unfilled templates with `25 failed`. | Complete |
| A4 | Both shell scripts parse successfully with `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh`. | Complete |
| A5 | README documents validation and fresh-template failure behavior. | Complete |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Initial validator pass | `./scripts/validate-loop-kit.sh .` | Pass | Passed before final `.loop` evidence updates. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` | Pass | Both scripts parse. |
| Validation pass | `./scripts/validate-loop-kit.sh .` | Pass | 63 passed, 0 warnings, 0 failed. |
| Missing `.loop` failure | Validator against a fresh empty temp directory | Pass | Exits non-zero and reports `.loop directory not found`. |
| Fresh template failure | Initialize temp repo, then validate before filling fields | Pass | Exits non-zero with 25 failures. |
| Init smoke test | Temporary directory initialization | Pass | Generated 9 files and preserved `Demo/Product & Loop`. |
| YAML parse | Ruby YAML parse for `.loop/00-loop-map.yaml`, `templates/00-loop-map.yaml`, and `examples/typing-tutor/loop-map.yaml` | Pass | YAML artifacts parse. |
| Whitespace | `git diff --check` | Pass | No whitespace errors. |
| README path inspection | `test -e` for linked local paths | Pass | Framework, roadmap, templates, example, and both scripts exist. |

## Product Inspection

- Environment: local repo in Codex desktop.
- Viewports/devices: not applicable for v0.2 shell script.
- Screenshots/videos: not applicable.
- Workflow notes: The validator treats blank templates as incomplete, which preserves the difference between initialized and agent-ready.

## Risks And Tradeoffs

| Risk | Impact | Mitigation/Next Step |
| --- | --- | --- |
| Validation rules may be too strict for some teams. | Valid but differently worded artifacts may fail. | Use real case studies before adding configurability. |
| Validation rules may be too loose. | Incomplete artifacts may pass. | Add failure cases as repeated misses are found. |
| Ruby YAML parsing is optional. | Users without Ruby get less strict YAML coverage. | Keep structural loop-map checks in shell; revisit dependencies when packaging. |

## Skipped Or Blocked Checks

| Check | Reason | Owner |
| --- | --- | --- |
| Full Markdown AST validation | Out of scope for plain shell v0.2. | Maintainer |

## Questions For Developer Review

- Should v0.3 add JSON output for CI and agent consumption?
- Should validation rules be configurable per repo, or remain opinionated until more case studies exist?
