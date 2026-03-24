// Ideally, the suffix on the day number needs to adjust to the proper suffix for days like the 1st, 22nd, and 3rd. Write a function named dateSuffix that takes the day of month as a numeric value and returns the formatted day of month and suffix. Make sure you use the correct suffixes.

function dateSuffix(day) {
  let lastDigit = day % 10;
  let lastTwoDigits = day % 100;

  if ([11, 12, 13].includes(lastTwoDigits)) {
    return 'th';
  }
  
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
} 

let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let today = new Date();
let suffix = dateSuffix(today.getDate());

console.log(`Today's day is ${daysOfWeek[today.getDay()]}, the ${today.getDate()}${suffix}`);
