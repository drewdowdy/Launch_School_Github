// We can use the number of minutes before or after midnight to represent the time of day. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

// The timeOfDay function shown below takes a time argument using this minute-based format, and returns the time of day in 24-hour format ("hh:mm"). Reimplement the function using JavaScript's Date object.

const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY;
const SECONDS_PER_MINUTE = 60;
const MILLISECONDS_PER_SECOND = 1000;
const MILLISECONDS_PER_MINUTE = MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE;

function leadingZero(number) {
  return number < 10 ? '0' + String(number) : String(number);
}

function minutesToTime(totalMinutes) {
  let minutes = totalMinutes % MINUTES_PER_HOUR;
  let hours = Math.floor(totalMinutes / MINUTES_PER_HOUR);

  return [hours, minutes];
}

// function timeOfDay(minutes) {
//   let totalMinutes = ((minutes % MINUTES_PER_DAY) + MINUTES_PER_DAY) % MINUTES_PER_DAY;
//   let time = minutesToTime(totalMinutes);

//   console.log(leadingZero(time[0]) + ':' + leadingZero(time[1]));
//   return leadingZero(time[0]) + ':' + leadingZero(time[1]);
// }

// Implement function with Date object
function timeOfDay(minutes) {
  let today = new Date();
  let midnight = new Date(today.getFullYear(), today.getMonth(), today.getDate());

  let totalSeconds = minutes * MILLISECONDS_PER_MINUTE;
  let newTime = new Date(midnight.getTime() + totalSeconds);

  console.log(newTime.toTimeString());
  
  return `${leadingZero(newTime.getHours())}:${leadingZero(newTime.getMinutes())}`;
}

timeOfDay(0);          // "00:00"
timeOfDay(-3);         // "23:57"
timeOfDay(35);         // "00:35"
timeOfDay(-1437);      // "00:03"
timeOfDay(3000);       // "02:00"
timeOfDay(800);        // "13:20"
timeOfDay(-4231);      // "01:29"
