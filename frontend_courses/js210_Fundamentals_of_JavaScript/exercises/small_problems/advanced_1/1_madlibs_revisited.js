// Let's build another program using madlibs. We made a similar program in the Easy exercises, but this time the requirements are a bit different.

// Build a madlibs program that takes a text template as input, plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text, and then returns it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program. Your program should read this text and, for each line, place random words of the appropriate types into the text and return the result.

// The challenge of this program isn't just about writing your solution—it's about choosing the structure of the text template. Choose the right way to structure your template and this problem becomes much easier. Consequently, this exercise is a bit more open-ended since the input is also something that you'll be defining.

const PARTS_OF_SPEECH = {
  adjective: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
  noun: ['fox', 'dog', 'head', 'leg', 'tail', 'cat'],
  verb: ['jumps', 'lifts', 'bites', 'licks', 'pats'],
  adverb: ['easily', 'lazily', 'noisily', 'excitedly'],
}

function randomInt(min, max) {
  return Math.floor((Math.random() * (max - min)) + min);
}

function madlibs(template) {
  return template.replace(/\${[a-z]+}/gi, (match) => {
    cleanMatch = match.replace(/[\${}]/g, '');
    let index = randomInt(0, PARTS_OF_SPEECH[cleanMatch].length);

    return PARTS_OF_SPEECH[cleanMatch][index];
  });
}

let template1 = "The ${adjective} brown ${noun} ${adverb} ${verb} the ${adjective} yellow ${noun}, who ${adverb} ${verb} his ${noun} and looks around."

let template2 = "The ${noun} ${verb} the ${noun}'s ${noun}."

console.log(madlibs(template1));
// The "sleepy" brown "cat" "noisily"
// "licks" the "sleepy" yellow
// "dog", who "lazily" "licks" his
// "tail" and looks around.

console.log(madlibs(template1));
// The "hungry" brown "cat" "lazily"
// "licks" the "noisy" yellow
// "dog", who "lazily" "licks" his
// "leg" and looks around.

console.log(madlibs(template2));      // The "fox" "bites" the "dog"'s "tail".

console.log(madlibs(template2));      // The "cat" "pats" the "cat"'s "head".
