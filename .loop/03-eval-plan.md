# Product Loop Kit Eval Plan

Created: 2026-06-29

## Scope

This eval plan covers:

- Product slice: v0.3 reference case study.
- Critical workflows: find the case study from README, inspect the typing-tutor artifacts, verify the case study spans all three loops, and keep validator status passing.
- Known risks: overclaiming real external validation, duplicating template content without showing decisions, or creating artifacts that are too abstract to reuse.

## Required Checks

| Check | Command/Method | Required For Merge | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Yes | This repo's `.loop/` must stay complete. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` | Yes | Existing scripts must keep parsing. |
| Whitespace check | `git diff --check` | Yes | Catches trailing whitespace and patch issues. |
| YAML parse | Ruby YAML parse for loop maps | Yes | Applies to `.loop`, template, and typing-tutor loop maps. |
| Case-study file check | `test -f examples/typing-tutor/case-study.md` | Yes | Confirms the entry point exists. |
| Artifact file check | `test -f` for typing-tutor vision, feedback, spec, eval, task, evidence, and review files | Yes | Confirms full example package exists. |
| README inspection | Manual or `rg` path check | Yes | README should link directly to the case study. |

## Acceptance Coverage

| Acceptance Criterion | Eval Or Check | Evidence Expected |
| --- | --- | --- |
| A1 | Case-study inspection | Case study describes external, developer, and agentic loops. |
| A2 | Artifact file check | Example contains all required loop artifacts. |
| A3 | README inspection | README links to `examples/typing-tutor/case-study.md`. |
| A4 | Roadmap inspection | Roadmap says reference case study, not real external adoption. |
| A5 | Validator pass | Validator exits 0 with no failed checks. |

## Manual Review Checklist

- [ ] Case study has a clear starting signal.
- [ ] External feedback changes the product slice before coding.
- [ ] Product spec has bounded acceptance criteria.
- [ ] Eval plan turns likely failures into checks.
- [ ] PR evidence distinguishes required future evidence from completed evidence.
- [ ] Developer review names the next loop.
- [ ] README and roadmap use accurate language.

## Regression Evals

| Defect Pattern | Eval Added | Owner | Date |
| --- | --- | --- | --- |
| Case study overclaims real user evidence | Roadmap and case-study wording inspection | Maintainer | 2026-06-29 |
| Example omits a loop artifact | Artifact file check | Maintainer | 2026-06-29 |
| Self-application artifacts drift from validator rules | Validator pass on this repo | Maintainer | 2026-06-29 |

## Test Data

| Scenario | Input/Data | Expected Result |
| --- | --- | --- |
| Case-study link | README repo map | Link points to existing case-study file. |
| Example artifact set | `examples/typing-tutor/` | Contains vision, feedback, spec, eval, task, evidence, review, case study, and loop map. |
| Self validation | Current repo | Validator passes. |

## Evidence Required From Agent

- Commands run and results.
- File list for typing-tutor artifacts.
- README/roadmap inspection notes.
- Validator summary.
- Known risks or unverified assumptions.
