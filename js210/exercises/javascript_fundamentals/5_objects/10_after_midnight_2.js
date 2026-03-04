// As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

// The two functions below do the reverse of the previous exercise. They take a 24-hour time argument and return the number of minutes before or after midnight, respectively. Both functions should return a value between 0 and 1439 (inclusive). Refactor the functions using the Date object.

const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

const SECONDS_PER_MINUTE = 60;
const MILLISECONDS_PER_SECOND = 1000;
const MILLISECONDS_PER_MINUTE = MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE;

const TODAY = new Date();
const DATE = `${TODAY.getFullYear()}/${TODAY.getMonth()}/${TODAY.getDate()}`;
const MIDNIGHT = new Date(DATE);

function afterMidnight(timeStr) {
  let currentTime = new Date(DATE + ' ' + timeStr);
  
  let millisecondDifference = currentTime.getTime() - MIDNIGHT.getTime();
  let minuteDifference = millisecondDifference / MILLISECONDS_PER_MINUTE;

  return minuteDifference;
}

function beforeMidnight(timeStr) {
  let deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }

  return deltaMinutes;
}

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686
