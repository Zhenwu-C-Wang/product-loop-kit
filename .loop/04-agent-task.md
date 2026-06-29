# Product Loop Kit Agent Task

Created: 2026-06-29

## Goal

Advance Product Loop Kit from framework draft to v0.1 working kit by self-applying `.loop/`, filling concrete v0.1 artifacts, adding a concise roadmap, and verifying the initializer workflow.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Relevant files:
  - `README.md`
  - `docs/loop-engineering-framework.md`
  - `templates/`
  - `scripts/init-loop-kit.sh`
  - `examples/typing-tutor/`

## Scope

In scope:

- Initialize `.loop/` for this repo.
- Fill v0.1 vision, spec, eval plan, agent task, PR evidence, developer review, external feedback digest, and decision log.
- Add a short roadmap for v0.x productization.
- Link the roadmap from README.
- Run lightweight validation checks.

Out of scope:

- Building a packaged CLI.
- Creating a website or hosted dashboard.
- Adding agent-platform-specific integrations.
- Committing or pushing changes.

## Implementation Rules

- Keep changes scoped to product-loop-kit artifacts and docs.
- Prefer plain Markdown, YAML, and shell.
- Do not silently change the three-loop framework vocabulary.
- Add or update evals for repeated failure modes.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Shell syntax | `bash -n scripts/init-loop-kit.sh` |
| Whitespace | `git diff --check` |
| Init smoke test | `tmpdir="$(mktemp -d)"; ./scripts/init-loop-kit.sh "Demo/Product & Loop" "$tmpdir"; find "$tmpdir/.loop" -maxdepth 1 -type f | wc -l; rm -rf "$tmpdir"` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Repo status | `git status --short` |

## Working Loop

1. Read the product spec and eval plan.
2. Inspect the relevant repo files before editing.
3. Implement the smallest coherent v0.1 productization slice.
4. Run required checks.
5. Fix defects and repeat until checks pass or a blocker is clear.
6. Fill out `.loop/05-pr-evidence.md`.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Known risks.
- Questions for developer review.
