# Product Loop Kit

Product Loop Kit is a plain-file operating system for building products with AI coding agents.

It turns product vision, user feedback, evals, agent tasks, PR evidence, and human review into a repeatable loop that can live inside any software repo.

## Why This Exists

AI coding agents are good at iterating on code when the work is bounded and verifiable. They are much weaker when product intent, user context, acceptance criteria, and review evidence live only in chat history.

Product Loop Kit makes those loops explicit:

| Loop | Cadence | Owner | Question |
| --- | --- | --- | --- |
| Agentic coding loop | Minutes | AI coding agent | Does the implementation satisfy the spec and evals? |
| Developer feedback loop | Tens of minutes to hours | Developer | Is the product moving toward the intended user outcome? |
| External feedback loop | Hours to weeks | Users, customers, market | Are we solving the right problem for the right people? |

The goal is not to automate humans out of product work. The goal is to preserve human context advantage while giving agents enough structure to execute independently.

## Start Here

If you are reviewing this repo:

1. Read the framework: [docs/loop-engineering-framework.md](docs/loop-engineering-framework.md)
2. Take the 10-minute tour: [docs/repo-tour.md](docs/repo-tour.md)
3. Inspect the self-application artifacts: [.loop/](.loop)
4. Open the reference case study: [examples/typing-tutor/README.md](examples/typing-tutor/README.md)
5. Run validation:

```bash
./scripts/validate-loop-kit.sh .
```

Expected result for this repo:

```text
summary: 63 passed, 0 warning(s), 0 failed
```

## Use In Your Repo

Initialize the loop kit inside any product repo:

```bash
./scripts/init-loop-kit.sh "My Product" /path/to/product-repo
```

This creates a `.loop/` directory with 9 artifacts:

- `00-loop-map.yaml`
- `01-product-vision.md`
- `02-product-spec.md`
- `03-eval-plan.md`
- `04-agent-task.md`
- `05-pr-evidence.md`
- `06-developer-review.md`
- `07-external-feedback-digest.md`
- `08-decision-log.md`

After filling the first product slice, validate that the loop artifacts are ready for an agent:

```bash
./scripts/validate-loop-kit.sh /path/to/product-repo
```

A freshly initialized `.loop/` is expected to fail validation until the critical fields are filled.

## What Is In This Repo

| Path | Purpose |
| --- | --- |
| [docs/loop-engineering-framework.md](docs/loop-engineering-framework.md) | Full Loop Engineering Framework for AI Agents |
| [docs/repo-tour.md](docs/repo-tour.md) | Short reviewer walkthrough |
| [docs/roadmap.md](docs/roadmap.md) | v0.x product roadmap |
| [docs/share-checklist.md](docs/share-checklist.md) | Pre-share checklist and current caveats |
| [.loop/](.loop) | Product Loop Kit managing itself with its own artifacts |
| [templates/](templates) | Reusable `.loop/` artifact templates |
| [scripts/init-loop-kit.sh](scripts/init-loop-kit.sh) | Initializes `.loop/` in a target repo |
| [scripts/validate-loop-kit.sh](scripts/validate-loop-kit.sh) | Checks whether `.loop/` is agent-ready |
| [examples/typing-tutor/](examples/typing-tutor) | End-to-end reference case study with runnable prototype |

## Reference Case Study

The Typing Tutor example shows the framework end to end:

- External feedback digest
- Product vision
- Product spec
- Eval plan
- Agent task
- Runnable static prototype
- PR evidence
- Developer review

Open the prototype directly:

[examples/typing-tutor/prototype/index.html](examples/typing-tutor/prototype/index.html)

Run prototype scoring tests:

```bash
node examples/typing-tutor/prototype/scoring.test.js
```

## Current Status

This repo is ready to share as a working reference kit:

- Framework document exists.
- Templates are reusable.
- Initializer and validator scripts work.
- The repo self-applies `.loop/`.
- The Typing Tutor case study includes a runnable prototype, tests, and screenshots.

Important caveat: external adoption has not been validated yet. The next loop should be a real user or real product repo applying the kit.

## License

MIT
