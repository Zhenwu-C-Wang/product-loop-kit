# Product Loop Kit Developer Review

Created: 2026-06-29

## Review Context

- Slice: v0.2 validation and status
- Build/PR: local working tree
- Reviewer: maintainer
- Review window: before v0.2 release

## Decision

Decision: accept

## Product Review

| Question | Answer |
| --- | --- |
| Does the product behavior match the intended user outcome? | Yes. A user can now distinguish initialized templates from agent-ready `.loop/` artifacts. |
| Does the evidence cover the acceptance criteria? | Yes. Evidence covers pass path, missing `.loop`, fresh blank templates, shell syntax, init smoke test, YAML parse, and whitespace. |
| What feels confusing, weak, or overbuilt? | The validator is intentionally opinionated and may need configurability after real case studies. |
| What human context should be injected into the next loop? | The primary product risk is adoption friction, so the next loop should test this on a real repo rather than adding more local rules. |
| What can only be answered by external feedback? | Whether the validation failures feel actionable to users and whether teams accept the default artifact structure. |

## Feedback To Agent

- Keep the validator plain shell for now.
- Keep JSON output and configurable rules out of v0.2.
- Treat real false positives as v0.3 product feedback.
- Use case studies to decide which fields are essential.

## Spec Changes

| Change | Reason | Source |
| --- | --- | --- |
| Add validation as a v0.2 slice | Users need a gate between initialized templates and agent-ready work. | Developer review |
| Make Ruby YAML parse optional in validator | Avoid a hard dependency while preserving stricter local checks when available. | Implementation review |
| Make fresh templates fail validation | Prevent users from treating unfilled scaffolding as a complete agent task. | Product review |

## New Or Updated Evals

| Eval | Reason | Priority |
| --- | --- | --- |
| Validator pass on this repo | Prevent regressions in self-application artifacts. | High |
| Missing `.loop` failure | Ensure first failure mode is clear. | High |
| Fresh template failure | Ensure initialization does not imply readiness. | High |
| Script syntax check | Keep shell scripts runnable. | High |
| README validation path inspection | Keep first-use docs accurate. | Medium |

## Next Agent Task

- Goal: Run the kit against a real product repo and capture a case study.
- Scope: Apply init, fill first slice, run validate, hand task to an agent, record PR evidence and developer review.
- Acceptance criteria: A real product loop completes end to end and at least one template or validation rule is improved from observed friction.
- Required evidence: case-study doc, updated feedback digest, decision log entry, and validation output.

## Decision Log Entry

Date: 2026-06-29

Decision: Accept v0.2 validation/status as a plain-shell workflow gate.

Reason: The validator creates a concrete readiness check without adding distribution complexity.

Next loop: External feedback loop with a real product repo case study.
