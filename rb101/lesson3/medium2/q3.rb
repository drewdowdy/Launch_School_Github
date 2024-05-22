def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}" # => "pumpkins"
puts "String_arg_two looks like this now: #{string_arg_two}" # => "pumpkinsrutabaga"

# String#+= is reassignment and creates a new object
# String#<< mutates the calling object
