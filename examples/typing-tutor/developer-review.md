# Typing Tutor Developer Review

Created: 2026-06-29

## Review Context

- Slice: first practice-flow slice
- Build/PR: example case study
- Reviewer: builder
- Review window: after agent implementation

## Decision

Decision: iterate

## Product Review

| Question | Answer |
| --- | --- |
| Does the product behavior match the intended user outcome? | Review after prototype: learner should complete one session and adult should choose next difficulty. |
| Does the evidence cover the acceptance criteria? | Required evidence is defined in `pr-evidence.md`; implementation must fill results. |
| What feels confusing, weak, or overbuilt? | Watch whether adult controls distract from practice and whether scoring language is too abstract. |
| What human context should be injected into the next loop? | Motivation and session length matter more than feature count. |
| What can only be answered by external feedback? | Whether a learner actually finishes without adult rescue. |

## Feedback To Agent

- Keep the first slice narrow.
- Make scoring logic testable.
- Do not add accounts or long-term storage.
- Preserve clear result language.

## Spec Changes

| Change | Reason | Source |
| --- | --- | --- |
| Keep rewards out of first slice | Need to test basic practice flow first. | External feedback digest |
| Add scoring edge-case evals | Scoring bugs are likely and easy to regress. | Eval plan |

## New Or Updated Evals

| Eval | Reason | Priority |
| --- | --- | --- |
| Scoring edge cases | Prevent false confidence from exact-match-only tests. | High |
| Tablet screenshot | Catch layout overlap before learner use. | Medium |

## Next Agent Task

- Goal: Implement the first practice-flow slice in the target app.
- Scope: Practice screen, scoring logic, result state, adult difficulty control, tests, responsive inspection.
- Acceptance criteria: A1-A4 in `product-spec.md`.
- Required evidence: filled `pr-evidence.md` with commands and inspection notes.

## Decision Log Entry

Date: 2026-06-29

Decision: Iterate locally until the first practice flow is testable, then run one observed learner/adult session.

Reason: External feedback cannot answer the product bet until a full session exists.

Next loop: Agentic coding loop.
