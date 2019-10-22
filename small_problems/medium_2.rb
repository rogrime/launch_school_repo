# Problem 1:
# =========
page = File.read('pg84.txt')
sentences = page.split(/\.|\?|!/)

largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
largest_sentence_word_count = largest_sentence.split.size

puts largest_sentence
puts largest_sentence_word_count

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A collection of spelling blocks has two letters per block
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once
# Write a method that returns true if the word passed in
# as an argument can be spelled from this set of blocks, false otherwise.
# E:
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
# D: Input string, output boolean
# A:
# Create a constant SPELLINGBLOCKS that contains
# the spelling blocks as a nested array
# Create a method block_word? that takes one argument a string
# Set string_characters equal to calling the chars method on string
# Set used_letters equal to an empty array
# iterate through string_characters
# set the current iteration equal to letter
# return false if used_letters includes letter
# iterate through SPELLINGBLOCKS and set the current iteration equal to block
# push block.flatten to used_letters if block includes letter
# implicitly return true

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                  ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(string)
  string_characters = string.upcase.chars
  used_blocks = []

  string_characters.each do |letter|
    return false if used_blocks.flatten.include?(letter)
    BLOCKS.each { |block| used_blocks << block if block.include?(letter) }
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.
# You may assume that the string will always contain at least one character.
# E:
# letter_percentages('abCdef 123')
# == { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef')
# == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123')
# == { lowercase: 0, uppercase: 0, neither: 100 }
# D: Input string, output hash of percent values
# A:
# Create a method letter_percentages that takes one argument a string
# Set the variable character_total equal to string.size
# Set the variable lower_case_percentage equal to string.count downcase
# devided by character_total times 100
# Set the variable upper_case_percentage equal to string.count upcase
# devided by character_total times 100
# Set the variable other_percentage equal to string.count anything but letters
# devided by character_total times 100
# return a hash with the percentage values

ALPHABET = %w(q w e r t y u i o p a s d f g h j k l z x c v b n m)

def calculate_percentages!(string, hash, counts)
  hash[:lowercase] = (counts[:lower] / string.size.to_f) * 100
  hash[:uppercase] = (counts[:upper] / string.size.to_f) * 100
  hash[:neither] = (counts[:neither] / string.size.to_f) * 100
end

def letter_percentages(string)
  percentages = {}
  counts = {}
  alphabet_upcase = ALPHABET.map(&:upcase)
  all_chars = string.chars

  counts[:lower] = all_chars.count { |c| ALPHABET.include?(c) }
  counts[:upper] = all_chars.count { |c| alphabet_upcase.include?(c) }
  counts[:neither] = all_chars.count do |c|
    !ALPHABET.include?(c) && !alphabet_upcase.include?(c)
  end

  calculate_percentages!(string, percentages, counts)
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).
# E:
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# D: Input string, output boolean
# A:
# Create a method balanced? that takes one argument a string
# Set string variable equal to an array
# Set open_parentheses equal to 0
# Iterate through string
# If current iteration is '(' then add one to open_parentheses
# If current iteration is ')' then minus one from open_parentheses
# break if open_parentheses is less than zero

def balanced?(string)
  string = string.chars
  open_parentheses = 0

  string.each do |p|
    open_parentheses += 1 if p == '('
    open_parentheses -= 1 if p == ')'
    break if open_parentheses < 0
  end
  open_parentheses.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A triangle is classified as follows:
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides
# must be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of
# these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle
# is equilateral, isosceles, scalene, or invalid.
# E:
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid
# D: Input three numbers, output :equilateral, :isosceles, :scalene or :invalid
# A:
# Create a method triangle that takes three numbers num_1, num_2, num_3
# set triangle_array equal to all three numbers
# Return false if any of the numbers are 0
# Return false if the two smallest numbers are not bigger than the biggest num
# Set variable type_of_triangle to :scalene
# Iterate through triangle_array
# Set type_of_triangle equal to :equilateral if current_iteration count equals 3
# Set type_of_triangle equal to :isosceles if current_iteration count equals 2
# implicitly return type_of_triangle

def triangle(num_1, num_2, num_3)
  triangle_array = [num_1, num_2, num_3]
  shortest_two_sides = triangle_array.sort.first(2).sum
  biggest_side = triangle_array.sort.last
  triangle_type = ''

  return :invalid if triangle_array.any?(0) || shortest_two_sides < biggest_side
  triangle_array.each do |num|
    triangle_type = :equilateral if triangle_array.count(num) == 3
    triangle_type = :isosceles if triangle_array.count(num) == 2
    triangle_type = :scalene if triangle_type.empty?
  end
  triangle_type
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A triangle is classified as follows:
# right: One angle of the triangle is a right angle (90 degrees)
# acute: All 3 angles of the triangle are less than 90 degrees
# obtuse: One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees,
# and all angles must be greater than 0: if either of these conditions
# is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about
# floating point errors. You may also assume
# that the arguments are specified in degrees.
# E:
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid
# D: Input 3 numbers, output symbol
# A:
# Create a method triangle that takes three arguments num_1, num_2, num_3
# Set variable angles that is equal to all three numbers in an array
# if any of the values in angles are 0 or if the
# sum of the array does not equal 180.
# Set variable angle_type to :right if one of the values in angles is 90
# Set variable angle_type to :acute if all of the values in angles are > 90
# Set variable angle_type to :obtuse if one angle is greater than 90
# implicitly return angle_type

