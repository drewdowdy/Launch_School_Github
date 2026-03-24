/*
Write a function that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901 - 2000 comprise the 20th century.

1st
2nd
3rd
4th
5th
..

*/

function isEvelenTwelveThirteen(twoDigits) {
 switch (twoDigits) {
  case '11': return true
  case '12': return true
  case '13': return true
 }

 return false;
}

function century(year) {
  let centuryNumber = Math.ceil(year / 100);
  let lastTwoDigits = String(centuryNumber % 10);
  let lastDigit = String(centuryNumber % 100);
  let centuryString = String(centuryNumber);

  if (isEvelenTwelveThirteen(lastTwoDigits)) {
    centuryString += 'th';
  } else {
    switch (lastDigit) {
      case '1': {
        centuryString += 'st';
        break;
      }
      case '2': {
        centuryString += 'nd';
        break;
      };
      case '3': {
        centuryString += 'rd';
        break;
      };
      default: centuryString += 'th';
    }
  }

  console.log(centuryString);
  return centuryString;
}

// refactored
function getSuffix(number) {
  lastDigit = number % 10;
  lastTwoDigits = number % 100;

  if (lastTwoDigits === 11 || lastTwoDigits === 12 || lastTwoDigits === 13) return 'th';
  if (lastDigit === 1) return 'st';
  if (lastDigit === 2) return 'nd';
  if (lastDigit === 3) return 'rd';
  
  return 'th';
}

function century(year) {
  centuryNumber = Math.ceil(year / 100);
  return `${centuryNumber}${getSuffix(centuryNumber)}`;
}

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
