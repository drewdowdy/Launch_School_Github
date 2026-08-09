let invoices = {
  unpaid: [],
  paid: [],

  add: function(name, amount) {
    this.unpaid.push({name, amount});
  },

  totalDue: function() {
    return this.unpaid.reduce((s, i) => s + i.amount, 0);
  },
   
  payInvoice: function(name) {
    let newUnpaid = this.unpaid.reduce((result, invoice) => {
      if (invoice.name === name) {
        this.paid.push(invoice);
      } else {
        result.push(invoice);
      }

      return result;
    }, []);

    this.unpaid = newUnpaid;
  },

  totalPaid: function() {
    return this.paid.reduce((s, i) => s + i.amount, 0);   
  }
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');

console.log(invoices.totalPaid());
console.log(invoices.totalDue());
