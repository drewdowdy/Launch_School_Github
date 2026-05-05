/*
While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

- If version1 > version2, we should return 1.
- If version1 < version2, we should return -1.
- If version1 === version2, we should return 0.

Here is an example of version number ordering:

0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

-----

PDBAD

=== PROBLEM ===

Write a function that compares version numbers. It should:
  - return 1 if version1 is greater than version2
  - return -1 if version1 is less than version2
  - return 0 if both inputs are the same

Rules:
- versions with following zeros are the same
  - 2 = 2.0 = 2.0.0 = 2.0.0.0
- valid versions only contain digits and periods `.`
- version1 is considered greater if its subgroup at the same spot as version2 is greater
- compare rule:
  - reading the subgroups left to right, at the spot where the subgroups first differ, compare the numbers

Questions:
- are the inputs strings? (don't think you can create numbers with so many decimals)
  - A: Yes
- is the maximum number of subgroups 4 like in the examples?
  - A: No, could be more
- are versions only positive numbers?
  - A: Yes

=== DATA ===

input: two version numbers represented as strings
intermediate:
  - an array of subgroups (split)
  - a number of the index to iterate through two arrays at the same time
  - a regex to validate version inputs
output:
  - 1 if the first input is greater
  - -1 if the first input is less
  - 0 if both inputs are the same

=== BRAINSTORM ===

1. validate inputs
  - regex: only digits and `.`
  - `.` is optional (not all versions have one)
  - will always have digits
  - /\d+(\.\d+)*$/ 
    - 1 or more digits followed by 0 or more groups of `.` followed by 1 or more digits (must end with that group)
2. split both versions into subgroups
  - break apart at the `.` (split)
  - change them all into numbers (map)
3. determine the shortest array 
4. iterate through both arrays of subgroups at the same time
  - only need to iterate over the shortest array
  - if subgroup is the same
    - continue
  - if subgroup differs:
    - compare the numbers and return -1, 0, or 1

=== ALGORITHM ===

- if either of the inputs are invalid
  - return null
- split the versions into subgroups
  - split them over any period `.` (split)
  - and transform the subgroups into Numbers (map)
- determine the shortest array's length
- initialize `i` to 0 for the index.
  - for (i; i < short; i += 1)
    - if v1[i] !== v2[i]
      - return the comparison of their subgroup

=== DEBUG ===

- does not work if digits are all the same
  - ie. 1.1.1 > 1.1
  - need to make both versions the same length
    - (1.1.1, 1.1) --> (1.1.1, 1.1.0)
    - (2.3, 4.6.7.9) --> (2.3.0.0, 4.6.7.9)

how to normalize them both
  - use the groups array
  - determine the differnece in length
  - for every differnece in length, add a 0 to the shorter array
  - return an array of the normalized values
*/

// helper functions
function validVersion(version) {
  return /^\d+(\.{1,1}\d+)*$/g.test(version);
}

function normalize(subgroups1, subgroups2) {
  let [ shorter, longer ] = subgroups1.length < subgroups2.length ? [subgroups1, subgroups2] : [subgroups2, subgroups1];
  let difference = longer.length - shorter.length;

  for (let counter = 1; counter <= difference; counter += 1) {
    shorter.push(0);
  }

  return [subgroups1, subgroups2];
}

// main function
function compareVersions(version1, version2) {
  if (!validVersion(version1) || !validVersion(version2)) return null;

  let v1Groups = version1.split('.').map(g => parseInt(g, 10));
  let v2Groups = version2.split('.').map(g => parseInt(g, 10));

  [ v1Groups, v2Groups ] = normalize(v1Groups, v2Groups);

  for (let i = 0; i < v1Groups.length; i += 1) {
    if (v1Groups[i] !== v2Groups[i]) {
      let [ group1, group2 ] = [v1Groups[i], v2Groups[i]];
      
      if (group1 < group2) {
        return -1;
      } else if (group1 > group2) {
        return 1;
      }
    }
  }

  return 0; // must be equal if we never found two differing subgroups
}

// given examples
console.log(compareVersions('0.1', '1') === -1);
console.log(compareVersions('1', '1.0') === 0);
console.log(compareVersions('1.0', '1.1') === -1);
console.log(compareVersions('1.1', '1.2') === -1);
console.log(compareVersions('1.2', '1.2.0.0') === 0);
console.log(compareVersions('1.2.0.0', '1.18.2') === -1);
console.log(compareVersions('1.18.2', '13.37') === -1);

// edge cases
console.log(compareVersions('1.18.a', '13.37') === null);
console.log(compareVersions('1..2.3', '1.2.3') === null);
console.log(compareVersions('1.1.1', '1.1') === 1);
console.log(compareVersions('1.23', '12.3') === -1);
