// Our call to console.log is getting cluttered. Let's clean things up a bit and refactor the code into a few formatting functions that we can call from anywhere in our code. Create formattedMonth and formattedDay functions to format the month and day, then write a formattedDate function that pulls everything together and logs the fully formatted date.

function dateSuffix(number) {
  let lastDigit = number % 10;
  let lastTwoDigits = number % 100;

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

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[date.getDay()];
}

function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[date.getMonth()];
}

function formattedDate(date) {
  let day = formattedDay(date);
  let month = formattedMonth(date);
  let number = date.getDate();
  let suffix = dateSuffix(number);

  return `${day}, ${month} ${number}${suffix}`;
}

let today = new Date();

console.log(`Today's date is ${formattedDate(today)}`);

