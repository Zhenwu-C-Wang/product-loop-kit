# Product Loop Kit Product Spec

Created: 2026-06-29

## Slice

- Name: v0.3 reference case study
- Owner: maintainer
- Status: active
- Related vision bet: Builders will understand and trust the framework faster when they can inspect a complete product loop, not only blank templates.

## Problem

Product Loop Kit now has framework docs, templates, initialization, and validation. It still needs a concrete example that shows how the artifacts work together across the external feedback loop, developer feedback loop, and agentic coding loop.

Without a reference case study, users can initialize the kit but may not know what "good enough to hand to an agent" looks like.

## User Story

As a product-minded engineer, I want to inspect a complete example product loop, so that I can understand how to turn feedback into a vision, spec, eval plan, agent task, PR evidence, and developer review in my own repo.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Expand the typing-tutor example into an end-to-end case study. | Must | Use the existing example rather than inventing a new domain. |
| R2 | Include artifacts for product vision, external feedback digest, product spec, eval plan, agent task, PR evidence, and developer review. | Must | Artifacts should demonstrate the three-loop flow. |
| R3 | Keep the case study honest about evidence that is not yet real. | Must | Mark future implementation evidence as required, not completed. |
| R4 | Link the case study from README. | Must | Users should find it from the repo map. |
| R5 | Update roadmap to reflect the reference case-study milestone. | Must | Avoid claiming a real external product repo has been tested. |
| R6 | Update `.loop/` artifacts and evidence for this v0.3 slice. | Must | The repo should keep using its own loop system. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | `examples/typing-tutor/case-study.md` explains the full path from feedback to agent task and review. | Manual inspection. |
| A2 | Typing Tutor example contains concrete loop artifacts for vision, feedback, spec, eval, task, evidence, and review. | File existence and content inspection. |
| A3 | README links directly to the case study. | README inspection. |
| A4 | Roadmap describes v0.3 as a reference case study without overclaiming external adoption. | Roadmap inspection. |
| A5 | Product Loop Kit validator still passes on this repo. | `./scripts/validate-loop-kit.sh .`. |

## UX Notes

- Entry point: README repo map links to `examples/typing-tutor/case-study.md`.
- Main flow: Read case study, inspect artifacts, copy the artifact pattern into a real product repo.
- Empty state: Not applicable; this is a filled example.
- Error state: The case study should clearly distinguish planned evidence from completed implementation evidence.
- Loading state: Not applicable.
- Accessibility: Plain Markdown tables and headings.
- Mobile/responsive behavior: Not applicable.

## Data And State

- Inputs: Existing typing-tutor loop map and agent task.
- Outputs: Filled example artifacts and a readable case-study document.
- State transitions: external signal -> product vision -> product spec -> eval plan -> agent task -> evidence contract -> developer review.
- Persistence: Files live under `examples/typing-tutor/`.
- Privacy/security considerations: Case study uses synthesized product context, not private learner data.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Case study inspection | User reads example | Helps users understand artifact quality. |
| Template copy/adaptation | User mirrors case-study structure | Indicates reference example is actionable. |
| Validation pass | Repo validator succeeds | Confirms self-application artifacts remain complete. |

## Dependencies

- Existing Product Loop Kit templates and validator.
- No app implementation required for this slice.

## Non-Goals

- Build the typing tutor app.
- Claim real external learner feedback has been collected.
- Add a hosted tutorial site.
- Add package distribution.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should v0.4 use an actual external repo rather than a reference example? | Maintainer | Before next roadmap update |
| Should case studies include screenshots once a real app exists? | Maintainer | After first implementation case |
