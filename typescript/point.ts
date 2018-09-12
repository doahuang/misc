export default class Point {
  constructor(private _x?: number, private _y?: number) {
  }

  draw() {
    console.log(`x: ${this._x} y: ${this._y}`)
  }

  get x() {
    return this._x;
  }

  set x(value) {
    this._x = value;
  }
}