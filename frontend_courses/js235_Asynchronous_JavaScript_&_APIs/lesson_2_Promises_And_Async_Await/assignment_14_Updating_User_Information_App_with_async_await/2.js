// Update the rest of our code to use async / await instead of promise chains. If it feels daunting, start by rolling back our use of retryNTimes and getting the basic functionality working, then add back in retryNTimes.

async function asyncRetryNTimes(fn, n, ...args) {
  let attempts = 0;

  while (attempts <= n) {
    try {
      console.log(`Attempt number: ${attempts + 1}`);
      return await fn(...args);
    } catch(error) {
      if (attempts >= n) {
        throw error;
      }
      attempts++;
    }
  }
}

// Handle form submission
document.getElementById('userForm').addEventListener('submit', function (event) {
  event.preventDefault();

  const userInfoDiv = document.getElementById('userInfo');
  const errorMessageDiv = document.getElementById('errorMessage');

  userInfoDiv.textContent = '';
  errorMessageDiv.textContent = '';

  const username = document.getElementById('usernameInput').value.trim();
  const password = document.getElementById('passwordInput').value.trim();

  async function authenticateAndFetchUserData(username, password) {
    try {
      const userId = await retryNTimes(authenticate, 2, username, password);
      userInfoDiv.textContent = 'Login Successful! Fetching your data...';

      const userData = await retryNTimes(fetchUserProfile, 2, userId);
      userInfoDiv.textContent = `Hello, ${userData.name}!\nYou are ${userData.age} years old!`;
    } catch(error) {
      errorMessageDiv.textContent = `Error: ${error.message}`;
      errorMessageDiv.style.display = 'block';
    }
  }

  authenticateAndFetchUserData();
});