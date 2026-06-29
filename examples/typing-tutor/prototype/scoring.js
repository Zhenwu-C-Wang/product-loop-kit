(function attachScoring(globalScope) {
  function normalizeText(value) {
    return String(value || "")
      .trim()
      .replace(/\s+/g, " ")
      .toLowerCase();
  }

  function countCorrectCharacters(prompt, response) {
    let correct = 0;

    for (let index = 0; index < Math.min(prompt.length, response.length); index += 1) {
      if (prompt[index] === response[index]) {
        correct += 1;
      }
    }

    return correct;
  }

  function countWords(value) {
    const normalized = normalizeText(value);
    return normalized ? normalized.split(" ").length : 0;
  }

  function scoreAttempt(promptText, responseText, elapsedMs) {
    const prompt = normalizeText(promptText);
    const response = normalizeText(responseText);
    const denominator = Math.max(prompt.length, response.length);
    const correctCharacters = countCorrectCharacters(prompt, response);
    const accuracy = denominator === 0 ? 0 : Math.round((correctCharacters / denominator) * 100);
    const elapsedMinutes = Math.max(Number(elapsedMs) || 0, 0) / 60000;
    const typedWords = countWords(response);
    const rawWpm = elapsedMinutes > 0 ? typedWords / elapsedMinutes : 0;
    const wpm = Math.round(rawWpm * (accuracy / 100));

    return {
      accuracy,
      correctCharacters,
      promptCharacters: prompt.length,
      responseCharacters: response.length,
      typedWords,
      wpm,
    };
  }

  const api = {
    countCorrectCharacters,
    countWords,
    normalizeText,
    scoreAttempt,
  };

  if (typeof module !== "undefined" && module.exports) {
    module.exports = api;
  }

  globalScope.TypingTutorScoring = api;
})(typeof window !== "undefined" ? window : globalThis);
