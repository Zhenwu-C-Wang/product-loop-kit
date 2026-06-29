(function startTypingTutor() {
  const prompts = {
    easy: ["cat sat softly", "red cup tips", "sun on desk"],
    medium: ["little hands find the home row", "bright keys click in steady time", "practice makes each word easier"],
    hard: [
      "accuracy grows when every finger returns home",
      "steady typing beats rushing through a difficult line",
      "small daily sessions build confident keyboard habits",
    ],
  };

  const state = {
    difficulty: "easy",
    promptIndex: 0,
    startedAt: Date.now(),
  };

  const scoring = window.TypingTutorScoring;
  const difficultyButtons = Array.from(document.querySelectorAll(".difficulty-button"));
  const promptText = document.getElementById("prompt-text");
  const promptMeta = document.getElementById("prompt-meta");
  const statusLine = document.getElementById("status-line");
  const typingInput = document.getElementById("typing-input");
  const checkButton = document.getElementById("check-button");
  const newPromptButton = document.getElementById("new-prompt-button");
  const resultState = document.getElementById("result-state");
  const accuracyValue = document.getElementById("accuracy-value");
  const wpmValue = document.getElementById("wpm-value");
  const feedbackMessage = document.getElementById("feedback-message");
  const correctValue = document.getElementById("correct-value");
  const typedValue = document.getElementById("typed-value");
  const timeValue = document.getElementById("time-value");

  function currentPrompt() {
    return prompts[state.difficulty][state.promptIndex];
  }

  function updateDifficultyButtons() {
    difficultyButtons.forEach((button) => {
      const isActive = button.dataset.difficulty === state.difficulty;
      button.classList.toggle("is-active", isActive);
      button.setAttribute("aria-pressed", String(isActive));
    });
  }

  function countPromptWords(prompt) {
    return scoring.countWords(prompt);
  }

  function resetResult() {
    resultState.textContent = "Waiting";
    accuracyValue.textContent = "--%";
    wpmValue.textContent = "--";
    feedbackMessage.textContent = "Finish the prompt, then check your result.";
    correctValue.textContent = "--";
    typedValue.textContent = "--";
    timeValue.textContent = "0s";
  }

  function renderPrompt() {
    const prompt = currentPrompt();
    promptText.textContent = prompt;
    promptMeta.textContent = `${countPromptWords(prompt)} words`;
    statusLine.textContent = `${capitalize(state.difficulty)} mode ready. Type the prompt, then check your result.`;
    typingInput.value = "";
    state.startedAt = Date.now();
    resetResult();
    updateDifficultyButtons();
    typingInput.focus();
  }

  function nextPrompt() {
    state.promptIndex = (state.promptIndex + 1) % prompts[state.difficulty].length;
    renderPrompt();
  }

  function setDifficulty(difficulty) {
    state.difficulty = difficulty;
    state.promptIndex = 0;
    renderPrompt();
  }

  function feedbackForScore(score) {
    if (score.responseCharacters === 0) {
      return "No typing yet. Try the prompt once, then check again.";
    }

    if (score.accuracy >= 95) {
      return "Strong typing. Keep this difficulty or try the next one.";
    }

    if (score.accuracy >= 70) {
      return "Good start. Slow down and watch each letter on the next try.";
    }

    return "This one needs another calm try. Accuracy matters more than speed.";
  }

  function checkResult() {
    const elapsedMs = Date.now() - state.startedAt;
    const score = scoring.scoreAttempt(currentPrompt(), typingInput.value, elapsedMs);
    const elapsedSeconds = Math.max(1, Math.round(elapsedMs / 1000));

    resultState.textContent = score.responseCharacters === 0 ? "Try again" : "Checked";
    accuracyValue.textContent = `${score.accuracy}%`;
    wpmValue.textContent = String(score.wpm);
    feedbackMessage.textContent = feedbackForScore(score);
    correctValue.textContent = `${score.correctCharacters}/${score.promptCharacters}`;
    typedValue.textContent = String(score.responseCharacters);
    timeValue.textContent = `${elapsedSeconds}s`;
    statusLine.textContent = `${capitalize(state.difficulty)} mode checked. Review the result or start a new prompt.`;
  }

  function capitalize(value) {
    return value.charAt(0).toUpperCase() + value.slice(1);
  }

  difficultyButtons.forEach((button) => {
    button.addEventListener("click", () => setDifficulty(button.dataset.difficulty));
  });

  checkButton.addEventListener("click", checkResult);
  newPromptButton.addEventListener("click", nextPrompt);

  typingInput.addEventListener("input", () => {
    if (resultState.textContent !== "Waiting") {
      resetResult();
    }
  });

  renderPrompt();
})();
