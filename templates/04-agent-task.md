# {{PROJECT_NAME}} Agent Task

Created: {{DATE}}

## Goal

Implement one bounded product slice:


## Inputs

- Product vision: `01-product-vision.md`
- Product spec: `02-product-spec.md`
- Eval plan: `03-eval-plan.md`
- Relevant files:
  - 

## Scope

In scope:

- 

Out of scope:

- 

## Implementation Rules

- Keep changes scoped to the spec.
- Prefer existing project patterns and helpers.
- Do not silently change product direction.
- Add or update evals for repeated failure modes.
- Record evidence in `05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Install dependencies |  |
| Unit tests |  |
| Type check |  |
| Lint |  |
| Build |  |
| E2E or browser check |  |

## Working Loop

1. Read the product spec and eval plan.
2. Inspect the relevant code before editing.
3. Implement the smallest coherent slice.
4. Run required checks.
5. Inspect UI or workflow behavior directly when relevant.
6. Fix defects and repeat until checks pass or a blocker is clear.
7. Fill out `05-pr-evidence.md`.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Screenshots or logs when relevant.
- Known risks.
- Questions for developer review.
