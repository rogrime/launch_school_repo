# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that rotates an array by moving the first
# element to the end of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.
# E:
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']
# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]
# D: Input an array, output a new array
# A:
# Create a method rotate_array that takes one argument an array called array_of_numbers
# set variable rotated_array to array_of_numbers cloned
# Set the first element in rotated_array equal to the last element of array_of_numbers
# Set the last element of rotate_array equal to the first element of array_of_numbers
# return rotated_array
def rotate_array(array_of_numbers)
  rotated_array = array_of_numbers.clone
  rotated_array << rotated_array.shift

  rotated_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that can rotate the last n digits of a number. For example:
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.
# E:
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
# D: Input two integers, output one integer
# A:
# create a method rotate_rightmost_digits that takes two integers, number, times
# Set number variable equal to an array of all the digits
# set swapped_numbers equal to the values in the array number from -1 to times
# join the array number by the index 0 to times not included plus
# call rotate_array on swapped_numbers and join it
def rotate_rightmost_digits(number, times)
  rotated_number = number.to_s.split('')
  rotated_number[(times * -1)..-1] = rotate_array(rotated_number[times*-1..-1])

  rotated_number.join('').to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again
# to get 321597. Finally, keep the first 4 digits fixed in place and rotate
# the final 2 digits to get 321579. The resulting number is
# called the maximum rotation of the original number.
# Write a method that takes an integer as argument, and returns the
# maximum rotation of that argument. You can (and probably should)
# use the rotate_rightmost_digits method from the previous exercise.
# Note that you do not have to handle multiple 0s.
# E:
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845
# D: Input an integer, output a new integer
# A:
# Create a method max_rotation that takes one integer called number
# Set variable number_length equal to number to string and determining the size
# set the number variable equal to number to string to array
# do the following number_length(s) of times
# set number equal calling rotate_array on current index to -1
# return number
def max_rotation(number)
  number_digits = number.to_s.length
  number = number.to_s.chars

  number_digits.times do |n|
    number[n-1..number_digits] = rotate_array(number[n-1..number_digits])
  end

  number.join('').to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on.
# On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
# D: Input an integer, output results
# A:
# create a method light_sequence that takes one argument an integer called n
# set variable lights equal to an empty hash
# iterate from 1 to n adding the value of each iteration as keys to lights and
# the value as "on"
# display message "round 1: every light is turned on"
# do the following n number of times
# iterate through the lights variable
# if the key is a multiple of the current iteration index then
# set the value to "off" if is on and "on" if it is off
# display message "round [current iteration]: lights [list lights off] are now off;
# [list lights on] are on"

def light_sequence(n)
  lights = {}
  n.times {|num| lights[num+1] = "on"}

  n.times do |num|
    lights.each do |light, status|
      if light % (num+1) == 0
        lights[light] == "on" ? lights[light] = "off" : lights[light] = "on"
      end
    end
  end

  lights.select {|light, status| status == 'off'}.keys
end

p light_sequence(5) == [1, 4]
p light_sequence(10) == [1, 4, 9]

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.
# E:
# diamond(9)

    #*
   #***
  #*****
 #*******
#*********
 #*******
  #*****
   #***
    #*
# D: input an integer, output display a diamond
# A:
# create a method called triangle that takes one argument an integer called num
# set variable stars equal to an empty array
# set variable spaces equal to zero
# push num * stars to stars variable
# iterate through num to 3
# on each iteration push spaces plus star times current iteration -2 to
# the variable stars
# add one to spaces
# return stars array
# create method diamond that takes one argument an integer num
# puts triangle(num)
# puts triangle(num) reversed
def triangle(num)
  stars = []
  spaces = ''
  number_of_stars = (3..num).to_a.reverse
  current_num = num

  loop do
    spaces += ' '
    stars << spaces + ("*" * current_num)
    break if current_num == 1
    current_num -= 2
  end

  stars.reverse
end

def diamond(num)
  first_half = triangle(num)
  second_half = triangle(num).reverse

  second_half.shift
  puts first_half
  puts second_half
end

