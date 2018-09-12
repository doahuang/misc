const quickSort = arr => {
  if (arr.length <= 1) return arr;

  let pivot = arr[0], left = [], right = [];

  for (let i = 1; i < arr.length; i++) {
    let el = arr[i];
    
    (el < pivot) ? left.push(el) : right.push(el);
  }
  
  return quickSort(left).concat([pivot], quickSort(right));
};

module.exports = quickSort;