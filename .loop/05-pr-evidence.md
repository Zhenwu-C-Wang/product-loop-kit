# Product Loop Kit PR Evidence

Created: 2026-07-13

## Summary

- Slice: roadmap refresh and human-token retention contract
- Branch/PR: local working tree on `main`
- Agent: Codex
- Status: ready for developer review

## Changes

- Reordered the roadmap so external adoption and human-token proof precede distribution and executable automation.
- Added v0.8 durable iteration memory and v0.9 executable loop contract as evidence-gated later milestones.
- Expanded the external adoption protocol to measure time to implementation, extra prompts, material corrections, durable destinations, and second-task reuse.
- Added a human-token retention ledger and prior-correction field to the developer review template.
- Added the durable-correction control rule to the framework, first-loop guide, loop-map template, and Product Loop Kit's own artifacts.
- Recorded the user-provided guidance as a feedback source and product decision without claiming real adoption.

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | `docs/roadmap.md` marks v0.7 as external adoption and human-token proof, followed by v0.8 memory and v0.9 executable contracts. | Complete |
| A2 | `docs/external-adoption-loop.md` now captures first-evidence time, extra prompts, correction destinations, repeated context, and second-task reuse. | Complete |
| A3 | `templates/06-developer-review.md` contains a Human-Token Retention ledger and prior-corrections field for the next task. | Complete |
| A4 | Framework control rules and first-loop guidance require material corrections to move into durable artifacts before the next task. | Complete |
| A5 | Product vision, spec, external feedback digest, and decision log retain the source and resulting decision. | Complete |
| A6 | Validator, readiness score, score tests, prototype tests, shell syntax, YAML parsing, retention search, and whitespace checks pass. | Complete |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` | Pass | 63 passed, 0 warnings, 0 failed. |
| Product-loop readiness score | `./scripts/score-loop-kit.sh .` | Pass | 100/100, P4 external-learning-ready. |
| Score regression tests | `./scripts/test-score-loop-kit.sh` | Pass | P0, P1, P2, P3, and P4 assertions passed. |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` | Pass | Six tests passed. |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` | Pass | All scripts parse. |
| YAML parse | Ruby YAML parse for `.loop`, template, and Typing Tutor loop maps | Pass | All loop maps parse. |
| Retention contract | `rg` across docs, templates, and `.loop` | Pass | Rule appears in the roadmap, framework, guides, templates, and self-application artifacts. |
| Whitespace | `git diff --check` | Pass | No whitespace errors. |

## Product Inspection

- Roadmap sequence: completed foundation -> v0.7 external adoption -> v0.8 durable memory -> v0.9 executable contract -> v1.0 proven workflow.
- Adoption path: first imperfect spec -> early implementation -> human correction -> durable destination -> second task -> repeated-context check.
- First-loop surface: remains the same four initial artifacts; no tenth mandatory artifact was added.
- Product memory: the supplied product judgment is retained in vision, spec, feedback digest, roadmap, and decision log.
- Claim boundary: external user interviews and real product repo applications remain explicitly at zero.

## Risks And Tradeoffs

| Risk | Impact | Mitigation/Next Step |
| --- | --- | --- |
| A retention ledger could become documentation ceremony. | Builders may record low-value conversation instead of product memory. | Definition limits entries to behavior, quality bar, constraint, or evaluation changes. |
| A second task may not naturally fit a 30-60 minute adoption session. | The strongest retention signal may be unavailable. | Choose a small two-step slice or mark reuse as not tested rather than fabricating evidence. |
| Self-application can still create false confidence. | Local completeness may be mistaken for adoption proof. | Roadmap and feedback digest keep real adoption as the v0.7 exit gate. |
| Git history may be insufficient as slice memory. | New agent sessions may not find old corrections. | Test discoverability in v0.7 before building v0.8 history support. |

## Skipped Or Blocked Checks

| Check | Reason | Owner |
| --- | --- | --- |
| Real external adoption | Requires a real builder and real product repo. | Maintainer |
| Second-agent-task retention test | Belongs to the v0.7 adoption session. | Maintainer |

## Questions For Developer Review

- Can the adoption session naturally include two bounded agent tasks without making the test artificial?
- Is a material-correction ledger enough, or will v0.7 show that completed slice history needs a dedicated lightweight archive?
