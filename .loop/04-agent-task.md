# Product Loop Kit Agent Task

Created: 2026-07-06

## Goal

Advance Product Loop Kit from product-layer positioning to an adoption-ready reference: add the first-loop guide, external adoption loop guide, score regression tests, lightweight CI, and updated self-application evidence.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Relevant files:
  - `README.md`
  - `docs/repo-tour.md`
  - `docs/roadmap.md`
  - `docs/share-checklist.md`
  - `scripts/init-loop-kit.sh`
  - `scripts/validate-loop-kit.sh`
  - `scripts/score-loop-kit.sh`
  - `.loop/`
  - `examples/typing-tutor/`

## Scope

In scope:

- Add `docs/first-loop.md`.
- Add `docs/external-adoption-loop.md`.
- Add `scripts/test-score-loop-kit.sh`.
- Add `tests/fixtures/score/expected-levels.tsv`.
- Add `.github/workflows/ci.yml`.
- Update README, repo tour, roadmap, and share checklist.
- Update `.loop/05-pr-evidence.md`, `.loop/06-developer-review.md`, and `.loop/08-decision-log.md`.
- Run validation, scoring, score tests, prototype tests, shell, whitespace, YAML, and path checks.

Out of scope:

- Publishing package artifacts.
- Creating a website.
- Adding agent scheduling, worktrees, MCP, or sub-agent orchestration.
- Changing prototype behavior.
- Claiming external adoption.

## Implementation Rules

- Keep the first-loop path small and practical.
- Keep adoption guidance observation-driven.
- Keep score tests dependency-light and deterministic.
- Keep CI focused on local checks only.
- Do not weaken validator rules.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` |
| Product-loop readiness score | `./scripts/score-loop-kit.sh .` |
| Score regression tests | `./scripts/test-score-loop-kit.sh` |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Docs path check | `for path in README.md docs/repo-tour.md docs/first-loop.md docs/external-adoption-loop.md docs/roadmap.md docs/share-checklist.md scripts/score-loop-kit.sh scripts/test-score-loop-kit.sh tests/fixtures/score/expected-levels.tsv .github/workflows/ci.yml; do test -f "$path" || exit 1; done` |
| Whitespace | `git diff --check` |
| Repo status | `git status --short --untracked-files=all` |

## Working Loop

1. Add first-use and adoption docs.
2. Add score fixtures and regression tests.
3. Add lightweight CI.
4. Update public docs.
5. Update `.loop` evidence.
6. Run full validation and regression checks.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Known caveats.
- Current git status.
