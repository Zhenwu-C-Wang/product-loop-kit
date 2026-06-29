# Product Loop Kit

Runnable reference kit for turning user feedback into product vision, product specs, evals, AI coding-agent tasks, PR evidence, and human review loops.

This repo contains the **Loop Engineering Framework for AI Agents**: a practical operating system for getting AI agents to build software in tight engineering loops while humans keep control of product direction.

## The Framework

Loop engineering makes iteration explicit enough that an AI agent can work for longer stretches without constant human intervention, while still giving developers clear control points.

The framework has three nested loops:

| Loop | Cadence | Owner | Core Question | Output |
| --- | --- | --- | --- | --- |
| Agentic coding loop | Minutes | AI coding agent | Does the implementation satisfy the spec and evals? | Code, test results, screenshots, PR evidence |
| Developer feedback loop | Tens of minutes to hours | Developer | Is the product moving toward the intended user experience and business bet? | Spec updates, priority calls, new evals, next agent task |
| External feedback loop | Hours to weeks | Users, customers, market | Are we solving the right problem for the right people? | Product vision updates, validated learning, new bets |

Read the full framework: [docs/loop-engineering-framework.md](docs/loop-engineering-framework.md)

## Quick Start

Initialize the loop kit inside any product repo:

```bash
./scripts/init-loop-kit.sh "My Product" /path/to/product-repo
```

This creates a `.loop/` directory with the core artifacts:

- `00-loop-map.yaml`
- `01-product-vision.md`
- `02-product-spec.md`
- `03-eval-plan.md`
- `04-agent-task.md`
- `05-pr-evidence.md`
- `06-developer-review.md`
- `07-external-feedback-digest.md`
- `08-decision-log.md`

For this repo itself:

```bash
./scripts/init-loop-kit.sh "Product Loop Kit" .
```

## How To Use It

1. Start with `01-product-vision.md`: state the user, the context advantage the human brings, and the current product bet.
2. Turn the next slice of the vision into `02-product-spec.md`: small enough for an agent to implement and verify.
3. Define checks in `03-eval-plan.md`: tests, manual review, browser checks, data-quality checks, or product acceptance criteria.
4. Give the agent `04-agent-task.md`: include scope, constraints, commands to run, and the evidence it must return.
5. Record implementation evidence in `05-pr-evidence.md`.
6. Use `06-developer-review.md` to decide whether to accept, iterate, change the spec, or add evals.
7. Feed real-world learning into `07-external-feedback-digest.md`, then update the vision and decision log.

## Repository Map

- [docs/loop-engineering-framework.md](docs/loop-engineering-framework.md): the operating model and loop contracts.
- [templates/](templates): reusable artifacts for each loop.
- [examples/typing-tutor/](examples/typing-tutor): example loop setup for a small 0-to-1 product.
- [scripts/init-loop-kit.sh](scripts/init-loop-kit.sh): copies templates into a target repo.

## License

MIT
