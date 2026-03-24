class Machine
  def start
    self.flip_switch(:on)
  end
  
  def stop
    self.flip_switch(:off)
  end
  
  private 

  attr_writer :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new

machine.start 
p machine # => #<Machine:0x00000001048313a0 @switch=:on>

machine.stop
p machine # => #<Machine:0x00000001048313a0 @switch=:off>

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Further Exploration

# Add a private getter for @switch to the Machine class, and add a method to Machine that shows how to use that getter.

class Machine
  def start
    self.flip_switch(:on)
  end
  
  def stop
    self.flip_switch(:off)
  end

  def status
    self.switch
  end
  
  private 

  attr_accessor :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new

machine.start
p machine.status # => :on

machine.stop
p machine.status # => :off
