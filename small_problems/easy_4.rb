# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that takes two strings as arguments, determines the longest
# of the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again.
# You may assume that the strings are of different lengths.
# E:
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"
# Can assume they are two strings. If one blank it will output the only string with content
# D: Variables
# A:
# Create a method short_long_short that takes two arguments string_1 and string_2
# if strig_1 is greater length than string_2 set it to variable longer_string
# and set shorter_string variable to string_2. else set string_1 to shorter_string
# and set longer_string to string_2
# concatenate the shorter_string with the longer_string and the shorter_string again

def short_long_short(string_1, string_2)
  if string_1.length > string_2.length
    longer_string = string_1
    shorter_string = string_2
  else
    longer_string = string_2
    shorter_string = string_1
  end

  shorter_string + longer_string + shorter_string
end

p short_long_short('fffff', 'def')

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.
# E:
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'
# D: Strings
# A:
# Create a method century that takes one argument year
# create a variable century_number that is year devided by 100
# add 1 to century_number if the last two numbers are greater than 0
# convert century_number to string
# do a case statement for the last character of century_number if second to last number isn't 1
# return century_number plus the following for each case
# for 0 add th
# for 1 add st
# for 3 add rd
# for 2 add nd
# else add th

def century_suffix(century_number)
  second_to_last_digit = century_number.to_s.slice(-2).to_i

  if second_to_last_digit != 1
    case century_number.slice(-1)
    when '1' then 'st'
    when '2' then 'nd'
    when '3' then 'rd'
    else
      'th'
    end
  elsif second_to_last_digit == 1
    'th'
  end
end

def century(year)
  century_number = year / 100
  century_number += 1 if century_number.to_s.slice(0,2).to_i > 0
  century_number = century_number.to_s

  century_number + century_suffix(century_number)
end


puts century(5000)

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless
# the year is evenly divisible by 400.
# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a
# leap year, or false if it is not a leap year.
# E:
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true
# rules must be divisible by 4 or 400 to be a leap year
# return false if 0
# D: Strings
# A:
# Create a method leap_year? that takes one argument year
# check if year is evenly divisible by 4 and that the year isn't divisible by 100
# or if the year is evenly divisible by 400

def leap_year?(year)
  return false if year == 0
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

p leap_year?(400)

# Problem 4:
# =========
def leap_year?(year)
  return false if year == 0

  if year.between?(1,1752)
    year % 4 == 0
  else
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
  end
end

p leap_year?(1900)

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples.
# For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.
# E:
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168
# Can assume that integer is greater than 1
# D: Array
# A:
# Create a method named multisum that takes one argument a number
# Create a variable num_of_five_multiples that contains the number devided by 5
# Create a variable num_of_five_multiples that contains the number devided by 3
# create a variable that contains an array named array_of_multiplies
# iterate through 1 to number supplied
# add the number to array_of_multiplies if it is divisble by 5 or 3
# return the sum of array_of_multiplies

def multisum(number)
  array_of_multiplies = []

  for num in 1..number
    array_of_multiplies << num if num % 5 == 0 || num % 3 == 0
  end
  array_of_multiplies.sum
end

p multisum(1000)

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from the original Array.
# E:
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []
# An empty array returns an empty array
# D: Array
# A:
# Create a method running_total that takes an array
# Create a variable new_array that contains an empty array
# Create a variable sum that is equal to zero
# Iterate over array, add the current number to sum and push the sum to new_array
# Return new_array

def running_total(array)
  sum = 0
  array.map {|n| sum += n}
end

p running_total([2, 5, 13])

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer.
# String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.
# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.
# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. Your method should do this the
# old-fashioned way and calculate the result by analyzing the characters in the string.
# E:
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570
# D: String
# A:
# Create a method string_to_integer that takes one argument a string
# set variable array equal to calling split on string
# Set variable num_length equal to the length of the array
# Set number variable equal to zero
# iterate over the array reversed with index checking for numbers 0-9. Add the number it finds
# times index number + 1 to the power of 10

def string_to_integer(string)
  array = string.split('')
  number = 0

  array.reverse.each_with_index do |n, index|
    case n
    when '1' then number += 1 * (10 ** index)
    when '2' then number += 2 * (10 ** index)
    when '3' then number += 3 * (10 ** index)
    when '4' then number += 4 * (10 ** index)
    when '5' then number += 5 * (10 ** index)
    when '6' then number += 6 * (10 ** index)
    when '7' then number += 7 * (10 ** index)
    when '8' then number += 8 * (10 ** index)
    when '9' then number += 9 * (10 ** index)
    end
  end

  number
end

p string_to_integer('506030402060')

# Problem 8:
# =========
def string_to_signed_integer(string)
  case string[0]
  when '-' then - string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('570')

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next,
# you're going to reverse those methods. Write a method that takes a positive
# integer or zero, and converts it to a string representation. You may not use any
# of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do this
# the old-fashioned way and construct the string by analyzing and manipulating the number.
# E:
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'
# Rules: No conversion methods. Takes positive integer or zero. Doesn't take negatives
# D: Array
# A:
# Create a method integer_to_string that takes one argument a number
# Return '0' if number is zero
# Call the digits method on the number and set number to that
# Set a variable number_string equal to an empty string
# iterate over number and add each iteration the string depending on what number it is
# return number_string

DIGIT_TO_STRING = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}

def integer_to_string(number)
  number = number.digits.reverse
  number_string = ''
  number.each {|n| number_string += DIGIT_TO_STRING[n]}

  number_string
end

p integer_to_string(3566)

# Problem 10:
# =========
p string_to_integer('-122')
