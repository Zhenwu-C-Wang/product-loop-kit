# Typing Tutor PR Evidence

Created: 2026-06-29

## Summary

- Slice: first practice-flow slice
- Branch/PR: local prototype
- Agent: Codex
- Status: implemented prototype evidence

## Changes

- Added a runnable static prototype under `prototype/`.
- Added adult difficulty control.
- Added prompt display, typing input, result state, and new-prompt action.
- Added reusable scoring logic in `prototype/scoring.js`.
- Added scoring edge-case tests in `prototype/scoring.test.js`.
- Added desktop and tablet screenshots under `prototype/screenshots/`.

## Acceptance Criteria Evidence

| Criterion | Evidence | Status |
| --- | --- | --- |
| A1 | Browser flow completes one prompt and result screen shows `100%` accuracy plus `59` WPM in the desktop screenshot. | Complete |
| A2 | Difficulty can be changed before starting a session; tablet screenshot shows Medium selected with a medium prompt. | Complete |
| A3 | Unit tests cover empty input, exact match, partial match, extra characters, normalization, and multi-word WPM. | Complete |
| A4 | Desktop and tablet screenshots show no text overlap; Playwright overflow check returned no issues. | Complete |

## Checks Run

| Check | Command/Method | Result | Notes |
| --- | --- | --- | --- |
| Scoring unit tests | `node examples/typing-tutor/prototype/scoring.test.js` | Pass | Six tests passed. |
| Browser practice flow | Playwright file-url check | Pass | Desktop flow reached result state with accuracy and WPM. |
| Difficulty switch check | Playwright file-url check | Pass | Medium difficulty selected before typing. |
| Responsive inspection | Playwright screenshots | Pass | Desktop `1440x900`, tablet `820x1180`; no horizontal overflow. |

## Product Inspection

- Environment: static HTML opened via file URL in Playwright.
- Viewports/devices: desktop `1440x900`, tablet `820x1180`.
- Screenshots/videos:
  - `prototype/screenshots/desktop-result.png`
  - `prototype/screenshots/tablet-result.png`
- Workflow notes: adult controls are available before active typing; result state updates after `Check`.

## Risks And Tradeoffs

| Risk | Impact | Mitigation/Next Step |
| --- | --- | --- |
| WPM definition may be disputed. | Result may confuse adults. | Current prototype uses typed words adjusted by accuracy; revisit after user review. |
| Difficulty control may distract learner. | Practice flow may feel busy. | Consider hiding adult controls during active session in the next iteration. |

## Skipped Or Blocked Checks

| Check | Reason | Owner |
| --- | --- | --- |
| Real learner observation | Requires learner/adult session outside local prototype QA. | Builder |

## Questions For Developer Review

- Is the result language clear enough for a young learner?
- Does adult difficulty control belong on the setup screen only?
