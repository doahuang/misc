const randomizer = total => {
  let arr = [];

  for (let i = 0; i < total; i++) {
    let el = Math.floor(Math.random() * 100 + 1);
    arr.push(el);
  }

  return arr;
};

module.exports = randomizer;