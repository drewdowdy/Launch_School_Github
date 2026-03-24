# Group 1
puts "Group 1"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
puts ''

# Group 2
puts "Group 2"
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call 
  # => wrong number of arguments (given 0, expected 1) (ArgumentError)
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } 
  # => uninitialized constant Lambda (NameError)
puts ''

# Group 3
puts "Group 3"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')
  # => no block given (yield) (LocalJumpError)
puts ''

# Group 4
puts 'Group 4'
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}
  # => undefined local variable or method `animal' for main:Object (NameError)

=begin

=== OBSERVATIONS ===

Group 1 (Procs):
  - my_proc can use the #call method
  - if no argument is passed to proc when #call is invoked, `nil` is used
  - my_proc is an instance of the Proc class

Group 2 (Lambdas):
  - lambdas are instances of the Proc class
  - Lambda.new is NOT a valid way to create a lambda
  - if the wrong number of arguments is given to a lambda, an error is thrown

Group 3 (Blocks w/out passing): 
  - if a method has 'yield' w/out passing anything to the block, `nil` is used
  - if a method has 'yield' and no block is given at all, a LocalJump error is thrown

Group 4 (Blocks w/ passing):
  - if 'yield' passes too few parameters, `nil` will be used
  - if no parameter is specified by pipes, then the passed object can't be passed into the block

=== ANALYSIS ===



=end
