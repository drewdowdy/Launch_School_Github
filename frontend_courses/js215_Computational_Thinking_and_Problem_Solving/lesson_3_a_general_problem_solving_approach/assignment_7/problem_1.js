/*
A distinct string is a string that is present only once in an array.

Given an array of strings, arr, and an integer, k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty string "".

Note that the result string is the one encountered earliest in the array.

-----

PDBAD 

=== PROBLEM ===

Write a function that given an array of strings (arr) and a number (k) returns the 'k'th element that is distinct from arr

Rules:
- if the number of distinct strings is less than 'k', return an empty string ""
- the result string is the earliest

Questions:
- are the strings always one character long?
- what is the output of a negative 'k'? (null? empty string?)
- what is the output of an empty array? (maybe also an empty string)
- how to handle 'k' that is 0?
*/

distinctString(["d","b","c","b","c","a"], 2); // "a"
