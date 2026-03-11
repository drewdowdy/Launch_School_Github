// Write a function that takes a floating point number representing an angle between 0 and 360 degrees and returns a string representing that angle in degrees, minutes, and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

const DEGREE = '\u00B0'; // ° symbol
const MINUTE_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;

function leadingZero(number) {
  return String(number).length < 2 ? `0${number}` : String(number);
}

// function dms(angle) {
//   let degrees = Math.floor(angle);
//   let minutes = (angle % 1) * MINUTE_PER_DEGREE;
//   let seconds = (minutes % 1) * SECONDS_PER_MINUTE;

//   degrees = String(degrees);
//   minutes = leadingZero(Math.floor(minutes));
//   seconds = leadingZero(Math.floor(seconds));

//   console.log(`${degrees + DEGREE}${minutes}'${seconds}"`);
//   return `${degrees + DEGREE}${minutes}'${seconds}"`;
// }

// All test cases should return true
console.log(dms(30) === "30°00'00\"");
console.log(dms(76.73) === "76°43'48\"");
console.log(dms(254.6) === "254°35'59\"");
console.log(dms(93.034773) === "93°02'05\"");
console.log(dms(0) === "0°00'00\"");
console.log(dms(360) === "360°00'00\"" || dms(360) === "0°00'00\"");

//further exploration
// modify the code so it returns a value in the appropriate range when the input is less than 0 or greater than 360

function range360(number) {
  const MIN_DEGREE = 0;
  const MAX_DEGREE = 360;

  return (number - MIN_DEGREE) % (MAX_DEGREE - MIN_DEGREE + 1) + MIN_DEGREE; 
}

function dms(angle) {
  let positiveAngle = range360(angle);
  let degrees = Math.floor(positiveAngle);
  let minutes = (positiveAngle % 1) * MINUTE_PER_DEGREE;
  let seconds = (minutes % 1) * SECONDS_PER_MINUTE;

  degrees = String(degrees);
  minutes = leadingZero(Math.floor(minutes));
  seconds = leadingZero(Math.floor(seconds));

  console.log(`${degrees + DEGREE}${minutes}'${seconds}"`);
  return `${degrees + DEGREE}${minutes}'${seconds}"`;
}

dms(-1);   // 359°00'00"
dms(400);  // 40°00'00"
dms(-40);  // 320°00'00"
dms(-420); // 300°00'00"
