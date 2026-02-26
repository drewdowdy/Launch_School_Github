// Create a new date object variable named tomorrow that contains a Date object. Initialize the variable by setting it to the value of today. You can get the value of today using the getTime method. Next, change the date on the tomorrow object to the day after today: you should use setDate to change the date. Finally, log the tomorrow object with your formattedDate function.

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
let tomorrow = new Date(today.getTime()); // getTime() makes intentions clear
tomorrow.setDate(today.getDate() + 1);

console.log(formattedDate(tomorrow));
