/*
TODOS:
✅ move h1 "My Site" to nav header
✅ move nav header to top of body
✅ switch the captions for the 2 figures
✅ put the two figure elements inside article after p
*/

// move h1 to header and header to top of body
let h1 = document.querySelector('main > h1'); 
let header = document.querySelector('body > header');

header.insertAdjacentElement('afterbegin', h1);

// move header to top of body
document.body.insertAdjacentElement('afterbegin', header);

// switch captions
let [ mopFig, chinFig ] = document.querySelectorAll('figure');

let chinCaption = mopFig.querySelector('figcaption');
let mopCaption = chinFig.querySelector('figcaption');

mopFig.insertAdjacentElement('beforeend', mopCaption);
chinFig.insertAdjacentElement('beforeend', chinCaption);

// move figures inside article
let article = document.querySelector('section > article');

article.insertAdjacentElement('beforeend', mopFig);
article.insertAdjacentElement('beforeend', chinFig);
