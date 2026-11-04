// Extend the code from the previous problem with a stopCounting function that stops the logger when called.

let counterId;

function startCounting() {
  let num = 0;

  let counterId = setInterval(() => {
    num += 1;
    console.log(num);
  }, 1000);
}

function stopCounting(id) {
  clearInterval(id);
}

startCounting();
stopCounting(counterId);
