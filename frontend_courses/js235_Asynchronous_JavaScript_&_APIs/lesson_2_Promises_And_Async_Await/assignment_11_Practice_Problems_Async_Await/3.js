// Write a getReady function that utilizes at least three asynchronous functions that you write to simulate getting ready in the morning. Each task should take time and not begin until the task before has been completed. getReady should utilize async / await.

function petCat() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Petting cat...');
    }, 5000);
  });
}

function getDressed() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Getting dressed...');
    }, 3000);
  });
}

function brushTeeth() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Brushing teeth...');
    }, 2000);
  });
}

async function getReady() {
  console.log('Good morning!');

  console.log(await petCat());
  console.log(await getDressed());
  console.log(await brushTeeth());

  console.log("I'm ready!");
}

getReady();
// Good morning!
// Petting cat...
// Getting dressed... (5 seconds later)
// Brushing teeth...  (3 seconds later)
// I'm ready!         (2 seconds later)
