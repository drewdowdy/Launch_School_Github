/*
The objective of this practice problem is to build a function that parses a string of email data. The function takes an argument that contains the data, parses it, then produces two basic statistics about the email:

- The number of email messages found in the string
- The date range of the email messages
- The email messages string has the following characteristics:

The string contains multiple email messages separated by the delimiter string ##||##.

Each email message has five parts. The delimiter string #/# separates the parts.

The five parts are:

- Sender
- Subject
- Date
- Recipient
- Body

All five parts occur in the sequence shown above.
*/

// emailData src = https://dbdwvr6p7sskw.cloudfront.net/210/files/email_data_v2.js

function parseEmails(emailData) {
  let allEmails = emailData.split('##||##');

  return allEmails.map(email => {
    let [ sender, subject, date, receipient, body ] = email.split('#/#');

    return {
      sender,
      subject,
      date,
      receipient,
      body,
    }
  });
}

function parseDate(datePart) {
  datePart = datePart.slice(7);
  let [ month, day, year ] = datePart.split('-');
  return new Date(`${year}/${month}/${day}`); // using `/` 
}

function mailCount(emailData) {
  let emails = parseEmails(emailData);
  let emailCount = emails.length;

  let allDates = emails.map(email => parseDate(email.date));
  let minDate = new Date(Math.min(...allDates));
  let maxDate = new Date(Math.max(...allDates));

  console.log(`Count of Email: ${emailCount}`);
  console.log(`Date Range: ${minDate.toDateString()} - ${maxDate.toDateString()}`);
}

mailCount(emailData);
// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016
