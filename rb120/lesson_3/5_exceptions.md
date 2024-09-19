# Exceptions

Medium Article: [Getting Started with Ruby Exceptions](https://launchschool.medium.com/getting-started-with-ruby-exceptions-d6318975b8d1)

## Exception Class Hierarchy

```
Exception
  NoMemoryError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SecurityError
  SignalException
    Interrupt
  StandardError
    ArgumentError
      UncaughtThrowError
    EncodingError
    FiberError
    IOError
      EOFError
    IndexError
      KeyError
      StopIteration
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RegexpError
    RuntimeError
    SystemCallError
      Errno::*
    ThreadError
    TypeError
    ZeroDivisionError
  SystemExit
  SystemStackError
  fatal
```

Common Examples:

- Exiting a program with `ctrl-c` raises an exception from the `Interrupt` class.
- When code is written in the wrong syntax (eg. forgetting `end` after `def`) raises an exception from the `SyntaxError` class.
- In the cae of stack overflow, an exception from `ystemStackError` is raised.
- `StandardError` has many familiar decendants like `ArgumentError`, `TypeError`, `ZeroDivisionError`, `NoMethodError`.

## When to handle exceptions?

Don't handle errors like `NoMemoryError`, `SyntaxError` or `LoadError`. These errors are important and should allow our program to crash.

When handling, be very specific and intentional.

## How to handle exceptions

### `begin`/`rescue` Block

We can take different actions depending on the type of error.

```ruby
begin
  # some code at risk of failing
rescue TypeError
  # take action
rescue ArgumentError
  # take a different action
end
```

We can also take the same action for multiple types of errors.

```ruby
begin
  # some code at risk of failing
rescue ZeroDivisionError, TypeError
  # take action
end
```

## Exception Objects and Built-In Methods

We can store objects in variables with this syntax:

```ruby
rescue TypeError => e
```

Since these are objects, we can call other methods on them.

```ruby
begin
  # code at risk of failing here
rescue StandardError => e   # storing the exception object in e
  puts e.message            # output error message
end

e.class   #=> TypeError
```

## `ensure`

We can also include a `ensure` clause after the last `rescue` clause. The `ensure` clause will alwasy execute, even if an exception is raised. This is useful for resource management.

```ruby
file = open(file_name, 'w')

begin
  # do something with file
rescue
  # handle exception
rescue
  # handle a different exception
ensure
  file.close  # executes every time
end
```

## `retry`

We can include `retry` word in a block. It redirects the program back to the `begin` statement. But be careful of infinite loops.

```ruby
RETRY_LIMIT = 5
begin
  attempts = attempts || 0
  # do something
rescue
  attempts += 1
  retry if attempts < RETRY_LIMIT
end
```

## Raising Exceptions Manually

We can raise exceptions ourself with `Kernel#raise`.

```ruby
# Type 1
raise TypeError.new("Something went wrong!")
# Type 2
raise TypeError, "Something went wrong!"
```

Example:

```ruby
def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end
```

Exceptions raised manually can be handled in the same way as other exceptions.

```ruby
begin
  validate_age(age)
rescue RuntimeError => e
  puts e.message    #=> "invalid age"
end
```

## Raising Custom Exceptions

We can create our own exception classes.

```ruby
class ValidateAgeError < StandardError; end
```

In the above example, the `ValidateAgeError` inherits all the functionality and built-in behaviors of the `StandardError` class. Inheriting from `StandardError` class is most common.

> Note: Avoid masking exceptions from the `Exception` class itself or at the system level.
