// Change your output to include the value from the getMonth method. Thus, the logged string will read "Today's date is Mon, 11 6th", where 11 is the month number returned by getMonth.

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
let month = today.getMonth() + 1; // months are 0-based
let day = today.getDate();
let suffix = dateSuffix(day);

console.log(`Today's date is ${daysOfWeek[today.getDay()]}, ${month} ${day}${suffix}`);
