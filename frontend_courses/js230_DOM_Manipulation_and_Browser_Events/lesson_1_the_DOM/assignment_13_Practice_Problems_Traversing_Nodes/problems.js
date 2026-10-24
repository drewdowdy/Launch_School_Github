// 1. Write some JavaScript code to retrieve a word count for each h2 heading on the page.

let h2Elements = document.getElementsByTagName('h2');
let h2WordCounts = [...h2Elements].map(e => e.textContent.split(' ').length);
console.log(h2WordCounts);

// 2. The page has a table of contents with the title "Contents" and links to the different content sections on "Naming and etymology," "Taxonomy and evolution," etc. Use three different DOM methods to retrieve a reference to the div element that contains the table of contents.

let tableOfContents1 = document.getElementById('toc');
let tableOfContents2 = document.querySelector('#toc');
let tableOfContents3 = document.querySelectorAll('.toc')[0];

// 3. Write some JavaScript code to change the color for every odd indexed link in the table of contents to green.

let links = document.getElementsByTagName('a');

for (let i = 1; i < links.length; i += 2) {
  links[i].style.color = 'green';
}

// 4. Write some JavaScript code to retrieve the text of every thumbnail caption on the page.

let captions = document.getElementsByClassName('thumbcaption');
let captionsText = [...captions].map(e => e.textContent.trim());

// 5. Write JavaScript code that extracts the classification of animals from the web page and logs an Object that uses the ranks as keys and the groups as values. You may assume the taxonomic ranks to use as keys are provided for you as an array.

let keys = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];
let classification = {};
let tds = document.querySelector('.infobox td');

for (let index = 0; index < tds.length; index += 1) {
  cell = tds[index];

  keys.forEach(key => {
    if (cell.textContent.indexOf(key) !== -1) {
      link = cell.nextElementSibling.firstElementChild;
      classification[key] = link.textContent;
    }
  });
}

console.log(classification);


