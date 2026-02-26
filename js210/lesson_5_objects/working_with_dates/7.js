// Let's make the month readable. Using the same technique we used in problem 3, convert the month number in the output string to a 3-letter month name abbreviation. You may use the following array:

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
let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

let today = new Date();
let month = months[today.getMonth()];
let day = today.getDate();
let suffix = dateSuffix(day);

console.log(`Today's date is ${daysOfWeek[today.getDay()]}, ${month} ${day}${suffix}`);
