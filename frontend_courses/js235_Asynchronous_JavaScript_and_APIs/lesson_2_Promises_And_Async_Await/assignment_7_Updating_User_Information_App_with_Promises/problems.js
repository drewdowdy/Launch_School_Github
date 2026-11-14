// Begin by updating the authenticate and fetchUserProfile functions to return promises instead of invoking callbacks. This will break our form, so make sure your implementation works by testing out these functions in the browser's console. Remember to consider that our functions are supposed to fail 10% of the time.

function authenticate(username, password) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 0.1) {
        return reject(new Error('Something went wrong. Please try again'));
      }

      if (passwords[username] && passwords[username].password === password) {
        return resolve(passwords[username].id);
      } else {
        return reject(new Error('Invalid username or password'));
      }
    }, 1000)
  })
}

function fetchUserProfile(id) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 0.1) {
        return reject(new Error('Something went wrong. Please try again later.'));
      }

      let userData = users[id];
      if (userData) {
        return resolve(userData);
      } else {
        return reject(new Error('User not found'));
      }
    }, 2000);
  })
}

// Now that our server is working as expected, we must update our client-side code. Let's work from the bottom up and start with our basic functionality without worrying about retrying failed tasks. Update the form submission handler to use our new authenticate and fetchUserProfile functions.
document.getElementById('userForm').addEventListener('submit', function (event) {
  event.preventDefault();

  const userInfoDiv = document.getElementById('userInfo');
  const errorMessageDiv = document.getElementById('errorMessage');

  userInfoDiv.textContent = '';
  errorMessageDiv.textContent = '';

  const username = document.getElementById('usernameInput').value.trim();
  const password = document.getElementById('passwordInput').value.trim();

  authenticate(username, password)
    .then((userId) => {
      userInfoDiv.textContent = 'Login successful! Fetching your data...';
      return fetchUserProfile(userId);
    })
    .then((userData) => {
      userInfoDiv.textContent = `Hello, ${userData.name}! You are ${userData.age} years old.`;
    })
    .catch((error) => {
      errorMessageDiv.textContent = `Error: ${error.message}`;
      errorMessageDiv.style.display = 'block';
    })
});

// Next, let's implement the functionality to retry the calls to our server if they fail. Again, let's write a retryNTimes, but this time with promises.

function retryNTimes(fn, retryNum, ...args) {
  let attempts = 0;

  function attempt() {
    console.log(`Attempt number: ${attempts + 1}`);
    return fn(...args)
      .then(data => data)
      .catch(error => {
        if (attempts >= retryNum) {
          return Promise.reject(error);
        }
        attempts++;
        return attempt();
      });
  }
    
  attempt();
}

// Finally, we can use retryNTimes to retry after a failed attempt twice before giving up. Remember, we want to retry failed attempts for authenticate and fetchUserProfile.

retryNTimes(authenticate, 2, username, password)
  .then((userId) => {
    userInfoDiv.textContent = 'Login Successful! Fetching your data...';
    return retryNTimes(fetchUserProfile, 2, userId);
  })
  .then(userData => {
    userInfoDiv.textContent = `Hello, ${userData.name}!\nYou are ${userData.age} years old!`;
  })
  .catch(error => {
    errorMessageDiv.textContent = `Error: ${error.message}`;
    errorMessageDiv.style.display = 'block';
  });
