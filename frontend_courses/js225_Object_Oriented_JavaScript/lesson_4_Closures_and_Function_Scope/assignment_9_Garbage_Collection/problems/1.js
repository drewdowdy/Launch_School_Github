// In the following code, when can JavaScript garbage collect each of the following arrays? [1], [2], and [1, 2].

let a = [1];

function add(b) {
  a = a.concat(b);
}

function run() {
  let c = [2];
  let d = add(c);
}

run();

/*
Answer:

[1] --> after add() invocation in run()
[2] --> after run() invocation
[1, 2] --> after entire program finishes execution
*/
