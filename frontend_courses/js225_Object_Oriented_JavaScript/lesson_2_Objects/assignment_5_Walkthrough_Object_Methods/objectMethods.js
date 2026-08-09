function newLine() {
  console.log('\n');
}

let me = {
  firstName: 'John',
  lastName: 'Smith',
};

// can add properties after object creation
let anotherMe = {};
anotherMe.firstName = 'John';
anotherMe.lastName = 'Smith';

function fullName(person) {
  console.log(person.firstName + ' ' + person.lastName);
}

fullName(me); // > John Smith
fullName(anotherMe); // > John Smith

let friend = {
  firstName: 'Billy',
  lastName: 'Bob',
};

fullName(friend); // > Billy Bob

let mother = {
  firstName: 'Joanne',
  lastName: 'Smith'
}

let father = {
  firstName: 'Jim',
  lastName: 'Smith',
}

let people = {
  collection: [me, friend, mother, father],

  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName)
  },

  add: function(...people) {
    for (let person of people) {
      if (this.isInvalidPerson(person)) continue;
      let existingId = this.getIndex(person);

      if (existingId >= 0) {
        this.collection[existingId] = {...person, index: existingId};
      } else {
        this.collection.push({...person, index: this.collection.length});
      }
    }
  },

  getIndex: function(person) {
    let idx = -1;

    for (let i = 0; i < this.collection.length; i++) {
      let otherPerson = this.collection[i];

      if (otherPerson.firstName === person.firstName && otherPerson.lastName === person.lastName) {
        idx = i;
        break;
      }
    }

    return idx;
  },

  remove: function(person) {
    let idx = this.getIndex(person);
    if (idx < 0 || this.isInvalidPerson(person)) return;
    
    this.collection.splice(idx, 1);
    this.reindex();
  },

  reindex: function() {
    this.collection.forEach((person, i) => {
      person.index = i;  
    });
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) return;
    return this.collection[this.getIndex(person)];
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) return;

    let existingId = this.getIndex(person);

    if (existingId < 0) {
      this.add(person);
    } else {
      this.collection[existingId] = {...person, index: this.getIndex(person)};
    }
  },
}

people.add(me, friend, mother, father);

newLine();
people.rollCall();

let newPerson = {
  firstName: 'Jane',
  lastName: 'Doe'
};

people.add(newPerson);

newLine();
people.rollCall();

people.remove(newPerson);

newLine();
people.rollCall(); // Jane Doe is removed

people.remove({firstName: 'Andy', lastName: 'Warhol'}); // Does not exist

people.remove(['Bob', 'Marley']); // Wrong data type
people.add(['Bob', 'Marley']); // Wrong data type

let billy = people.get({firstName: 'Billy', lastName: 'Bob'});
newLine();
console.log(billy);

people.update({firstName: 'Andy', lastName: 'Warhol'});
newLine();
people.rollCall();

people.update({...me, occupation: 'Welder', relationship: 'Single'});
let newMe = people.get(me);
newLine();
console.log(newMe);

console.log(people.collection);
