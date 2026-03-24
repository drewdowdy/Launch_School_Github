=begin

- n Place a value n in the "register". Do not modify the stack.
- PUSH Push the register value on to the stack. Leave the value in the register.
- ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
- SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
- MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
- DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
- MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
- POP Remove the topmost item from the stack and place in register
- PRINT Print the register value

=end

## First Attempt

class Minilang
  def initialize(instructions)
    @register = 0
    @stack = []
    @instructions = parse(instructions)
  end

  def eval
    @instructions.each do |item|
      case
      when item.is_a?(Integer)
        @register = item
      when item == 'PUSH'
        @stack << @register
      when item == 'ADD'
        @register += @stack.pop
      when item == 'SUB'
        @register -= @stack.pop
      when item == 'MULT'
        @register *= @stack.pop
      when item == 'DIV'
        @register /= @stack.pop
      when item == 'MOD'
        @register %= @stack.pop
      when item == 'POP'
        if @stack.empty?
          puts "Empty stack!"
          return
        else
          @register = @stack.pop
        end
      when item == 'PRINT'
        puts @register
      else
        puts "Invalid token: #{item}"
        return
      end
    end
  end

  private 

  def parse(instructions)
    parsed = instructions.split
    parsed.map do |item|
      if item.to_i.to_s == item
        item.to_i
      else
        item
      end
    end
  end
end

## Second Attempt

class MinilangError < StandardError
end

class EmptyStackError < MinilangError
end

class InvalidTokenError < MinilangError
end

class Minilang
  VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(instructions)
    @register = 0
    @stack = []
    @instructions = parse(instructions)
  end

  def eval
    @instructions.each do |token|
      if VALID_TOKENS.include?(token)
        send(token.downcase)
      elsif token.is_a?(Integer)
        @register = token
      else 
        raise InvalidTokenError, "Invalid token: #{token}"
      end
    end
  end

  private

  def parse(instructions)
    instructions.split.map do |item|
      if item.to_i.to_s == item
        item.to_i
      else
        item
      end
    end
  end

  def push
    @stack << @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    if @stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      @register = @stack.pop
    end
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4  PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

## Further Exploration 1

class Minilang
  VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(instructions)
    @register = 0
    @stack = []
    @instructions = instructions
  end

  def eval(degrees_c:)
    @instructions = format(@instructions, degrees_c: degrees_c)
    @instructions = parse(@instructions)

    @instructions.each do |token|
      if VALID_TOKENS.include?(token)
        send(token.downcase)
      elsif token.is_a?(Integer)
        @register = token
      else 
        raise InvalidTokenError, "Invalid token: #{token}"
      end
    end

    reset
  end

  private

  def parse(instructions)
    instructions.split.map do |item|
      if item.to_i.to_s == item
        item.to_i
      else
        item
      end
    end
  end

  def push
    @stack << @register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    if @stack.empty?
      raise EmptyStackError, "Empty stack!"
    else
      @register = @stack.pop
    end
  end

  def print
    puts @register
  end

  def reset
    @register = 0
    @stack = []
    @instructions[2] = '%<degrees_c>d'
    @instructions = @instructions.join(' ')
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

## Further Exploration 2

