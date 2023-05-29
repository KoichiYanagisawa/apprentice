document.addEventListener('DOMContentLoaded', () => {
  const display = document.getElementById('display');
  const buttons = document.getElementById('buttons');
  const digit = [];
  const operator = [];
  let operatorPressed = false;

  display.style.textAlign = 'right';
  display.textContent = 0;

  buttons.addEventListener('click', (event) => {
    if (event.target.classList.contains('operator')) {
      if (operatorPressed) {
        if (digit.length === operator.length && operator.length !== 0) {
          operator[operator.length - 1] = event.target.textContent;
        }
        display.textContent = display.textContent.slice(0, -1) + event.target.textContent;
      } else {
        operatorPressed = true;
        digit.push(Number(display.textContent));
        operator.push(event.target.textContent);
        display.textContent += event.target.textContent;
      }
    } else if (event.target.classList.contains('digit')) {
      const pushDigit = Number(event.target.textContent);
      if (display.textContent === '0' || operatorPressed || '+-*/'.includes(display.textContent.slice(-1))) {
        display.textContent = pushDigit;
        operatorPressed = false;
      } else {
        display.textContent += pushDigit;
      }
    } else if (event.target.id === 'clear') {
      operatorPressed = false;
      display.textContent = '0';
      digit.length = 0;
      operator.length = 0;
    } else if (event.target.id === 'equals') {
      if (digit.length !== 0 && operator.length !== 0) {
        digit.push(Number(display.textContent));
      } else {
        return;
      }
      for (let i = 0; i < operator.length; i += 1) {
        if (operator[i] === '*' || operator[i] === '/') {
          if (operator[i] === '*') {
            digit[i] *= digit[i + 1];
          } else {
            if (digit[i + 1] === 0) {
              display.textContent = 'Error';
              operatorPressed = false;
              digit.length = 0;
              operator.length = 0;
              return;
            }
            digit[i] /= digit[i + 1];
          }
          digit.splice(i + 1, 1);
          operator.splice(i, 1);
          i -= 1;
        }
      }
      let result = digit[0];
      for (let i = 0; i < operator.length; i += 1) {
        if (operator[i] === '+') {
          result += digit[i + 1];
        } else if (operator[i] === '-') {
          result -= digit[i + 1];
        }
      }
      display.textContent = result.toFixed(2);
      operatorPressed = false;
      digit.length = 0;
      operator.length = 0;
    }
  });
});
