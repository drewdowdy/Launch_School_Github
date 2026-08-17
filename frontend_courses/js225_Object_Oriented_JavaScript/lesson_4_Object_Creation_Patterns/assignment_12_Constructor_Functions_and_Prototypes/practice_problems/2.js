// What does the following code log to the console?

let RECTANGLE = {
  area() {
    return this.width * this.height;
  },
  perimeter() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}

let rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.perimeter);

/*
Answer:

> NaN
> NaN

Line 15 assigns area to the return value of RECTANGLE.area(), but the RECTANGLE object has no such width or height properties, so `undefined * undefined` is NaN.

And it's a similar story for line 16, with no such width or height properties, `2 * (undefined + undefined)` is NaN.

Solution:

We can pass the correct context in with call() and pass `this` as an argument, and `this` would refer to the object created by the Rectangle constructor.
*/

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);           // use call()
  this.perimeter = RECTANGLE.perimeter.call(this); // use call()
}
