// The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items". How can you refactor the function so that it will work with invoices containing any number of line items?

// function invoiceTotal(amount1, amount2, amount3, amount4) {
  // return amount1 + amount2 + amount3 + amount4;
// }

function invoiceTotal(...amounts) { // rest syntax
  let sum = 0; // initialize a sum

  for (let i = 0; i < amounts.length; i += 1) { // iterate through the `amounts` array
    sum += amounts[i]; // add each value to the sum
  }

  return sum;
}

invoiceTotal(20, 30, 40, 50);          // works as expected
invoiceTotal(20, 30, 40, 50, 40, 40);  // does not work; how can you make it work?
