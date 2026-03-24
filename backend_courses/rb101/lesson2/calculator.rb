l = ''
loop do
  puts "en = English, jp = 日本語 "
  l = gets.chomp
  break if l == "en" || l == "jp"
end

LANGUAGE = l

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  # num.to_i() != 0 <--Does not allow zero
  num.to_i.to_s == num # <--Does not allow floats
end

def number?(n)
  n.to_i.to_s == n || n.to_f.to_s == n
end

def operation_to_message(op)
  x = case op
    when '1'
      messages("adding", LANGUAGE)
    when '2'
      messages("subtracting", LANGUAGE)
    when '3'
      messages("multiplying", LANGUAGE)
    when '4'
      messages("dividing", LANGUAGE)
  end
  x
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages("valid_name_error", LANGUAGE))
  else
    break
  end
end

prompt(messages("name_greet", LANGUAGE) + "#{name}!")

loop do # main loop

  number1 = ''
  loop do
    prompt(messages("first_num", LANGUAGE))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages("valid_num_error", LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages("second_num", LANGUAGE))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages("valid_num_error", LANGUAGE))
    end
  end

  operator_prompt = messages("operator_prompt", LANGUAGE)
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator) # %w() creates an array of strings
      break
    else
      prompt(messages("operator_error", LANGUAGE))
    end
  end
  
  prompt("#{operation_to_message(operator)}" + messages("calculating", LANGUAGE))
  sleep(1) # pauses for 1 second

  result = case operator
    when '1'
      number1.to_i() + number2.to_i()
    when '2'
      number1.to_i() - number2.to_i()
    when '3'
      number1.to_i() * number2.to_i()
    when '4'
      number1.to_f() / number2.to_f()
  end

  prompt( messages("result", LANGUAGE) + "#{result}")
  prompt(messages("calculate_again", LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

sleep(1) # pauses for 1 second
prompt(messages("thanks", LANGUAGE))
