/*
The intention of the program below is to output a paragraph. Copy and paste the program into a JavaScript console (e.g., from the Chrome Developer Tools), then run it. Is the output what you expected? Are there any bugs/errors?
*/

const paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

console.log(paragraph); // SyntaxError: Invalid or unexpected token

/*
On line 9, there are whitespaces after the backslash (\).

The backslash (\) within a string escapes the newline (\n) character, allowing the string to continue as if it were on the same line.

But since there is whitespace after the escaped newline, an error is raised. 

Additionally, the extra white spaces at the start of most of the lines (used for allignment), get counted as part of the string.
*/
