function asyncSort(numbers) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      numbers.sort((a, b) => a - b);
      resolve(numbers);
    }, 2000);
  });
}

const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
asyncSort(numbers).then((sortedNumbers) => {
  console.log(sortedNumbers);
}).catch((error) => {
  console.error(`Error: ${error}`);
});

console.log('同期処理');

// 同期処理
// [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
