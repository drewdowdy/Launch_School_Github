// When learning about promises, We wrote a flakyService function and used then and catch to manage its result. Now, rewrite the code that calls flakyService to use async / await instead. Don't change the flakyService function itself.

function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

async function useFlakyService() {
  try {
    let data = await flakyService();
    console.log(data);
  } catch(error) {
    console.error(error);
  }
}

useFlakyService();

