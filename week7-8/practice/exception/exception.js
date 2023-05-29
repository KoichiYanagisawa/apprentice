document.addEventListener('DOMContentLoaded', () => {
  function checkDivisibleByFive(num) {
    if (num % 5 === 0) {
      return true;
    }
    throw new Error('数値は5で割り切れません');
  }

  try {
    const checked = checkDivisibleByFive(6);
  } catch (e) {
    console.log(e.message);
  }
});
