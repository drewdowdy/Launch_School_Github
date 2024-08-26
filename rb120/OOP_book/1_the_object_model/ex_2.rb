=begin
Exercise 2: What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

1. A module is a collection of behaviors (or operations) that can be used by other classes.
2. A module allows us to reuse code over and over.
3. Modules can be mixed into a class using a mixin like the #include method.

=end

module Study
end

class MyClass
  include Study
end

my_obj = MyClass.new
