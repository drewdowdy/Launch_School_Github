# Equivalance

## `#==` Method

Determines if **two objects have the same value**.

```ruby
str1 = 'something'
str2 = 'something'
str3 = 'something else'

str1 == str2    # true
str2 == str3    # false

int1 = 1
int2 = 1
int3 = 2

int1 == int2    # true
int2 == int3    #false

sym1 = :something
sym2 = :something
sym3 = :something_else

sym1 == sym2    # => true
sym2 == sym3    # => false
```

## `#object_id` Method

Returns a numerical value that uniquely identifies an object stored in memory. Can be used to **determine if two variables are pointing to the same object**.

```ruby
obj1 = 'this is a string'
obj2 = 'this is a string'
obj3 = obj1

obj1.object_id    # 15980
obj2.object_id    # 21880
obj3.object_id    # 15980

# obj1 and obj3 have the same id, meaning the reference the same object
```

## `#===` Method

This is most often used in a `case` statement.

Determines if **two objects belong in the same group**.

```ruby

String === 'this is a string'     # true
String === 1                      # false

(1..10) === 5                     # true
(1..10) === 11                    # false

```

## `#eql?` Method

Most often used by `Hash` to determine equality among members.

Determines if **two objects contain the same value** and if they're **of the same class**.

> Seems like a mix of `#==` and `===`
