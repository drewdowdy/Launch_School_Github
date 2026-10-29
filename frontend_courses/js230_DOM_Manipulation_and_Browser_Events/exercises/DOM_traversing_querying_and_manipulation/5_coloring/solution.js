/*
Write a function that colors a specific generation of the DOM tree. A generation is a set of elements that are on the same level of indentation. We'll be using a "styled" HTML for this exercise to better visualize the generations. You may use the .generation-color class to color the specific generation. You can assume that only non-negative integers will be provided as arguments.
*/

function getGeneration(genNumber) {
  if (genNumber < 1) return [];

  let generation = Array.from(document.body.children);

  for (let i = 1; i < genNumber; i++) {
    generation = generation.flatMap(element => {
      return Array.from(element.children);
    })
  }

  return generation;
}

function colorize(elements) {
  elements.forEach(({ classList }) => {
    classList.add('generation-color');
  })
}

function colorGeneration(genNumber) {
  let generationElements = Array.from(getGeneration(genNumber));

  colorize(generationElements);
}

colorGeneration(1);
colorGeneration(2);
colorGeneration(3);
colorGeneration(4);
colorGeneration(5);
colorGeneration(6);
colorGeneration(7);
colorGeneration(8);
colorGeneration(0);
colorGeneration(100);


