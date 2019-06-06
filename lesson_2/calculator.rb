require 'yaml'
MESSAGES = YAML.load_file("calc_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0 || number == '0'
end

def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt(MESSAGES['welcome'])
name = nil
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['name_empty'])
  else
    break
  end
end
prompt("Welcome #{name}!")

loop do # Main Loop
  first_num = nil
  loop do
    prompt(MESSAGES['u_first_num'])
    first_num = gets.chomp

    if valid_number?(first_num)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  second_num = nil
  loop do
    prompt(MESSAGES['u_second_num'])
    second_num = gets.chomp
    if valid_number?(second_num)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to do?
1) Add 2) Subtract 3) Multiply 4) Divide
  MSG
  prompt(operator_prompt)
  result = nil
  operator = nil

  loop do
    operator = gets.chomp
    result = case operator
             when '1'
               result = first_num.to_f + second_num.to_f
               break
             when '2'
               result = first_num.to_f - second_num.to_f
               break
             when '3'
               result = first_num.to_f * second_num.to_f
               break
             when '4'
               result = first_num.to_f / second_num.to_f
               break
             else
               prompt("1) Add 2) Subtract 3) Multiply 4) Divide")
             end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  prompt("The result is #{result}")
  prompt(MESSAGES['continue?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['exit'])
