/*
Write a function that will take a short line of text, and write it to the console log within a box.
*/


const generateBorder = (width) => '+-' + '-'.repeat(width - 4) + '-+';
const generateEmptyLine = (width) => '|' + ' '.repeat(width - 2) + '|';

function logInBox(text) {
  let boxWidth = text.length + 4 // 2 for ' ', 2 for '|'

  let borderLine = generateBorder(boxWidth);
  let emptyLine = generateEmptyLine(boxWidth);
  let textLine = `| ${text} |`;

  console.log(borderLine);
  console.log(emptyLine);
  console.log(textLine);
  console.log(emptyLine);
  console.log(borderLine);
}

/*
Further Exploration

Modify this function so that it truncates the message if it doesn't fit inside a maximum width provided as a second argument (the width is the width of the box itself). You may assume no maximum if the second argument is omitted. For a real challenge, try word wrapping messages that are too long to fit, so that they appear on multiple lines but are still contained within the box.

=== BRAINSTORM ===

how to wrap text?

slice?
*/

function generateTextLines(text, width) {
  let textWidth = width - 4; 
  let lines = [];

  for (let i = 0; i < text.length; i += textWidth + 1) {
    let line = `| ${text.slice(i, i + textWidth)} |`

    if (line.length < width) {
      line = `| ${text.slice(i, i + textWidth) + ' '.repeat(width - line.length)} |`
    }

    lines.push(line);
  }

  return lines;
}

function logInBox(text, max) {
  let boxWidth;

  if (max === undefined) {
    boxWidth = text.length + 4;
  } else {
    boxWidth = max;
  }

  let borderLine = generateBorder(boxWidth);
  let emptyLine = generateEmptyLine(boxWidth);
  let textLines = generateTextLines(text, boxWidth);

  console.log(borderLine);
  console.log(emptyLine);

  textLines.forEach((line) =>
    console.log(line)
  );

  console.log(emptyLine);
  console.log(borderLine);
}

logInBox('To boldly go where no one has gone before.');
/*
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
*/

logInBox('');
/*
+--+
|  |
|  |
|  |
+--+
*/

logInBox('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate', 50);
/*
+------------------------------------------------+
|                                                |
| Lorem ipsum dolor sit amet, consectetuer adipi |
| scing elit. Aenean commodo ligula eget dolor.  |
| Aenean massa. Cum sociis natoque penatibus et  |
| magnis dis parturient montes, nascetur ridicul |
| us mus. Donec quam felis, ultricies nec, pelle |
| ntesque eu, pretium quis, sem. Nulla consequat |
|  massa quis enim. Donec pede justo, fringilla  |
| vel, aliquet nec, vulputate                    |
|                                                |
+------------------------------------------------+
*/


