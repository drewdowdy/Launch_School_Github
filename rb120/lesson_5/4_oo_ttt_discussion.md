# Things to Think About

- Testing is important.
- OOP allows us to make changes within the code without it affecting other parts.
- If we were to wrap our game into a library (gem) for others to use, we could use namespacing to prevent bleeding into the gloal namespace.

## `Struct`

A `Struct` object is like a mini-class. There are no behaviors (methods) in a `Struct`. Even though they don't have behaviors, you can modify their states.

```ruby
Pet = Struct.new('Pet', :kind, :name, :age)

asta = Pet.new('dog', 'Asta', 10)
cocoa = Pet.new('cat', 'Cocoa', 2)

p asta.age    # => 10
cocoa.age = 3
p cocoa.age   # => 3
```

The following is essentially the same as above:

```ruby
class Pet
  attr_accessor :kind, :name, :age
  def initialize(kind, name, age)
    @kind = kind
    @name = name
    @age = age
  end
end
```

- Keeping logic localized to certain classes is important. If too many classes collaborate with too many other classes, things can become complex quickly.
- In TTT, it might seem like a good idea to create a `Player.move` method. However, the `Player` class would then need to be aware of the `Board` class and the board would have to be passed in. in this case, perhaps it's better it `TTPGame` class has a `Player` object and a `Board` object uses them in it's class, like `TTPGame.human_moves`.
- How would the game code have changed if we used an array of `Square` objects in `Board` instead of a hash?
