def valid_number?(n)
  n.to_i.to_s == n || n.to_f.to_s == n
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Loan Calculator!")
prompt("---------------------------")

loop do
  loan_amount = ''
  loop do
    prompt("What is your loan amount in dollars?")
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt("Please input a valid number.")
    end
  end
  loan_amount = loan_amount.to_i

  apr = ''
  loop do
    prompt("What is your annual percentage rate (APR)?")
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt("Please input a valid number.")
    end
  end
  monthly_percent = (apr.to_f / 12) / 100

  years_duration = ''
  loop do
    prompt("What is your loan duration in years?")
    years_duration = gets.chomp
    if valid_number?(years_duration)
      break
    else
      prompt("Please input a valid number.")
    end
  end
  month_duration = years_duration.to_i * 12

  prompt("Calculating monthly payments...")
  sleep(1)

  montly_payment = loan_amount * (monthly_percent / (1 - (1 + monthly_percent)**(-month_duration)))

  prompt("Your monthly payments will be $#{montly_payment.round(2)}.")
  prompt("Would you like to make another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

sleep(1)
prompt("Thank you for using Loan Calculator! Goodbye!")
