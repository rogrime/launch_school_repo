# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string.
# E:
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
# You can use String#Ord
# D: Array
# A:
# Create a method ascii_value that takes one argument string
# Set string equal to string to array of all characters
# Initialize sum variable
# Iterate through string variable and set sum equal to sum plus the return value of ord method called on each iteration
# return sum variable
# end method
def ascii_value(string)
  sum = 0
  string.each_char {|c| sum += c.ord}
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any integer input.
# E:
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# You may not use ruby's Date and Time classes.
# Disregard Daylight Savings and Standard Time and other complications.
# D: Integer
# A:
# Create a method time_of_day that takes one argument number_of_minutes
# Create a method minute_of_day that takes one argument current_minute
# Set current_minute equal to current_minute.to_f / 60 - current_minute.to_i / 60 * 60
def time_of_day(minutes)
  minutes_in_day = 1440
  hour_of_day = (minutes % minutes_in_day) / 60
  minute_of_day = (((minutes.to_f % minutes_in_day) / 60 - hour_of_day) * 60).round

  format('%02d:%02d', hour_of_day, minute_of_day)
end

p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: As seen in the previous exercise, the time of day can be represented as
# the number of minutes before or after midnight. If the number of minutes
# is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
# You may not use ruby's Date and Time methods.
# E: after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# D: Integer, Array, String
# A:
# Create method after_midnight that takes one argument time
# set time equal to calling split method on it
# return the zeroth index of time times 60 plus the 1st index of time
# Create method before_midnight that takes one argument time
# set time equal to calling split method on it
# set total_minutes equal to the zeroth index of time times 60 plus the 1st index of time
# return 1440 minus total_minutes

def after_midnight(time)
  time = time.split(':')
  total_minutes = (time[0].to_i * 60) + time[1].to_i
  total_minutes < 1440 ? total_minutes : 0
end

def before_midnight(time)
  time = time.split(':')
  total_minutes = 1440 - ((time[0].to_i * 60) + time[1].to_i)
  total_minutes < 1440 ? total_minutes : 0
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first
# and last letters of every word are swapped.
# You may assume that every word contains at least one letter, and that the string
# will always contain at least one word. You may also assume that each string
# contains nothing but words and spaces
# E:
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'
# D:
# Input string, output string
# A:
# Create method swap that takes one argument string
# set string equal to calling split on string by spaces.
# iterate through string array next if the current iteration is less than 2 in length
# set the first letter equal to the last letter and the last letter equal to the first
# of the current iteration
# return string array joined by a space
def swap(string)
  string = string.split(' ')

  string.map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  string.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Problem 5:
# =========
# P:
# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the non-alphabetic
# characters replaced by spaces. If one or more non-alphabetic characters occur
# in a row, you should only have one space in the result
# (the result should never have consecutive spaces).
def cleanup(string)
  alphabet = "qwertyuiopasdfghjklzxcvbnm"
  string = string.split(' ')

  string.each_with_index do |word, idx|
    word = word.chars.map do |c|
      if alphabet.include?(c)
        c
      else
        ' '
      end
    end.join('')
    string[idx] = word
  end
  string.join(' ').squeeze(' ')
end

p cleanup("---what's my +*& line?")

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space.
# E:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}
# D: Input string, output hash
# A:
# Create a method named word_sizes that takes one argument string
# Set string equal to calling split by spaces on string
# Set sizes equal to an empty hash
# Iterate through string array
# Push the current iteration length to sizes with a value of one if that size isn't
# already in the hash
# If it is already in the hash add one to the value
# return the sizes hash

def word_sizes(string)
  sizes = {}

  string.split(' ').each do |word|
    sizes.key?(word.length) ? sizes[word.length] += 1 : sizes[word.length] = 1
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.
# E:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

def word_sizes(string)
  sizes = {}

  string.split(' ').each do |word|
    word = word.delete('^A-Za-z')
    sizes.key?(word.length) ? sizes[word.length] += 1 : sizes[word.length] = 1
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array of Integers between 0 and 19, and returns an
# Array of those Integers sorted based on the English words for each number:
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
# E:
# alphabetic_number_sort((0..19).to_a) == [
# 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
# 6, 16, 10, 13, 3, 12, 2, 0
# ]
# D: Input array, output array
# A:
# Create a constant hash called numbers_to_words that contains number as key and
# the word as the value.
# Create a method alphabetic_number_sort that takes one argument array
# sort the array by the value of a number in the numbers_to_words hash

NUMBERS_TO_WORDS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eightteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(array)
  array.sort_by {|n| NUMBERS_TO_WORDS[n]}
end

p  alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1,
7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
# E:
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
# D: Input string, output string
# A:
# Create a method crunch that takes one argument string
# Set string equal to calling split by spaces on it
# iterate through each element in the string array
# iterate through the current iteration split into an array with chars method
# delete the current character if the last one is the same
# end the outer iteration with the curernt iteration

def crunch(string)
  new_string = string.split(' ').map do |word|
    word_chars = word.chars
    new_word = []
    word_chars.each_with_index {|c, idx| new_word << word_chars[idx] unless word_chars[idx] == new_word.last }
    new_word.join('')
  end
  new_string.join(' ')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that will take a short line of text, and print it within a box.
# E:
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# D: Input string, output string
# A:
# Create a method print_in_box that takes one argument a string
# Set length equal to string.length times two
# Set box_walls equal to the string '-' times length
# Create a herdoc formated like the example

def print_in_box(string)
  box_length = string.length
  box_walls = '-' * box_length + '--'
  box_spaces = ' ' * box_length
  boxed_msg = <<-MSG
  +#{box_walls}+
  | #{box_spaces} |
  | #{string} |
  | #{box_spaces} |
  +#{box_walls}+
  MSG

  puts boxed_msg
end

print_in_box('To boldly go where no one has gone before.')

# Problem 11:
# =========
# Question:
# You are given a method named spin_me that takes a string as an argument and
# returns a string that contains the same words, but with each word's characters
# reversed. Given the method's implementation, will the returned string be the
# same object as the one passed in as an argument or a different object?
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
# Answer:
# It will return a different object than the one that was passed in as an argument
# This happens because split creates a new object, and thus anything that happens
# after that is modifying that new object. 
