require 'yaml'
MESSAGES = YAML.load_file("car_loan_calc_messages.yml")

def valid_num?(number)
  number.to_i.to_s == number
end

def prompt(input)
  puts "=> #{input}"
end

name = nil
loop do
  prompt(MESSAGES['welcome'])
  name = gets.chomp
  break unless name.empty?
end

loop do # Main Loop
  loan_amount = nil
  loop do
    prompt(MESSAGES['loan_amount_m'])
    loan_amount = gets.chomp
    break if valid_num?(loan_amount)

    prompt(MESSAGES['numbers_only'])
  end

  apr = nil
  loop do
    prompt(MESSAGES['apr_m'])
    apr = gets.chomp
    break if valid_num?(apr)

    prompt(MESSAGES['numbers_only'])
  end

  duration = nil
  loop do
    prompt(MESSAGES['loan_duration_m'])
    duration = gets.chomp
    break if valid_num?(duration)

    prompt(MESSAGES['numbers_only'])
  end

  duration = duration.to_f * 12
  apr = (apr.to_f / 100) / 12
  result = loan_amount.to_f * (apr / (1 - (1 + apr)**-duration))

  prompt("#{name.capitalize} your monthly payments are: $#{result}")
  prompt(MESSAGES['another_calc?'])

  continue = gets.chomp.downcase
  break unless continue == 'y'
end

prompt(MESSAGES['exit'])
