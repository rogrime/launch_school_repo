# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Make method that randomly generates and prints teddy's age
# To get age generate random number between 20 and 200
# E: should output "Teddy is 69 years old!"
# D: Should output a string
# A:
# Make method display_teddys_name
# make variable age that is set to a random number between 20 and 200
# puts a string displaying teddys name

def display_teddys_name
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end

display_teddys_name

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Make program that ask for length and width of a room in meters.
# Then display the area of the room in square feet and square meters
# E: Enter the length of the room in meters:
# => 10
# => Enter the width of the room in meters:
# => 7
# => The area of the room is 70.0 square meters (753.47 square feet).
# 1 square meter == 10.7639 square feet
# Can assume that the inputs are integers
# D: will output a string. Will put values in variables and use string interpolation
# A:
# puts a message asking for length of the room in meters. Save the input in variable
# then puts a message asking for the width of the room in meters. Save input in variable
# Set variable square feet to length * width.
# Set square meter variable to square feet / 10.7639
# puts out the square feet and square meters

puts "What is the width of the room in meters?: "
room_width = gets.chomp.to_f

puts "What is the length of the room in meters?: "
room_length = gets.chomp.to_f

square_feet = room_width * room_length
square_meters = square_feet * 10.7639

puts "Square feet of the room is: #{square_feet}. Square meters of the room is #{square_meters}"

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Create tip calculator. The prompt should ask for a bill amount and tip rate
# It should output the tip amount and the total
# E:
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0
# can assume input is numbers
# D: will get two integers. Will output string
# A:
# puts message asking for bill total
# Set variable equal to user input as integer
# puts message asking for tip percent
# Set variable equal to the result of the total times the percent devided by 100
# puts out the total tip
# puts out the total tip
puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

tip = (tip_percent * bill) / 100
total = tip + bill

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Make a program that calculates when you will retire and how many years left
# E: What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
# D: input integers and output string
# A:
# puts message asking for age
# set variable age equal to input to integer
# puts message asking for age of retirement
# set variable retirement_age of age of retirement.
# set variable years_til_retirement to retirement_age - age
# set variable year_of_retirement to current year + years_til_retirement
# puts out message displaying year_of_retirement
# puts out message of years_til_retirement

puts "What is your age?"
age = gets.chomp.to_i

puts "What is the age of retirement?"
retirement_age = gets.chomp.to_i

years_til_retirement = retirement_age - age
year_of_retirement = Time.now.year + years_til_retirement

puts "You will retire: #{year_of_retirement}"
puts "You only got #{years_til_retirement} til retirement!"

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a program that will ask for user's name.
# The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.
# E: What is your name? Bob
# => Hello Bob.
# What is your name? Bob!
# => HELLO BOB. WHY ARE WE SCREAMING?
# D: input string name and output interpolated string
# A:
# puts out message asking for name
# set variable name equal to input
# if name variable includes ! then puts scream message
# else puts normal greeting message

puts "What is your name?"
name = gets.chomp

if name.include?("!")
  puts "HELLO #{name.upcase}! WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
# D: output strings
# A:
# for number in 1 to 99 puts number if number is odd
for number in 1..99
  puts number if number.odd?
end

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
# D: output strings
# A:
# for number in 1 to 99 puts number if number is even
for number in 1..99
  puts number if number.even?
end

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.
# E: >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
# Make sure the number is above 0
# D: input integers and output strings
# A:
# initialize the variable number
# create a loop that ask for the user to provide an integer greater than zero
# set the variable number equal to the user input to an integer
# break the loop if the number is greater than zero
# Initialize the variable operation
# create a loop that asks for user to pick 's' for sum or 'p' for product
# set the variable operation to the user input
# break from the loop if the user input is 's' or 'p'
# do a case statement for operation.
# when the case is 's' call sum_of_imbetween with number as argument
# when the case is 'p' call product_of_imbetween with number as argument

# create method sum_of_imbetween that takes one integer (num)
# initialize a variable named total
# do a for loop in 1 to num
# add each iteration to total
# return total

# create method product_of_imbetween that takes one integer (num)
# initialize a variable named total
# do a for loop in 1 to num
# multiply each iteration to total
# return total
def sum_of_imbetween(num)
  total = 0

  for n in 1..num
    total += n
  end

  total
end

def product_of_imbetween(num)
  total = 1

  for n in 1..num
    total *= n
  end

  total
end


number = 0
operation = ''

loop do
  puts "Please enter a number greater than zero."
  number = gets.chomp.to_i
  break if number > 0
end

loop do
  puts "What operation would you like to do: 's' for sum. 'p' for product"
  operation = gets.chomp
  break if 'sp'.include?(operation)
end

case operation
  when 's'
    puts "The sum of integers between 1 and #{number} is #{sum_of_imbetween(number)}"
  when 'p'
    puts "The product of integers between 1 and #{number} is #{product_of_imbetween(number)}"
  end

# Problem 9:
# =========
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name
#
# This will output: BOB BOB
# This is because the upcase! method mutates the object and it the same object
# that points to save_name

# Problem 10:
# ===========
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2
# It will output =>
#Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
# This is because << points to the same object. Then the upcase! method mutates
# the object it was called on
