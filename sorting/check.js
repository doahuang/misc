const check = (arr1, arr2) => {
  for (let i = 0; i < arr1.length; i++) {
    let el = arr1[i];
    
    if (el !== arr2[i]) return false;
  }

  return true;
};

module.exports = check;