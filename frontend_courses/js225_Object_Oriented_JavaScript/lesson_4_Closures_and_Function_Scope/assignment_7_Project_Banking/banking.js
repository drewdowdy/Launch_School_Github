const START_NUMBER = 101;

function makeBank() {
  let accounts = [];
  
  return {
    openAccount() {
      let number = accounts.length + START_NUMBER;
      let newAccount = makeAccount(number);

      accounts.push(newAccount);
      return newAccount;
    },

    transfer(source, destination, amount) {
      destination.deposit(source.withdraw(amount));
      return amount
    },
  }
}

function makeAccount(number) {
  let balance = 0;
  let transactions = [];

  return {
    deposit(amount) {
      balance += amount;
      transactions.push({type: 'deposit', amount});
      return amount;
    },

    withdraw(amount) {
      if (amount > balance) {
        amount = balance;
      }

      balance -= amount;
      transactions.push({type: 'withdrawl', amount});
      return amount;
    },

    balance() {
      return balance;
    },

    number() {
      return number;
    },

    transactions() {
      return transactions;
    },
  }
}

let bank = makeBank();
console.log(bank.accounts);
// undefined
