// Create a new variable named nextWeek that is a new Date copied from the today object. Compare nextWeek and today, and log the results. Are they equal? Why or why not?

let today = new Date();

let nextWeek = new Date(today.getTime());

console.log(today === nextWeek);

/*
They aren't equal becuase they are created at different times. Lines of a program have to run one by one, so when `today` is created its time is slightly earlier than when `nextWeek` is created
*/
