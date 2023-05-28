document.addEventListener('DOMContentLoaded', () => {
  const display = document.getElementById('display');
  const buttons = document.getElementById('buttons');
  const digit = [];
  const operator = [];
  let operatorPressed = false;

  display.style.textAlign = 'right';

  buttons.addEventListener('click', (event) => {
    if (event.target.classList.contains('operator')) {
      // フラグ管理
      if (operatorPressed) {
        if (digit.length === operator.length && operator.length !== 0) {
          operator[operator.length - 1] = event.target.textContent;
          console.log(operator);
        }
      } else {
        operatorPressed = true;

        if (digit.length === operator.length && display.textContent !== '') {
          // 数値を配列に格納
          digit.push(Number(display.textContent));
          console.log(digit);
          // 符号を配列に格納
          operator.push(event.target.textContent);
          console.log(operator);
        }
      }
    } else if (event.target.classList.contains('digit')) {
      // フラグをリセットする
      // 数値をディスプレイに表示
      const pushDigit = Number(event.target.textContent);
      if ((pushDigit !== 0 && display.textContent === '') || (display.textContent !== '')) {
        if (operatorPressed) {
          operatorPressed = false;
          display.textContent = '';
        }
        display.textContent += pushDigit;
      }
    } else if (event.target.id === 'clear') {
      operatorPressed = false;
      display.textContent = '';
      digit.length = 0;
      operator.length = 0;
    } else if (event.target.id === 'equals') {
      console.log('=が押されました');
      if (operator.length !== 0) {
        if (display.textContent !== '') {
          digit.push(Number(display.textContent));
          console.log(digit);
        }
        if (digit.length === operator.length) {
          operator.pop();
        }
        let result = 0;
        const newArr = digit.map((value, index) => {
          switch (operator[index]) {
            case '*':
              result = digit[index] * digit[index + 1];
              operator.splice(index, 1);
              console.log(digit);
              console.log(operator);
              return result;
            case '/':
              result = digit[index] / digit[index + 1];
              operator.splice(index, 1);
              console.log(digit);
              console.log(operator);
              return result;
            default:
              result = value;
          }
          return result;
        });
        console.log(newArr);
        digit.forEach((value) => {

        });
      } else {
        display.textContent = 0;
      }
    }
  });
});
