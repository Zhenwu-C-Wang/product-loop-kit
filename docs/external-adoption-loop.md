# External Adoption Loop

Use this to test whether Product Loop Kit works outside this reference repo.

The goal is not to prove the framework is right. The goal is to watch a real builder use it on a real product slice, then record what confused them, helped them, or slowed them down.

## Who To Recruit

Pick one builder who:

- Uses AI coding agents for product work.
- Has a real repo with a small user-facing improvement in mind.
- Can spend 30-60 minutes without a guided walkthrough.
- Is willing to share friction honestly.

Avoid using a repo where security, private customer data, or production deploy risk would distract from the loop itself.

## Setup

Give the builder:

- `README.md`
- `docs/first-loop.md`
- `scripts/init-loop-kit.sh`
- `scripts/score-loop-kit.sh`
- `scripts/validate-loop-kit.sh`

Do not explain the framework live unless they are blocked. The adoption test is whether the repo can carry enough context by itself.

## Task

Ask them to run one small product loop:

1. Initialize `.loop/` in their repo.
2. Fill the first four artifacts from `docs/first-loop.md`.
3. Run the readiness score.
4. Give the resulting `04-agent-task.md` to their coding agent.
5. Fill `05-pr-evidence.md` after the agent works.
6. Fill `06-developer-review.md`.
7. Run strict validation.

They do not need to ship the change. A stopped or rejected loop is useful evidence if the reason is clear.

## What To Observe

Record observations, not interpretations:

| Question | Evidence To Capture |
| --- | --- |
| Could they explain the product-layer role? | Their one-sentence explanation after reading README. |
| Which artifact did they open first? | File path and why. |
| Which fields felt unclear or redundant? | Exact field names and comments. |
| Did the score help them decide what to fill next? | Score level, next actions, and reaction. |
| Did the agent task reduce prompt-writing effort? | Before/after prompt or task handoff. |
| Did validation failure feel actionable? | Failed checks and whether they knew what to fix. |
| What did they skip? | Artifact, field, check, and reason. |

## Success Criteria

The loop is promising when:

- The builder reaches at least `P2 agent-ready` without a live walkthrough.
- They can explain why product artifacts sit upstream of agent execution.
- The agent task is specific enough for a coding agent to start.
- Evidence and review reveal a clear next product decision.

The loop needs refinement when:

- They fill artifacts mechanically without understanding the product decision.
- They cannot tell whether a score or validation failure matters.
- The first four files feel too heavy for one slice.
- The agent task still turns into a long custom prompt.

## Evidence To Bring Back

Update this repo after the adoption session:

- `.loop/07-external-feedback-digest.md`: observations, interpretations, implications, decision.
- `.loop/08-decision-log.md`: product or template decision.
- `docs/first-loop.md`: confusing setup instructions.
- Templates: fields that repeatedly caused friction.
- `scripts/score-loop-kit.sh`: next actions that were misleading or missing.

## Privacy And Safety

Do not copy private product details into this repo. Summarize:

- Type of repo
- Product slice shape
- Score and validation outcome
- Confusing artifact or field
- Decision made from the feedback

If the adoption repo contains sensitive data, keep raw notes outside this public reference and record only anonymized lessons.
