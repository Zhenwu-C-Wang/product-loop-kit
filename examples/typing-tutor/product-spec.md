# Typing Tutor Product Spec

Created: 2026-06-29

## Slice

- Name: first practice-flow slice
- Owner: builder
- Status: ready for agent
- Related vision bet: Short guided practice with adult-controlled difficulty can improve practice consistency.

## Problem

Young learners need typing practice that starts quickly and gives clear feedback. Adults need enough control to adjust difficulty without setting up an account, curriculum, or lesson plan.

## User Story

As a supervising adult, I want a learner to complete one short typing prompt and see simple results, so that we can decide whether to repeat, increase, or decrease difficulty in the next session.

## Requirements

| ID | Requirement | Priority | Notes |
| --- | --- | --- | --- |
| R1 | Show one prompt selected from the current difficulty. | Must | Difficulty can be prompt length or phrase set. |
| R2 | Let the learner type the prompt and submit it. | Must | Input should stay focused during practice. |
| R3 | Calculate accuracy and words per minute. | Must | Scoring logic should be separable for tests. |
| R4 | Show a result state with accuracy, speed, and a clear next action. | Must | Keep language simple and kind. |
| R5 | Let the adult choose difficulty before a session starts. | Must | No account or persistence required. |
| R6 | Fit desktop and tablet widths without text overlap. | Should | Mobile can be refined later. |

## Acceptance Criteria

| ID | Criterion | Verification Method |
| --- | --- | --- |
| A1 | Learner can finish a prompt and see accuracy plus speed. | Browser check and scoring test. |
| A2 | Adult can switch difficulty before a session starts. | Browser check. |
| A3 | Scoring handles empty input, exact match, partial match, and extra characters. | Unit tests. |
| A4 | Main flow fits desktop and tablet widths without text overlap. | Screenshots or visual inspection. |

## UX Notes

- Entry point: Practice screen with difficulty control and start action.
- Main flow: Choose difficulty, start prompt, type response, submit, review results, start another prompt.
- Empty state: Before starting, show a calm prompt preview or start button.
- Error state: Empty submissions should show zero accuracy without crashing.
- Loading state: Not required for local prompt data.
- Accessibility: Use visible labels for difficulty and typing input.
- Mobile/responsive behavior: Desktop and tablet widths are required; narrow mobile is later.

## Data And State

- Inputs: Difficulty, prompt text, learner typed response, elapsed time.
- Outputs: Accuracy percentage, words per minute, completion state.
- State transitions: setup -> active -> result -> setup.
- Persistence: None in first slice.
- Privacy/security considerations: Do not collect learner identity in first slice.

## Instrumentation

| Event/Metric | Trigger | Purpose |
| --- | --- | --- |
| session_started | Learner begins prompt | Measure practice attempts. |
| session_completed | Learner submits response | Measure completion. |
| difficulty_changed | Adult changes difficulty | Learn whether difficulty controls are used. |

## Dependencies

- Local prompt list.
- Test runner in target app.
- Browser inspection tool for UI checks.

## Non-Goals

- Accounts.
- Long-term progress storage.
- Rewards/costumes.
- Adaptive difficulty.

## Open Questions

| Question | Owner | Needed By |
| --- | --- | --- |
| Should WPM count prompt words or typed words? | Builder | Before implementation |
| Should adult difficulty be hidden during active typing? | Builder | During UI review |
