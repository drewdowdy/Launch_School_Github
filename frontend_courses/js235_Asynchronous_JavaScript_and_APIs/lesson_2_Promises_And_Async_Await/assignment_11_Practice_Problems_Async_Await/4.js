// Expand upon the previous problem to demonstrate that async functions are non-blocking. Write another makeCoffee function that should start a pot of coffee before we start getting ready for the day. After some delay, we should signal that the coffee is ready.

function petCat() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Petting cat...');
    }, 2000);
  });
}

function getDressed() {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log('Getting dressed...');
      resolve();
    }, 2000);
  });
}

function brushTeeth() {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log('Brushing teeth...');
      resolve();
    }, 2000);
  });
}

async function startCoffee() {
  console.log('Starting coffee');
  await new Promise((resolve) => setTimeout(resolve, 4500));
  console.log('Coffee finished!');
}

async function getReady() {
  console.log('Good morning!');

  await petCat();
  await getDressed();
  await brushTeeth();

  console.log("I'm ready!");
}

startCoffee();
getReady();
