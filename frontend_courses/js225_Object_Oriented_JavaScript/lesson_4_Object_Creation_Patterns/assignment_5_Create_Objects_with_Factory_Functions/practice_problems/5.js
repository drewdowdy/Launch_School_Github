// Update your createInvoice function to make it possible to add payment(s) to invoices. Use the code below as a guideline:

function createInvoice({ phone = 3000, internet = 55000, amount = 0 }={}) {
  
  return {
    phone,
    internet,
    payments: [],
    
    total() {
      return this.phone + this.internet;
    },

    addPayment(invoice) {
      this.payments.push(invoice);
    },

    addPayments(invoices) {
      for (let invoice of invoices) {
        this.payments.push(invoice);
      }
    },

    paymentDue() {

    },
  }
}

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
invoice.amountDue();       // this should return 0
