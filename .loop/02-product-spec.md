# Product Loop Kit Product Spec

Created: 2026-06-29

## Slice

- Name: v0.1 plain-file loop kit
- Owner: maintainer
- Status: active
- Related vision bet: Plain files plus a lightweight initializer can make loop engineering usable in any repo.

## Problem

AI coding agents can iterate on code, but builders often lack a durable system for deciding what to build, giving bounded tasks to agents, collecting evidence, and feeding user feedback back into product direction.

Product Loop Kit v0.1 should make the first complete loop possible in a repo without installing a large toolchain.

## User Story

As a product-minded engineer, I want to initialize a loop system in my repo and fill out a bounded product slice, so that my AI coding agent can implement against clear acceptance criteria and return evidence I can review.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Provide a clear framework document explaining the three nested loops and control gates. | Must | Already present in `docs/loop-engineering-framework.md`; keep it aligned with templates. |
| R2 | Provide reusable `.loop/` artifact templates for vision, spec, evals, agent task, PR evidence, developer review, external feedback, and decisions. | Must | Templates must be plain Markdown/YAML. |
| R3 | Provide an initializer script that copies templates into a target repo without overwriting existing artifacts. | Must | Script should fail on missing target directory. |
| R4 | Self-apply the framework to this repo with concrete v0.1 artifacts. | Must | This spec is part of that requirement. |
| R5 | Provide at least one example product loop for a small 0-to-1 product. | Should | Current example: typing tutor. |
| R6 | Provide a v0.x roadmap that identifies the next productization steps. | Should | Keep it short and linked from README. |
| R7 | Add richer CLI features such as status, validation, and overwrite policy. | Later | Candidate for v0.2. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | A user can run `./scripts/init-loop-kit.sh "Product Name" /path/to/repo` and receive 9 initialized loop artifacts. | Temporary-directory command check. |
| A2 | The repo contains concrete self-application artifacts for v0.1 under `.loop/`. | Inspect `.loop/01-product-vision.md`, `.loop/02-product-spec.md`, `.loop/03-eval-plan.md`, and `.loop/04-agent-task.md`. |
| A3 | Framework documentation, templates, and self-application artifacts use the same three-loop vocabulary. | `rg` inspection for loop names and artifact references. |
| A4 | YAML artifacts parse successfully. | Ruby YAML parse or equivalent. |
| A5 | The README points users to the framework, templates, example, script, and roadmap. | README inspection. |

## UX Notes

- Entry point: `README.md`.
- Main flow: Read framework, run initializer, fill vision/spec/eval/task, run agent, record evidence, review, then capture external feedback.
- Empty state: Generated templates contain prompts and tables that show what to fill.
- Error state: Initializer exits clearly if the template directory or target directory is missing.
- Loading state: Not applicable for v0.1.
- Accessibility: Plain Markdown and YAML should remain readable in terminals, GitHub, and editors.
- Mobile/responsive behavior: Not applicable for v0.1.

## Data And State

- Inputs: Project name, target repo path, template files.
- Outputs: `.loop/` artifacts in the target repo.
- State transitions: Draft vision -> implementable spec -> eval plan -> agent task -> PR evidence -> developer review -> external feedback -> decision log.
- Persistence: Files are committed with the repo.
- Privacy/security considerations: Artifacts may include user feedback or product strategy; teams should avoid committing secrets or sensitive raw customer data.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Initialization success | Script creates 9 artifacts | Measures setup viability. |
| First complete loop | PR evidence and developer review both filled | Measures real adoption. |
| Repeated confusion | Same issue appears in feedback twice | Triggers doc/template update. |

## Dependencies

- POSIX shell and common Unix utilities for `scripts/init-loop-kit.sh`.
- Ruby only for local YAML validation during development; not required by users.

## Non-Goals

- Package manager distribution.
- Hosted dashboard.
- Agent-specific MCP/server integration.
- Automated analytics ingestion.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should v0.1 include a `loop status` or `validate` command, or should that wait for v0.2? | Maintainer | Before public release |
| Should `.loop/` be recommended as committed product memory, or should sensitive teams keep it private? | Maintainer | Before docs polish |
| Which real product repo should be used as the first external adoption test? | Maintainer | Before v0.1 feedback loop |
