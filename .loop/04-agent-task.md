# Product Loop Kit Agent Task

Created: 2026-06-29

## Goal

Implement the v0.3 reference case-study slice by expanding `examples/typing-tutor/` into a complete loop engineering example and linking it from the repo docs.

## Inputs

- Product vision: `.loop/01-product-vision.md`
- Product spec: `.loop/02-product-spec.md`
- Eval plan: `.loop/03-eval-plan.md`
- Relevant files:
  - `README.md`
  - `docs/roadmap.md`
  - `.loop/`
  - `examples/typing-tutor/`
  - `scripts/validate-loop-kit.sh`

## Scope

In scope:

- Add typing-tutor product vision, external feedback digest, product spec, eval plan, PR evidence, developer review, and case-study docs.
- Update the existing typing-tutor agent task to reference the new artifacts.
- Link the case study from README.
- Update roadmap language for v0.3.
- Update `.loop/05-pr-evidence.md`, `.loop/06-developer-review.md`, and `.loop/08-decision-log.md`.
- Run validation and file checks.

Out of scope:

- Implementing the typing tutor app.
- Claiming real learner/adult feedback has been collected.
- Adding package distribution.
- Adding screenshots for a non-existent implementation.

## Implementation Rules

- Keep the case study concrete and honest about what is synthesized versus implemented.
- Preserve the three-loop framework vocabulary.
- Prefer plain Markdown/YAML.
- Do not weaken validator rules to make the example pass; the validator checks this repo's `.loop`, not the example package.
- Record evidence in `.loop/05-pr-evidence.md`.

## Commands To Run

| Purpose | Command |
| --- | --- |
| Validator pass | `./scripts/validate-loop-kit.sh .` |
| Shell syntax | `bash -n scripts/init-loop-kit.sh scripts/validate-loop-kit.sh` |
| Whitespace | `git diff --check` |
| YAML parse | `ruby -e 'require "yaml"; YAML.load_file(".loop/00-loop-map.yaml"); YAML.load_file("templates/00-loop-map.yaml"); YAML.load_file("examples/typing-tutor/loop-map.yaml")'` |
| Example file check | `find examples/typing-tutor -maxdepth 1 -type f | sort` |
| README case-study link | `rg "examples/typing-tutor/case-study.md" README.md` |
| Repo status | `git status --short --untracked-files=all` |

## Working Loop

1. Inspect the current example.
2. Add the missing loop artifacts.
3. Tie the case study back to README and roadmap.
4. Update this repo's `.loop` evidence.
5. Run validation and file checks.

## Completion Contract

Return:

- Summary of changes.
- Evidence for each acceptance criterion.
- Checks run and results.
- Known risks.
- Questions for developer review.
