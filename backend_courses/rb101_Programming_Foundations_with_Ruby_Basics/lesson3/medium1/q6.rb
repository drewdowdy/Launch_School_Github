answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# => 34
  # when we print `answer - 8` it references the original value of answer
  # if we wanted to transform the variable, we should change to  `answer = mess_with_it(answer)`