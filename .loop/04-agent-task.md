# Product Loop Kit Agent Task

Created: 2026-06-29

## Goal

Implement the v0.2 validation/status slice: add a shell validator that checks whether a repo's `.loop/` artifacts are complete enough for an AI coding agent, document it, and record evidence for success and failure paths.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Relevant files:
  - `README.md`
  - `docs/roadmap.md`
  - `.loop/`
  - `scripts/init-loop-kit.sh`
  - `scripts/validate-loop-kit.sh`
  - `templates/`

## Scope

In scope:

- Add `scripts/validate-loop-kit.sh`.
- Check required `.loop/` files exist.
- Check loop map structure and optional YAML parse.
- Detect unresolved placeholders, empty template table rows, and blank bullets.
- Check core sections and filled fields for each `.loop` artifact.
- Document validation in README and roadmap.
- Run pass and failure-path checks.
- Update `.loop/05-pr-evidence.md` with results.

Out of scope:

- Packaged CLI distribution.
- JSON output.
- Configurable validation rules.
- Hosted dashboard.
- Full Markdown or YAML schema validation.

## Implementation Rules

- Keep the validator dependency-light and readable.
- Do not modify user files during validation.
- Do not print full artifact contents.
- Keep failure messages tied to concrete files or rules.
- Preserve the three-loop framework vocabulary.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` |
| Validation pass | `./scripts/validate-loop-kit.sh .` |
| Missing `.loop` failure | `tmpdir="$(mktemp -d)"; ./scripts/validate-loop-kit.sh "$tmpdir"; rm -rf "$tmpdir"` |
| Fresh template failure | `tmpdir="$(mktemp -d)"; ./scripts/init-loop-kit.sh "Blank Demo" "$tmpdir"; ./scripts/validate-loop-kit.sh "$tmpdir"; rm -rf "$tmpdir"` |
| Init smoke test | `tmpdir="$(mktemp -d)"; ./scripts/init-loop-kit.sh "Demo/Product & Loop" "$tmpdir"; find "$tmpdir/.loop" -maxdepth 1 -type f | wc -l; rm -rf "$tmpdir"` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Whitespace | `git diff --check` |
| Repo status | `git status --short --untracked-files=all` |

## Working Loop

1. Read the product spec and eval plan.
2. Inspect current scripts and docs.
3. Implement the smallest coherent validator.
4. Run required checks.
5. Tighten or relax validation rules based on real output.
6. Update documentation and evidence.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Known risks.
- Questions for developer review.
