// Finally, write a function named formatTime that takes a date object as an argument and returns a string formatted with the hours and minutes as "15:30". Make sure you handle the case where the hours or minutes has only one you need to pad the value with a leading zero in such cases, e.g., "03:04". You can use the getHours and getMinutes methods to obtain the hours and minutes.

function leadingZero(number) {
  if (number < 10) {
    return '0' + String(number);
  } else {
    return String(number);
  }
}

function formatTime(date) {
  let hours = date.getHours();
  let minutes = date.getMinutes();

  return `${leadingZero(hours)}:${leadingZero(minutes)}`;
}

let now = new Date();

console.log(formatTime(now));
