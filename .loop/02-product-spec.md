# Product Loop Kit Product Spec

Created: 2026-07-06

## Slice

- Name: v0.6 external adoption kit and score tests
- Owner: maintainer
- Status: active
- Related vision bet: Product Loop Kit should prove that real builders can reach an agent-ready product loop before investing in packaging or broader distribution.

## Problem

Product Loop Kit now has clear positioning and a readiness score, but the first external adoption loop still needs a smaller path. A new builder should not have to understand all 9 artifacts before using the kit. They need a first-hour guide that narrows setup to the core product handoff.

The new score script also needs regression coverage. Without fixtures, future template or validator changes could silently shift P0-P4 thresholds or break output that users rely on.

## User Story

As a product-minded engineer trying Product Loop Kit in a real repo, I want a short first-loop guide, an adoption test plan, stable readiness scoring, and a local check suite, so that I can try the kit without a live walkthrough and report useful friction.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Add a first-loop guide. | Must | Narrow the first hour to vision, spec, eval plan, and agent task. |
| R2 | Add an external adoption loop guide. | Must | Define who to recruit, what to ask, what to observe, and what evidence to bring back. |
| R3 | Add score regression tests. | Must | Cover P0, P1, P2, P3, and P4 readiness scenarios. |
| R4 | Add a local check suite to share and regression paths. | Must | Run validator, score, score tests, prototype tests, shell syntax, YAML parse, path checks, and whitespace. |
| R5 | Update public docs to expose the new adoption path. | Must | README, repo tour, roadmap, and share checklist. |
| R6 | Keep existing validation and prototype evidence passing. | Must | Do not weaken validator rules or example tests. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | `docs/first-loop.md` gives a first-hour path to P2 agent-ready. | Manual inspection and path check. |
| A2 | `docs/external-adoption-loop.md` defines a usable real-repo adoption test. | Manual inspection and path check. |
| A3 | `scripts/test-score-loop-kit.sh` passes and covers P0, P1, P2, P3, and P4 scenarios. | Run score test script. |
| A4 | Share checklist runs the core local checks. | File inspection and command execution. |
| A5 | Validator still passes unchanged. | `./scripts/validate-loop-kit.sh .`. |
| A6 | Score, prototype, shell syntax, YAML, path, and whitespace checks pass. | Run documented commands. |

## UX Notes

- Entry point: `README.md`.
- First-use flow: README -> `docs/first-loop.md` -> score -> agent task -> evidence -> review.
- Adoption flow: `docs/external-adoption-loop.md` -> external observations -> feedback digest -> decision log.
- Empty state: fresh templates should score P1 and point users toward next actions.
- Error state: local scripts should fail with actionable command output.
- Accessibility: plain Markdown and shell scripts.
- Mobile/responsive behavior: Not applicable.

## Data And State

- Inputs: existing docs, templates, scripts, `.loop`, Typing Tutor example, and readiness score.
- Outputs: first-loop guide, external adoption guide, score fixtures, score test script, updated self-application evidence.
- State transitions: differentiated product-loop kit -> adoption-ready kit with regression checks.
- Persistence: files committed with the repo.
- Privacy/security considerations: adoption guide instructs users to avoid copying private product details into this public repo.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Score regression test pass | `scripts/test-score-loop-kit.sh` exits 0 | Protects P0-P4 scoring behavior. |
| Local check pass | Share checklist commands run | Catches drift before share or merge. |
| External adoption outcome | Adoption session completes | Tests whether real builders can use the kit without a live walkthrough. |

## Dependencies

- Existing shell environment.
- Node for prototype scoring tests.
- Ruby is optional for YAML parse checks.

## Non-Goals

- Publishing npm packages.
- Creating a hosted dashboard.
- Adding agent orchestration, scheduling, MCP, worktree, or sub-agent runtime support.
- Claiming external adoption before the adoption loop runs.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should the first-loop guide be copied into initialized repos as `.loop/README.md`? | Maintainer | After one adoption session |
| Should hosted CI become required before tagging a public release? | Maintainer | Before v0.7 distribution |
