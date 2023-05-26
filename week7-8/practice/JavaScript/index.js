// 変数を宣言し代入することができる
const num1 = 5;
const num2 = 3;
const sum = num1 + num2;
const difference = num1 - num2;
console.log(sum + difference);

// 関数を定義し使うことができる
function greet(name) {
  console.log(`Hello, ${name}!`);
}
greet('Hikaru');

// 条件分岐を使うことができる
function checkTemperature(t) {
  let result;
  if (t >= 30) {
    result = 'Hot';
  } else if (t >= 15) {
    result = 'Warm';
  } else {
    result = 'Cold';
  }
  return console.log(result);
}
checkTemperature(-15);
checkTemperature(0);
checkTemperature(15);
checkTemperature(30);
checkTemperature(50);
// 偶数チェッカー
function checkOddOrEven(n) {
  if (n % 2 !== 0) {
    return console.log('Odd');
  }
  return console.log('Even');
}
checkOddOrEven(2);

// ループを使うことができる
// 奇数が含まれるかの判定
function hasOdd(numbers) {
  return numbers.some((number) => number % 2 !== 0);
}
console.log(hasOdd([1, 2, 3, 4, 5]));

// 奇数の抽出
function odd(numbers) {
  return numbers.filter((number) => number % 2 !== 0);
}
console.log(odd([1, 2, 3, 4, 5]));

// 2乗の計算
function square(numbers) {
  return numbers.map((number) => number ** 2);
}
console.log(square([1, 2, 3, 4, 5]));

// オブジェクトを使うことができる
function printBooks(books) {
  books.forEach((book) => {
    console.log(`『${book.book}』${book.name}`);
  });
}
const books = [
  { name: '山田太郎', book: 'JavaScript入門' },
  { name: '山田次郎', book: 'JavaScriptの絵本' },
];
printBooks(books);

// ユーザーパーミッションチェッカー
const users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false,
    },
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false,
    },
  },
  // ユーザーを追加してください
];
function checkPermission(username, permission) {
  const result = users.find((user) => user.username === username);
  return result ? result.permissions[permission] || false : false;
}
console.log(checkPermission('山田', 'canWrite'));

// メソッド
const obj = {
  method() {
    console.log('method');
  },
};

obj.method();
