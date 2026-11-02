// Note: This is not how real servers work! We're pretending server.js is a server, but it's actually running in the browser to make fetchUserProfile available. This lets us practice the basics without the overhead of setting up a server.

const users = {
  1234: { name: 'Aisha Patel', age: 29 },
  5678: { name: 'John Smith', age: 35 },
  9101: { name: 'Susan Green', age: 42 },
};

function fetchUserProfile(id, callback) {
  setTimeout(() => {
    let userData = users[id];
    if (userData) {
      callback(null, userData);
    } else {
      callback('User not found', null);
    }
  }, 2000);
}
