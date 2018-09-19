class minStack {
  constructor() {
    this.store = [];
    this.minStore = [];
  }

  pop() {
    let el = this.peek();
    let min = this.peekmin();

    if (el === min) {
      //only pop the minStore if el === min
      this.minStore.pop();
    }

    this.store.pop();
    return el;
  }

  push(el) {
    let min = this.peekmin();

    if (!this.minStore.length || el <= min) {
      //only push to minStore if empty of el <= min
      this.minStore.push(el);
    }

    this.store.push(el);
    return this.store;
  }

  peek() {
    return this.store[this.store.length - 1]
  }

  peekmin() {
    return this.minStore[this.minStore.length - 1]
  }
}

//test cases
let stack = new minStack();
stack.push(4)
stack.push(5)
stack.push(4)
stack.push(2)
stack.push(1)
stack.push(3)
stack.push(0)
console.log(stack.store, stack.minStore)
console.log(stack.peekmin() === 0)
stack.pop();
console.log(stack.peekmin() === 1)
stack.pop();
stack.pop();
console.log(stack.peekmin() === 2)
stack.pop();
stack.pop();
stack.pop();
console.log(stack.peekmin() === 4)