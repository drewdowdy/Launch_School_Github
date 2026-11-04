## Problem 1

- [x] Done

We've decided that instead of letting anyone with a valid ID fetch a user profile, we should ask users for a username and password. Update the HTML form to have two input boxes, one for their username and one for their password.

## Problem 2

- [x] Done

Now, update the submit event handler to retrieve the input values and make a call to authenticate. Once you receive a response about the authentication status, display a message saying whether or not the login was successful.

## Problem 3

- [ ] Done

Now, we need to do something we haven't done before. We need to handle two asynchronous operations, but unlike washing laundry and baking cookies, we can't perform them simultaneously. We need to first authenticate our user, and only upon getting a successful response can we fetch their data. We definitely don't want to fetch a user's data if they've not provided the correct username and password.

Update your event handler so that we first authenticate the user. If successful, call fetchUserProfile and render the data. Now, if a user doesn't enter the correct password, we should display the error message, and we're finished. If they log in successfully, we should display "Login Successful! Fetching your profile..." as a temporary message while we wait for their profile data to be retrieved. Once we get their profile from the server, clear our "fetching" message and display their profile information or the error message if something went wrong.

## Problem 4

- [ ] Done

🔥 Challenging Exercise 🔥 Our code works well most of the time. It's time to address our unreliable server. If our authentication or fetching the user profile fails due to a server error, let's automatically retry twice before showing an error message.

Since authentication could fail for either of our callbacks, let's start by writing a helper function that will keep track of the number of attempts and retry the call a certain number of times.

Now, let's use retryNTimes to automatically retry our calls to the server to avoid showing the user server errors. To test your code, try raising the failure rate on the server. You can replace Math.random() < 0.1 with a higher number to do so. Anything 1 or greater will always fail.

