# Fake Operators

## Fake vs Real

Since "fake operators" are really methods, they call all alternately be called with the method resolution operator `.`, like `ob1.name(obj2)`.

```
Regular          Method Style
-------          ------------
arr[1]           arr.[](1)
arr[1] = 'a'     arr.[]=(1, 'a')
5**2             5.**(2)
2 + 3            2.+@(3)
4 - 2            4.-@(2)
[1, 2] << 3      [1, 2].<<(3)
!true            (true).!
3 * 4            3.*(4)
4 / 2            4./(2)
7 % 6            7.%(6)
5 <= 10          5.<=(10)
5 < 10           5.<(10)
5 > 10           5.>(10)
5 >= 10          5.>=(10)
6 <=> 7          6.<=>(7)
'a' == 'a'       'a'.==('a')
(1..10) === 5    (1..10).===(5) 
true != false    true.!=(false)
```

| Fake Operators | Description |
|-|-|
| `[]`, `[]=` | Collection element getter/setter |
| `**` | Exponential operator |
| `!`, `~`, `+`, `-` | Not, complement, unary plus, unary minus (`+@` and `-@`) |
| `*`, `/`, `%` | Multiply, divide, modulo |
| `+`, `-` | Plus, minus |
| `>>`, `<<` | Right/left shift |
| `&` | Bitwise "and" |
| `^`, `\|` | Bitwise exclusice "or", regular "or" (inclusive "or") |
| `<=`, `<`, `>`, `>=` | Less than/equal to, less than, greater than, greater than/equal to |
| `<=>`, `==`, `===`, `!=`, `=~`, `!~` | Equality and pattern matching |

These are the **real** operators.

| Real Operators | Description |
|-|-|
| `.`, `::` | Method/contant resolution operators |
| `&&` | Logical "and" |
| `\|\|` | Logical "or" |
| `..`, `...` | Inclusive/exclusive range |
| `? :` | Ternary if-then-else |
| `=,` `%=`, `/=`, `-=`, `+=`, `\|=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `\|\|=`, `**=`, `{` | Assignment (shortcuts) and block delimiter |

## Equality Methods

If you define your own `#==`, you get a `#!=` method automatically.

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other_person)
    @name == other_person.name
  end
end

bob = Person.new('Robert')
bobby = Person.new('Robert')

bob == bobby # => true
bob != bobby # => false 

# `#!=` is not explicitly defined, but usable
```

## Comparison Methods

We can define our own `#>` or `#<` methods to make our code more intuitive. 

> Note: when you define either `#>` or `#<`, you **DON'T** get the other for free!!

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

puts "bob is older than kim" if bob > kim
```

## Shift Methods

The shovel operator `#<<` is in fact a method from the array class `Array#<<`. 

## The Plus Method

If we redefine the `#+` method, we should either increment or concatinate, returning the same class of object.

## Getter and Setter Methods

If we redefine getter and setter methods `#[]` and `#[]=`, we should ensure that our class is some kind of collection.

## Example

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
dream_team.name = "Dream Team"

dream_team[4]
dream_team[5] = Person.new("JJ", 72)

puts dream_team.inspect

=begin
=> #<Team:0x00000001007bd2b0 
    @name="Dream Team",
    @members=[
     #<Person:0x00000001032b4d88 @name="Troy Aikman",@age=48>,
     #<Person:0x00000001032b34d8 @name="Emmitt Smith", @age=46>,
     #<Person:0x00000001032b0918 @name="Michael Irvin", @age=49>,
     #<Person:0x00000001007bdee0 @name="Joe Montana", @age=59>,
     #<Person:0x00000001007bdc60 @name="Jerry Rice", @age=52>,
     #<Person:0x00000001007bc9a0 @name="JJ", @age=72>
    ]>
=end
```

## Takeaway

If you redefine any fake operators, define them in such a way that is predictable and intuitive to understand.
