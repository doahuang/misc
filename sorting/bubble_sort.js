const bubbleSort = array => {
  let arr = array.slice(0);

  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < arr.length; i++) {
      let current = arr[i], next = arr[i + 1];
      if (!next) break;
      
      if (current > next) {
        [arr[i], arr[i + 1]] = [next, current];
        sorted = false;
      }
    }
  }

  return arr;
};

module.exports = bubbleSort;