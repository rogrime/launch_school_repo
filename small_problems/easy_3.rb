# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether
# or not the 6th number appears amongst the first 5 numbers.
# E:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
# D: Each number will be put in array
# A:
# Create a variable named array_of_numbers equal to an empty array
# do the following six times
# puts a message that asks for the nth number
# push user input to an integer to the array_of_numbers
# create a variable last_number equal to the last element in array_of_numbers
# create a variable last_number_in_array equal to checking array_of_numbers if
# without the last number includes the last number

array_of_numbers = []
6.times do |count|
  puts "Enter the #{count + 1}# number"
  number = gets.chomp.to_i

  array_of_numbers << number
end

last_number = array_of_numbers.pop
last_number_included_in_array = array_of_numbers.include?(last_number)

if last_number_included_in_array
  puts "The number #{last_number} is included in #{array_of_numbers}"
else
  puts "The number #{last_number} does not appear in #{array_of_numbers}"
end

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# No need to validate input
# E:
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103
# prompt needed. No need to ask for what operation to preform
# D: Variables and output interpolated strings
# A:
# Create prompt method that puts a prompt in front of argument message
# Ask for the first number
# Save the first number into variable first_num
# Ask for the second number
# Save the second number into variable second_num
# Output all the operations in interpolated string showing what is done.
def prompt(message)
  puts "==> #{message}"
end

prompt("What is the first number?")
first_num = gets.chomp.to_i

prompt("What is the second number?")
second_num = gets.chomp.to_i

prompt("#{first_num} + #{second_num} = #{first_num + second_num}")
prompt("#{first_num} - #{second_num} = #{first_num - second_num}")
prompt("#{first_num} * #{second_num} = #{first_num * second_num}")
prompt("#{first_num} / #{second_num} = #{first_num / second_num}")
prompt("#{first_num} % #{second_num} = #{first_num % second_num}")
prompt("#{first_num} ** #{second_num} = #{first_num ** second_num}")

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a character.
# E:
#input:
# Please write word or multiple words: walk
#
# output:
# There are 4 characters in "walk".
#
# input:
# Please write word or multiple words: walk, don't run
#
# output:
# There are 13 characters in "walk, don't run".
# D: Variables and string interpolated output
# A:
# Ask for user to enter word or multiple words on single line
# Save the input to variable words
# output the number of characters in interpolated string with split, join and length method

print "Please write word or multiple words: "
words = gets.chomp

puts "There are #{words.split.join.length} characters in: #{words}"

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Create a method that takes two arguments, multiplies them together, and returns the result.
# E: multiply(5, 3) == 15
# D: Method
# A:
# Create a method multiply that takes two arguments num1 and num2
# Return an error if either are a string
# Check if they are strings by checking for equality with to_i back to to_s and the original
# Return the two numbers multiplied together

def multiply(num1, num2)
  return "Error: Not a number!" if num1.is_a?(String) || num2.is_a?(String)
  num1 * num2
end

puts multiply(5, 5)

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).
# E:
# square(5) == 25
# square(-8) == 64
# D: Methods
# A:
# Create a method square that takes one argument number
# within the method call the multiply method with number as the two arguments

def square(number)
  multiply(number, number)
end

puts square(22)

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.
# E:
# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false
# Return true if exactly one is true. Return false if both are true or both false
# D: Method
# A:
# Create a method called xor? that takes two arguments, first_statement, and second_statement
# Set first_statement and second_statement equal to their boolean equivilents
# If first_statement is equal to second_statement then return false
# else return true

def xor?(first_statement, second_statement)
  !(!!first_statement == !!second_statement)
end

puts xor?(5.odd?, 4.odd?)

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that returns an Array that contains every other element of
# an Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.
# E:
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# Can take any types of elements. Empty array returns empty array
# one element returns one element
# D: Array
# A:
# Create a method oddities that takes an argument array that defaults to a blank array
# Create a variable new_array that is set to a blank array
# iterate over array with index and put every element with an odd index into new_array
# return new_array

def oddities(array = [])
  new_array = []
  array.each_with_index {|e, i| new_array << e if i.even?}

  new_array
end

def oddities(array = [])
  new_array = []
  count = 0

  loop do
    new_array << array[count] if (count - 1).odd?

    break if count == array.length
    count += 1
  end
  new_array
end

def oddities(array = [])
  new_array = []
  count = 0

  while !(count == array.length)
    new_array << array[count] if (count - 1).odd?

    count += 1
  end

  new_array
end

p oddities([2, 3, 4, 5, 6])

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.
# E:
# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true
# D: Variables and strings
# A:
# Create a method palidrome? that takes one argument named string
# Check if string is equal to string reversed.

def palindrome?(string)
  string == string.reverse
end

puts palindrome?('madam')

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters.
# E:
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false
# Ignore non alphanumeric characters and spaces. Ignore case
# D: strings
# A:
# Create a mthod real_palindrome? that takes one argument string
# downcase the string
# delete all non-alphanumeric characters
# split the string then join the string to remove spaces
# check if the string is the same reversed and return that

def real_palindrome?(string)
  string = string.downcase.split('')
  string.delete_if {|c| "qwertyuiopasdfghjklzxcvbnm0123456789".include?(c) == false}
  string = string.join('')

  string == string.reverse
end

puts real_palindrome?("123a321")

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.
# E:
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true
# D: Method
# A:
# Create a method palindromic_number? that takes one argument number
# return error if argument is not a number
# Convert number to a string
# check if number is the same as number reversed

def palindromic_number?(number)
  return 'Error: not a number!' if !(number.is_a?(Integer))

  number = number.to_s

  number == number.reverse
end

p palindromic_number?(020)
