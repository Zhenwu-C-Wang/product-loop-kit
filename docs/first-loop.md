# First Product Loop

Use this when you have just initialized `.loop/` and want the smallest useful first pass.

The goal of the first loop is not to fill every artifact perfectly. The goal is to make one product slice clear enough that an AI coding agent can act without losing the product context.

## Before You Start

Initialize the kit:

```bash
./scripts/init-loop-kit.sh "My Product" /path/to/product-repo
```

Then work in the target repo's `.loop/` directory.

## Fill These Four Files First

### 1. `01-product-vision.md`

Fill only the parts that help the agent avoid wrong product assumptions:

- Primary user
- Situation where the product is used
- Product bet
- Current risks
- Feedback sources

Keep this short. If a field does not change the next implementation decision, leave it for later.

### 2. `02-product-spec.md`

Define one user-visible slice:

- Name and status
- Problem
- User story
- 1-3 requirements
- 2-5 acceptance criteria
- Non-goals

The spec is ready when a reviewer can point to each acceptance criterion and say how it will be checked.

### 3. `03-eval-plan.md`

Map every acceptance criterion to a check:

- Automated tests when practical
- Manual workflow inspection when product behavior matters
- Screenshots or logs for UI and integration work
- Known skipped checks with owner and reason

Do not overbuild evals before the product direction is stable. Add just enough evidence to catch likely failure modes.

### 4. `04-agent-task.md`

Turn the spec into an agent handoff:

- Goal
- Inputs
- In scope and out of scope
- Implementation rules
- Commands to run
- Completion contract

The task is ready when an agent can start from this file and know how to stop.

## Run The Score

From the kit repo:

```bash
./scripts/score-loop-kit.sh /path/to/product-repo
```

Aim for at least `P2 agent-ready` before handing work to an AI coding agent.

## Run Strict Validation

After implementation evidence and developer review are filled:

```bash
./scripts/validate-loop-kit.sh /path/to/product-repo
```

A fresh `.loop/` should not pass strict validation. Passing validation means the loop has enough product context, agent handoff, evidence, review, and decision history to be treated as complete for that slice.

## After The Agent Works

Fill the remaining artifacts:

- `05-pr-evidence.md`: commands, results, screenshots, risks, skipped checks
- `06-developer-review.md`: accept, iterate, change spec, change vision, or stop
- `07-external-feedback-digest.md`: real user, customer, market, or repo-use signals
- `08-decision-log.md`: durable decision and next loop

Before creating the next agent task, move every material human correction out of chat or review prose and into the spec, eval plan, product vision, or decision log. The next agent session should not require the builder to explain the same product judgment again.

## Stop Conditions

Stop the local loop and seek external feedback when:

- The implementation passes but the product question remains unclear.
- Review keeps changing the target user, problem, or workflow.
- More polish will not answer whether a real user or builder wants this.
- The next uncertainty is adoption, willingness to use, or distribution.
