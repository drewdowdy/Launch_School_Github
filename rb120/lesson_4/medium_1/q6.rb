class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What's the difference?

# In the first `Computer` class, we are invoking the getter method `#template` as the return value of `#show_template.` In the second `Computer` class, we are invoking `#template` on the calling object `self`, which isn't really necessary. Both methods will produce the same result.
