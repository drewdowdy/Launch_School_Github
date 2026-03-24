if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  }
} else {
  // ...
  if (condition4) {
    // ...
    if (condition5) {
    // ...
    }
  }
}

/*
Q: One of the ways to manage the flow of a program is through the use of conditionals. Go over the code below and specify how many unique execution paths are possible.

~~~

A: 

Path 1: condition1 --> condition2
Path 2: condition1 --> NOT condition2
Path 3: NOT condition1
Path 4: NOT condition1 --> condition4
Path 5: NOT condition1 --> condition4 --> condition5
*/
