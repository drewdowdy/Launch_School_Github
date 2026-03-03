// In the following code, a user creates a person object literal and defines two methods for returning the person's first and last names. What is the result when the user tries out the code on the last line?

const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`);
/*
Initial Idea: An error is raised becasue we need parentheses () after a method invocation. Here, we are trying to access properties of person with dot notation, but no such properties exist.

Correct Answer: Without parentheses () to invoke a method, JS returns a string literal of the function
*/
