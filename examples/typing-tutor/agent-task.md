# Typing Tutor Agent Task

Created: 2026-06-29

## Goal

Build the first usable typing practice slice: a learner can complete one short prompt, see accuracy and speed, and an adult can adjust difficulty before the next session.

## Inputs

- Vision: help a young learner build keyboard fluency through short supervised sessions.
- Spec: one practice screen, one result screen, one adult settings panel.
- Eval plan:
  - Unit test scoring logic.
  - Browser check for practice completion.
  - Responsive check for desktop and tablet widths.

## Scope

In scope:

- Prompt display.
- Typing input.
- Accuracy and words-per-minute calculation.
- Result state.
- Difficulty setting for prompt length.

Out of scope:

- Accounts.
- Long-term storage.
- Payments.
- Content marketplace.

## Acceptance Criteria

| ID | Criterion | Verification |
| --- | --- | --- |
| A1 | Learner can finish a prompt and see accuracy plus speed. | Browser check and scoring test |
| A2 | Adult can switch difficulty before a session starts. | Browser check |
| A3 | Scoring logic handles empty input, exact match, partial match, and extra characters. | Unit tests |
| A4 | Main flow fits desktop and tablet widths without text overlap. | Screenshots |

## Completion Contract

Return:

- Summary of implementation.
- Evidence for A1-A4.
- Commands run and results.
- Screenshots for the main flow.
- Known risks and next product questions.
