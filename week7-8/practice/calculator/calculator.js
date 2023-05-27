document.addEventListener('DOMContentLoaded', () => {
  console.log('loaded');

  const display = document.getElementById('display');
  const buttons = document.getElementById('buttons');

  display.style.textAlign = 'right';

  const digit = [];
  const operator = [];
  buttons.addEventListener('click', (event) => {
    if (event.target.classList.contains('digit')) {
      const pushDigit = Number(event.target.textContent);
      if ((pushDigit !== 0 && display.textContent === '') || (display.textContent !== '')) {
        display.textContent += pushDigit;
      }
    }
    if (event.target.classList.contains('operator') && display.textContent !== '') {
      const pushOperator = event.target.textContent;
      operator.push(pushOperator);
      digit.push(display.textContent);
      // display.textContent += pushOperator;
      console.log(digit);
      console.log(operator);
    }
  });
});
