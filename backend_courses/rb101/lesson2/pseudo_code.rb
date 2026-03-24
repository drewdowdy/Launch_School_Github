1) a method that returns the sum of two integers

>>Casual:
Given that there are two variables with values that are integers
Define a method that:
 -Takes the number of the first variable and adds it to the second
 -Returns the sum of those numbers

 >>Formal:
START
SET variable1 = some number
SET variable2 = a different number
DEF a method 'sum'
  result = variable1 added to variable2
  RETURN result
END

2) a method that takes an array of strings, and returns a string that is all those strings concatenated together

>>Casual:
Given there is an array of multiple strings
Define a method that:
  -Concatinates all of strings together into one string
  -Returns the new string of strings

>>Formal:
START
Given there is an array of multiple strings
DEF a method 'put_together'
  JOIN the original array with a space in between
END

3) a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. 

>>Casual:
Given there is an array of integers
Define a method that:
  - Selects every other element within the array (starting w/ the first)
  - Returs all selected elements into a new array

>>Formal:
START
Given an array of some integers
DEF a method 'every_other'
  SET an array 'every_other_number' = empty
    IF array index is even
      Put element into 'every_other_number' array  
    END
  RETURN 'every_other_number' array
END

4) a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

>>Casual:
Given a string
Define a method that:
  - Determines the index of the third instance of a given character
  - Returns nil if there are not three instances of a character

>>Formal:
START
Given a string
DEF a method 'third_instance'
  Find every occurance of some letter in the string
  Find every index of those occuances
  RETURN the index of the 3rd occurance
END

5) a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes.

>>Casual:
Given two arrays of numbers
Define a method that:
  -Merges the two arrays together
    -At the even indexes of the new array will be the elements of the first array
    -At the odd indexes of the new array will be the elements of the second array

>>Formal:
START
SET array1 = some numbers
SET array2 = some numbers
DEF a method 'merge'
  