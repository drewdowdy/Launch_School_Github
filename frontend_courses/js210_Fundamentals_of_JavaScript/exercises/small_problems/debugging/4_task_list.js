/*
We were asked to implement a task list and the following functionality:

- adding a new task
- completing a given number of existing tasks
- displaying the task list

We decided to keep things simple and model the tasks as strings. Completing a task for us simply means deleting the string from the array of tasks.

Experimenting with our code reveals that it doesn't work exactly as we expected. Find the problem and fix it.
*/

const todos = ['wash car', 'exercise', 'buy groceries', 'balance budget',
             'call plumber', 'feed fido', 'get gas',  'organize closet'];

function addTask(task) {
  if (todos.includes(task)) {
    console.log('That task is already on the list.');
  } else {
    todos.push(task);
  }
}

function completeTasks(n = 1) {
  let tasksComplete = 0;

  while (todos.length > 0 && tasksComplete < n) {
    // console.log(`${todos[0]} complete!`); // only logs the first todo
    // delete todos[0]; // only deletes first todo

    console.log(`${todos[tasksComplete]} complete!`); // logs current task
    delete todos[tasksComplete]; // removes current task

    tasksComplete++;
  }

  todos.splice(0, tasksComplete); // adjust todo list

  if (todos.length === 0) {
    console.log('All tasks complete!');
  } else {
    console.log(`${tasksComplete} tasks completed; ${todos.length} remaining.`);
  }
}

function displayTaskList() {
  console.log(`ToDo list (${todos.length} tasks):`)
  console.log('---------------------');

  for (let i = 0; i < todos.length; i++) {
    console.log(`-- ${todos[i]}`);
  }
}

// Utilizing our task manager

addTask('oil change');
addTask('dentist');
addTask('homework');

completeTasks(3);
displayTaskList();

// within the while loop of completeTast(), the code only ever logs and removes the item at index 0. The tasksComplete variable can be used to track which task is being completed.
// Additionally, removing items with delete left gaps in the todos array. So after the while loop finishes, the gaps need to be removed. And since the todo array is a constant, we can't reassign its value so it has to be mutated. So we can use splice() to remove the empty items at the start of the array.

// We can use a much simpler way too:

  while (todos.length > 0 && tasksComplete < n) {
    console.log(`${todos[0]} complete!`); // log the first task
    todos.shift(); // remove the first task and mutate todos
    tasksComplete++;
  }

