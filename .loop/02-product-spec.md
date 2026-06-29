# Product Loop Kit Product Spec

Created: 2026-06-29

## Slice

- Name: v0.2 validation and status
- Owner: maintainer
- Status: active
- Related vision bet: A plain-file loop kit becomes more useful when users can verify whether `.loop/` is ready for an agent.

## Problem

Product Loop Kit v0.1 can initialize a `.loop/` directory, but users still have to manually inspect whether the generated artifacts are complete enough to hand to a coding agent. Fresh templates should be useful as prompts, but they should not be mistaken for a ready product slice.

v0.2 should add a lightweight validation command that acts as a gate between "templates exist" and "agent can start."

## User Story

As a product-minded engineer, I want to validate my `.loop/` artifacts before handing work to an AI coding agent, so that missing files, unresolved placeholders, blank template rows, and incomplete evidence are caught early.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Add a validation script that checks a target repo's `.loop/` directory. | Must | Implement as `scripts/validate-loop-kit.sh [target-dir]`. |
| R2 | Check all 9 required loop artifacts exist. | Must | Missing files should fail clearly. |
| R3 | Check loop map structure and parse YAML when Ruby is available. | Must | Avoid hard dependency beyond shell; Ruby parse is an extra strict check when available. |
| R4 | Detect unresolved template placeholders, empty table rows, and blank bullets. | Must | Fresh initialized templates should fail until filled. |
| R5 | Check critical sections and fields for vision, spec, eval plan, agent task, PR evidence, developer review, external feedback, and decision log. | Must | Keep rules simple and transparent. |
| R6 | Document validation in README and roadmap. | Must | Make clear that fresh templates are expected to fail validation. |
| R7 | Exercise success and failure paths. | Must | This repo should pass; missing `.loop/` and blank generated templates should fail. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | `./scripts/validate-loop-kit.sh .` passes on this repo. | Command check. |
| A2 | Validation fails clearly when `.loop/` is missing. | Temporary-directory command check. |
| A3 | Validation fails clearly on a freshly initialized but unfilled `.loop/`. | Temporary-directory command check. |
| A4 | Both shell scripts parse successfully. | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh`. |
| A5 | README documents validation and explains that fresh templates fail until filled. | README inspection. |

## UX Notes

- Entry point: `README.md`.
- Main flow: initialize `.loop/`, fill the first product slice, run validation, hand the task to an agent, record evidence.
- Empty state: A fresh `.loop/` should produce actionable validation failures.
- Error state: Missing target, missing `.loop/`, missing files, placeholders, and blank rows should be named clearly.
- Loading state: Not applicable for shell script.
- Accessibility: Output uses plain `pass:`, `warn:`, `fail:`, and `summary:` lines.
- Mobile/responsive behavior: Not applicable.

## Data And State

- Inputs: Target repo path and `.loop/` artifacts.
- Outputs: Terminal validation report and process exit status.
- State transitions: initialized templates -> filled loop artifacts -> validation pass -> agent-ready task.
- Persistence: No state is written by the validator.
- Privacy/security considerations: Validator reads local files only and should not print sensitive artifact content.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| Validation pass | Script exits 0 | Loop artifacts are ready for agent handoff. |
| Validation fail | Script exits non-zero | User has actionable gaps to fill. |
| Warning | Optional strict check cannot run | User sees reduced coverage without blocking. |

## Dependencies

- Bash and common Unix utilities.
- Ruby is optional for strict YAML parsing; loop map structure is still checked without it.

## Non-Goals

- Full Markdown parsing.
- Full YAML schema validation.
- Package manager distribution.
- Hosted dashboard.
- Agent-specific orchestration.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should validation support machine-readable JSON output? | Maintainer | v0.3 or CLI packaging |
| Should validation rules be configurable per repo? | Maintainer | After real case-study feedback |
| Should failed validation suggest exact template sections to edit? | Maintainer | v0.3 |