diamond(17)

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A stack is a list of values that grows and shrinks dynamically. In ruby,
# a stack is easily implemented as an Array that just uses the #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack of values.
# Each operation in the language operates on a register, which can be
# thought of as the current value. The register is not part of the stack.
# Operations that require two values pop the topmost item from the stack
# (that is, the operation removes the most recently pushed value from the stack),
# perform the operation using the popped value and the
# register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language.
# It multiplies the stack value with the register value, removes the value from
# the stack, and then stores the result back in the register.
# Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item
# in the stack), and a register value of 7, then the MULT operation
# will transform things to 3 6 on the stack (the 4 is removed),
# and the result of the multiplication, 28, is left in the register.
# If we do another MULT at this point, then the stack is
# transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the
# register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it
# from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the
# register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the
# register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into
# the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed
# in as an argument. Your program may assume that all programs are
# correct programs; that is, they won't do anything like try to
# pop a non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

# Examples:

# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# D: Input string commands, ouput results
# A:
# Create method minilang

def minilang(string)
  register = 0
  stack = []

  string.split(' ').each do |cmd|
    case cmd
      when 'PUSH' then stack.push(register)
      when 'ADD' then register += stack.pop.to_i
      when 'SUB' then register -= stack.pop.to_i
      when 'MULT' then register *= stack.pop.to_i
      when 'DIV' then register /= stack.pop.to_i
      when 'MOD' then register %= stack.pop.to_i
      when 'POP' then register = stack.pop.to_i
      when 'PRINT' then puts register
      else register = cmd.to_i
    end
  end
end

minilang('PRINT')
# 0
minilang('5 PUSH 3 MULT PRINT')
# 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
minilang('5 PUSH POP PRINT')
# 5
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
minilang('-3 PUSH 5 SUB PRINT')
# 8
minilang('6 PUSH')


# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
# E:
# word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# D: Input string, output string
# A:
# Create a constant WORDS_AS_DIGITS that contains a hash of the words 0 through
# nine and set the keys as digits
# Create a method word_to_digit that takes one argument string
# convert string to an array of all the words by spaces
# Iterate through the array of words. set any iteration that is a digit to
# a word using the WORDS_AS_DIGITS hash
# return the new array
WORDS_AS_DIGITS = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

def find_punctuation_mark(string)
  string = string.split('')

  punctuation_mark = string.select {|p| ["!", ".", "?"].include?(p)}[0]
  punctuation_mark ? punctuation_mark : nil
end

def word_to_digit(string)
  string = string.split(' ')

  string.map do |word|
    punctuation_mark = find_punctuation_mark(word)
    word = word.split('').reject {|l| ["!", ".", "?"].include?(l)}

    word = WORDS_AS_DIGITS.include?(word.join) ? WORDS_AS_DIGITS[word.join].to_s : word.join
    punctuation_mark ? word + punctuation_mark : word.to_s
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a recursive method that computes the nth Fibonacci
# number, where nth is an argument to the method.
# E:
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765
# D: Input integer, output integer
# A:
# Create a method fibonacci that takes one argument an integer called num
# if the num is less than 2 return num
# else then add fibonacci(n -1) and fibonacci (n -2)
def fibonacci(current_num)
  return current_num if current_num < 2
  fibonacci(current_num -1) + fibonacci(current_num -2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Rewrite your recursive fibonacci method so that it computes its results without recursion.
# E:
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# D: Input integer, output integer
# A:
# Create a method fibonacci that takes one argument num an integer
# return 1 if num is less than 2
# set variable num_1 equal to 1
# set variable num_2 equal to 2
# set variable new_num equal to 0
# set counter equal to 1
# loop through the following
# set new_num equal to num_1 + num_2
# set num_1 equal to num_2
# set num_2 equal to new_num
# break out of the loop if counter equals num
# return new_num

def fibonacci(num)
  first, last = [1, 1]
  3.upto(num) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# In this exercise, you are going to compute a method
# that returns the last digit of the nth Fibonacci number.
# E:
# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4
# D: Input integer, output integer
# A:
# Create a method fibonacci_last that takes one argument an integer
# call fibonacci on integer and call digits on it
# returning the -1 index
def fibonacci_last(integer)
  last_2 = [1, 1]
  3.upto(integer) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci_last(15) == 0
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123456789) == 4