def triangle(num_1, num_2, num_3)
  angles = [num_1, num_2, num_3]

  angle_type = :right if angles.any? { |angle| angle == 90 }
  angle_type = :obtuse if angles.any? { |angle| angle > 90 }
  angle_type = :acute if angles.all? { |angle| angle < 90 }
  angle_type = :invalid if angles.any?(0) || angles.sum != 180
  angle_type
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.
# E:
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
# D: Input year, output integer of month
# A:
# require 'date'
# Create a method friday_13th that takes one argument a number
# Set variable month equal to zero
# Set variable counter equal to 1
# start loop
# Set d variable equal to Date.new(year,counter,13)
# Set variable month equal to counter if d is friday
# add one to the counter
# break if month doesn't equal zero
# implicitly return month
require 'date'

def friday_13th(year)
  total = 0
  counter = 1

  loop do
    day = Date.new(year,counter,13)
    total += 1 if day.friday?
    break if counter == 12
    counter += 1
  end
  total
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A featured number (something unique to this exercise) is an odd number that
# is a multiple of 7, and whose digits occur exactly once each. So, for example,
# 49 is a featured number, but 98 is not (it is not odd), 97 is
# not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument.
# Issue an error message if there is no next featured number.
# E:
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# D: Input number, output number
# A:
# Create a method featured that takes on argument an integer (num)
# Set variable featured_number equal to false
# Set variable multiple_of_seven equal to num / 7 and round that number up
# start a loop
# set current_num equal to multiple_of_seven times 7
# set variable all_digits_unique equal to current_num's digits and evaluate
# whether it is equal to all the unique values in current_num's digits
# set variable featured_number equal to current_num if it is odd and if
# the variable all_digits_unique is true
# Add 1 to multiple_of_seven variable
# break if featured_number is truthy or if the number of digits in current_num
# is greater than 10
# implicitly return featured_number

def next_odd_multiple(num, multiple_num)
  multiple = (num.to_f / multiple_num).floor + 1
  multiple += 1 until multiple.odd?

  multiple
end

def featured(num)
  return "There is no possible featured number" if num > 9_876_524_301
  multiple_of_seven = next_odd_multiple(num, 7)

  loop do
    current_num = multiple_of_seven * 7
    all_digits_unique = current_num.digits == current_num.digits.uniq
    featured_number = current_num if all_digits_unique && current_num.odd?

    multiple_of_seven += 2
    return featured_number if featured_number
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an
# efficient algorithm, but it's a great exercise for student developers.
# In this exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are swapped
# This process is repeated until a complete pass is made without performing
# any swaps; at that point, the Array is completely sorted.
# E:
# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# D: Input array, output original array mutated
# A:
# Create a method sort! that takes one argument array

# Start the main loop
# Set variable idx equal to zero
# Set variable array_modified equal to false
# Start inner loop
# Set variable idx_2 equal to idx + 1
# Set comparison equal to calling the spaceship operator
# comparing array at idx and array at idx_2
# If the comparison is equal to 1 then mutate the array swapping the values
# at idx and idx_2
# Set idx to idx +1
# break from the inner loop if idx is equal to the array size minus 2
# break from the main loop if array_modified is true
# implicitly return array

def bubble_sort!(array)
  loop do
    array_modified = false

    for idx in 0..array.size
      comparison = array[idx] <=> array[(idx + 1)]
      array_modified = true if comparison == 1
      array[idx], array[(idx+1)] = array[(idx+1)], array[idx] if comparison == 1
    end
    break if array_modified == false
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the
# squares of the first n positive integers.
# E:
# sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
# D: Input integer, output integer
# A:
# Create a method sum_square_difference that takes one argument an integer
# Set variable square_sum_of_integers equal to zero
# Set variable sum_of_squares_integers equal to zero
# iterate from zero to integer
# set variable square_sum_of_integers adding current iteration
# set variable sum_of_squares_integers equal to adding current_iteration squared
# implicitly return square_sum_of_integers squared minus sum_of_squares_integers

def sum_square_difference(n)
  sum_of_integers = 0
  sum_of_squared_integers = 0

  for current_num in 0..n
    sum_of_integers += current_num
    sum_of_squared_integers += current_num**2
  end
  sum_of_integers**2 - sum_of_squared_integers
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
