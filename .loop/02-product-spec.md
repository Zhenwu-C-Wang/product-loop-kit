# Product Loop Kit Product Spec

Created: 2026-07-13

## Slice

- Name: roadmap refresh and human-token retention contract
- Owner: maintainer
- Status: complete
- Related vision bet: Product Loop Kit should preserve scarce human product judgment across cheap agent iterations while keeping early 0-to-1 work lightweight.

## Problem

The current roadmap reaches an external adoption milestone, but it does not yet make the most important learning goal explicit: whether durable repo context prevents a builder from repeating the same product correction in the next agent iteration.

The adoption protocol measures setup friction, but it does not capture time to first implementation, extra prompts, repeated corrections, or where a material human decision was persisted. Without those signals, a complete artifact set could look successful while still wasting the builder's context and attention.

## User Story

As a product-minded engineer iterating with coding agents, I want material product corrections to become durable repo memory before the next task, so that I can spend my time on new judgment instead of re-explaining old decisions.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Reframe the roadmap around external adoption, human-token retention, durable iteration memory, and an executable loop contract. | Must | Keep distribution after evidence, not before it. |
| R2 | Add human-token measures to the external adoption protocol. | Must | Capture time, extra prompts, repeated corrections, and second-task reuse. |
| R3 | Add a durable-correction section to developer review. | Must | Each material correction names its destination and resulting update. |
| R4 | Update framework and first-loop guidance with the retention rule. | Must | Important feedback must not remain only in chat or review prose. |
| R5 | Self-apply the new rule in Product Loop Kit artifacts. | Must | Record the source, decision, evidence, and next external loop. |
| R6 | Preserve all existing validation and regression evidence. | Must | Do not weaken validator or score behavior. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | Roadmap marks v0.7 external adoption and human-token proof as the next milestone and defers heavier automation. | Roadmap inspection. |
| A2 | Adoption guide captures time to evidence, extra prompts, material corrections, durable destinations, and reuse in a second task. | Documentation inspection. |
| A3 | Developer review template requires a human-token retention ledger and prior corrections in the next task. | Template inspection. |
| A4 | Framework and first-loop guide require material human corrections to be persisted before the next task. | Documentation inspection. |
| A5 | Self-application artifacts cite the user-provided agentic-loop guidance and record the resulting product decision. | `.loop` inspection. |
| A6 | Validator, readiness score, score tests, prototype tests, shell syntax, YAML, and whitespace checks still pass. | Run the local check suite. |

## UX Notes

- Entry point: `docs/roadmap.md` for sequence and `docs/external-adoption-loop.md` for the next experiment.
- Main flow: imperfect spec -> early implementation -> developer reaction -> durable correction -> second agent task -> check for repeated explanation.
- Empty state: the retention ledger may be empty when review produces no material correction.
- Error state: a material correction with no durable destination blocks the next agent task.
- Accessibility: plain Markdown tables and instructions.
- Mobile/responsive behavior: Not applicable.

## Data And State

- Inputs: user-provided essay about iterative specs, cheap agent tokens, expensive human tokens, and durable product memory; current roadmap and loop artifacts.
- Outputs: revised roadmap, adoption measures, review template, framework rules, and self-application evidence.
- State transitions: adoption-ready kit -> adoption experiment with an explicit human-token learning goal.
- Persistence: roadmap, templates, `.loop` artifacts, and git history.
- Privacy/security considerations: adoption evidence remains anonymized and avoids private product details.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Time to first agent task | Builder hands off the first bounded task | Detects whether spec work delays useful implementation. |
| Extra human prompts | Builder adds context after the first task starts | Measures missing product context. |
| Material correction retention | Developer review completes | Ensures important judgment gets a durable destination. |
| Repeated correction count | Second agent task completes | Tests whether repo memory reduced repeated explanation. |
| Spec or eval change from implementation | Review changes an artifact | Tests whether specs are genuinely iterative. |

## Dependencies

- One real builder and real product repo are required for the v0.7 adoption proof, but not for this roadmap and instrumentation slice.
- Existing shell, Node, and optional Ruby checks.

## Non-Goals

- Claiming external adoption from this documentation change.
- Adding a loop runner or agent orchestration runtime now.
- Archiving every conversation detail as product memory.
- Requiring every one-time implementation comment to become an eval.
- Packaging or distribution work before v0.7 evidence.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Is git history sufficient for completed slice memory, or is a lightweight archive needed? | Maintainer | After v0.7 adoption |
| What counts as an expensive enough first failure to add an eval immediately? | Maintainer | During v0.7 review |
| Which second-task behavior best demonstrates that a correction was retained? | Maintainer | Before the adoption session |
