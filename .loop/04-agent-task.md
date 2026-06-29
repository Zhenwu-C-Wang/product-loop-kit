# Product Loop Kit Agent Task

Created: 2026-06-29

## Goal

Organize Product Loop Kit so it can be sent directly to reviewers: tighten the README, add a repo tour, add a share checklist, add a Typing Tutor example README, and keep validation evidence passing.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Relevant files:
  - `README.md`
  - `docs/loop-engineering-framework.md`
  - `docs/roadmap.md`
  - `.loop/`
  - `examples/typing-tutor/`
  - `scripts/`

## Scope

In scope:

- Rewrite README for external reviewers.
- Add `docs/repo-tour.md`.
- Add `docs/share-checklist.md`.
- Add `examples/typing-tutor/README.md`.
- Add `.gitignore`.
- Update `.loop/05-pr-evidence.md`, `.loop/06-developer-review.md`, and `.loop/08-decision-log.md`.
- Run validation and prototype checks.

Out of scope:

- Publishing package artifacts.
- Creating a website.
- Changing prototype behavior.
- Claiming external adoption.

## Implementation Rules

- Keep docs direct and reviewer-facing.
- Preserve known caveats.
- Do not weaken validator rules.
- Keep prototype evidence intact.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` |
| Prototype scoring tests | `node examples/typing-tutor/prototype/scoring.test.js` |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` |
| Whitespace | `git diff --check` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Share docs path check | `test -f README.md docs/repo-tour.md docs/share-checklist.md examples/typing-tutor/README.md` |
| Repo status | `git status --short --untracked-files=all` |

## Working Loop

1. Audit repo structure.
2. Rewrite public entrypoints.
3. Add reviewer and share docs.
4. Update `.loop` evidence.
5. Run validation and prototype checks.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Known caveats.
- Current git status.
