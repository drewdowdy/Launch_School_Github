function makeCar(rate, brakeRate) {
  return {
    speed: 0, 
    rate,
    brakeRate: brakeRate || 0,
    
    accelerate() {
      this.speed += this.rate;
    },

    break() {
      this.speed -= this.brakeRate;
      if (this.speed < 0) this.speed = 0;
    },
  };
}

let [ sedan, coupe ] = [makeCar(8, 6), makeCar(12)];

sedan.accelerate();
coupe.accelerate();

let hatchback = makeCar(9);

sedan.break();
console.log(sedan.speed);

sedan.break();
console.log(sedan.speed);
