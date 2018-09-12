const randomizer = require('./randomizer');
const check = require('./check');
const bubbleSort = require('./bubble_sort');
const quickSort = require('./quick_sort');

function test() {
  // test case
  let arr1 = randomizer(10);
  let arr2 = arr1.slice(0).sort((x, y) => x - y);
  
  // sort
  bubble = bubbleSort(arr1);
  quick = quickSort(arr1);
  
  console.log(`bubble sort => ${check(bubble, arr2)}`);
  console.log(`quick sort => ${check(quick, arr2)}`);
}

test();