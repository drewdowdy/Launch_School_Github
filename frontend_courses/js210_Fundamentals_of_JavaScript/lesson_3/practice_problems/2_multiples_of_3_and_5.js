/*
Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.
*/

function multiplesOfThreeAndFive() {
  for (let currentNum = 3; currentNum <= 100; currentNum += 1) {
    if(currentNum % 3 === 0 || currentNum % 5 === 0) {
      if (currentNum % 3 === 0 && currentNum % 5 === 0) {
        console.log(String(currentNum) + '!');
      } else {
        console.log(String(currentNum));
      }
    }
  }
}

multiplesOfThreeAndFive();
/*
output on console
> '3'
> '5'
> '6'
> '9'
> '10'
> '12'
> '15!' <-- has '!'
… remainder of output omitted for brevity
*/
