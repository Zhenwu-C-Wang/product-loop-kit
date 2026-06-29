# Product Loop Kit Product Spec

Created: 2026-06-29

## Slice

- Name: v0.5 share-ready repo organization
- Owner: maintainer
- Status: active
- Related vision bet: Product Loop Kit is easier to evaluate when the repo has a clear public entry path, reviewer tour, share checklist, and example entrypoint.

## Problem

The repo now contains a framework, templates, scripts, `.loop` self-application artifacts, a reference case study, and a runnable prototype. That is enough substance to share, but a first-time reviewer needs a clear path through the material.

Without repo-level organization, people may miss the validator, the case study, or the caveat that external adoption is still pending.

## User Story

As someone receiving the repo link, I want to understand what this project is, where to start, how to validate it, and what evidence exists, so that I can evaluate it without a guided walkthrough.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Rewrite README as a public-facing entrypoint. | Must | Include what it is, why it exists, start path, use path, repo map, case study, and status. |
| R2 | Add a short repo tour for reviewers. | Must | `docs/repo-tour.md`. |
| R3 | Add a share checklist with commands and caveats. | Must | `docs/share-checklist.md`. |
| R4 | Add a Typing Tutor example README. | Must | `examples/typing-tutor/README.md`. |
| R5 | Add a basic `.gitignore`. | Should | Avoid accidental local noise. |
| R6 | Keep validator and prototype checks passing. | Must | Do not weaken existing evidence. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | README gives a clear external review path. | Manual inspection. |
| A2 | Reviewer docs exist and link to working repo paths. | `test -f` and path inspection. |
| A3 | Typing Tutor has its own README and still points to prototype evidence. | File inspection. |
| A4 | Product Loop Kit validator still passes. | `./scripts/validate-loop-kit.sh .`. |
| A5 | Prototype scoring tests still pass. | `node examples/typing-tutor/prototype/scoring.test.js`. |

## UX Notes

- Entry point: `README.md`.
- Main flow: README -> repo tour -> framework -> `.loop` -> Typing Tutor case study -> validator.
- Empty state: Not applicable.
- Error state: Share checklist calls out known caveats instead of hiding them.
- Loading state: Not applicable.
- Accessibility: Plain Markdown and simple tables.
- Mobile/responsive behavior: Not applicable.

## Data And State

- Inputs: Existing docs, templates, scripts, `.loop`, and Typing Tutor artifacts.
- Outputs: Organized README, repo tour, share checklist, example README, and `.gitignore`.
- State transitions: local working reference -> share-ready repository package.
- Persistence: Files are committed with the repo.
- Privacy/security considerations: `.gitignore` excludes `.env` files; share checklist notes external feedback caveats.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Reviewer tour completion | Reviewer follows `docs/repo-tour.md` | Tests whether repo can be understood asynchronously. |
| Validator pass | `validate-loop-kit.sh` exits 0 | Confirms self-application artifacts remain complete. |
| Prototype test pass | Node scoring tests pass | Confirms case-study implementation evidence remains valid. |

## Dependencies

- Existing shell scripts.
- Node for prototype scoring tests.
- Ruby is optional for YAML parse checks.

## Non-Goals

- Packaging or publishing.
- Changing validator behavior.
- Adding more app features.
- Claiming external adoption.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should the repo include a `CHANGELOG.md` before public release? | Maintainer | Before tagging |
| Should screenshots be optimized before pushing? | Maintainer | Before public share |
