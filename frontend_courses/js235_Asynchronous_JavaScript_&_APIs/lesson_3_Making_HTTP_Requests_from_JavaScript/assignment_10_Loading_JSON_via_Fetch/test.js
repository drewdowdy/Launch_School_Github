(async function fetchFromGH() {
  let response = await fetch('https://api.github.com/repos/rails/rails');
  let json = await response.json();
  console.log(json);
})();
