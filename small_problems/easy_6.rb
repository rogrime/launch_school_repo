# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds. You should use a degree symbol (°) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
# E:
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# D: Input integer, outpud results
# A:
# Create a method dms that takes one argument integer
# Set minutes equal to integer minus integer.floor times 60
# Set seconds equal to minutes minus minutes.floor times 60
# if minutes.digits length is greater than 0 set minutes equal to
# minutes with a zero added in front as a string
# if seconds.digits length is greather than 0 set seconds equal to
# minutes with a zero added in front as a string
# return the string integer with degree symbol minutes with the minutes symbol
# and seconds with the seconds symbol in round thing with percent symbol
DEGREE = "\xC2\xB0"

def dms(integer)
  minutes = (integer - integer.floor) * 60
  seconds = (minutes - minutes.floor) * 60
  minutes, seconds = (minutes + 1), 0 if seconds.round == 60
  format(%(#{integer.floor}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
# E:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# D:
# Input array, output array
# A:
# Create a method remove_vowels that takes one argument array
# Set new_array equal to an empty array
# Set vowels equal to all vowels
# Call map method on array
# set word equal to word.chars
# Call map! on word
# remove the current iteration if it is included in vowels
# join the word together without spaces
def remove_vowels(array)
  vowels = "aeiouAEIOU"
  array.map { |word| word.chars.delete_if {|c| vowels.include?(c)}.join('')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that calculates and returns the index of the first
# Fibonacci number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)
# E:
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
# D: Input integer, output integer
# A:
# Create a method called find_fibonacci_index_by_length that takes one number int
# set fib_num variable equal to 1
# set second_fib_num variable equal to 1
# set index equal to 1
# iterate through fib_num
# Set new_number = fib_num + second_fib_num
# break if new_number.to_s.length == (int)
# index += 1
# fib_num = second_fib_num
# second_fib_num = new_number

# return index

def find_fibonacci_index_by_length(int)
  fib_num = 1
  second_fib_num = 1
  index = 3

  loop do
    new_number = fib_num + second_fib_num
    break if new_number.to_s.length == int

    index += 1
    fib_num = second_fib_num
    second_fib_num = new_number
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.
# You may not use Array#reverse or Array#reverse!.
# E:
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1]
# list == [4, 3, 2, 1]
# list.object_id == result.object_id

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"]
# list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# reverse!(list) == ["abc"]
# list == ["abc"]

# list = []
# reverse!(list) == []
# list == []
# D: Input array, output same array
# A:
# Create a method reverse! that takes one argument array
# call the sort! method on the array and reverse the order
# return the array

def reverse!(array)
  return array if array.length == 0
  index = 0
  iteration = -1
  loop do
    array[iteration], array[index] = array[index], array[iteration]

    index += 1
    iteration -= 1
    break if index >= (array.length - 2)
  end
  array
end


list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.
# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
# E:
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]
# D: Input array, output a new array
# A:
# Create a method reverse that takes one argument an array
# sort array backwards
# Return new array

def reverse(array)
  array.sort {|a, b| array.index(b) <=> array.index(a)}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes two Arrays as arguments, and returns an Array
# that contains all of the values from the argument Arrays.
# There should be no duplication of values in the returned Array, even if
# there are duplicates in the original Arrays.
# E:
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# D: Input two arrays, output one merged array
# A:
# Create a method merge that takes two arguments arr_1 and arr_2
# Add arr_1 and arr_2 and call dup on it

def merge(arr_1, arr_2)
  merged_array = arr_1 + arr_2
  merged_array.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of
# the original Array, respectively. If the original array contains an odd
# number of elements, the middle element should be placed in the first half Array.
# E:
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]
# D: Input one array, output two arrays
# A:
# Create a method called halvsies that takes on argument an array
# set arr_1_length equal to array.length / 2 round up + 1
# set arr_2_length equal to array.length / 2 round down + 1
# set arr_1 equal to array[0..arr_1_length]
# set arr_2 equal to array[arr_1_length..arr_2_length]
# set new_array equal to a nested array of arr_1 and arr_2
# return new_array
def halvsies(array)
  arr_1_length = (array.length / 2.0).round - 1
  arr_2_length = arr_1_length + 1

  first_half = array[0..arr_1_length]
  second_half = array[arr_2_length..array.length]

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.
# E:
# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
# D: Input array, output string
# A:
# Create a method called find_dup that takes one argument an array
# set variable original_array to array
# call uniq! on array
# return original_array - array first index

def find_dup(array)
  array.uniq.delete_if {|e| array.count(e) < 2}[0]
end

p find_dup([1, 5, 3, 1]) == 1

p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.
# E:
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false
# D: Input an array and search value, output true or false
# A:
# Create a method include? that takes two arguments an array and an element
# Check if array.count the element is greater than zero

def include?(array, element)
  array.count(element) > 0
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.
# E:
# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#  ********
# *********
# D: Input integer, output display_triangle
# A:
# Create a method triangle that takes one argument an integer
# Create an empty array set to the variable stars
# set variable current_iteration equal to 0
# iterate through integer adding the "*" times the current iteration to stars
# puts stars

def triangle(num)
  stars = []
  current_iteration = 0

  num.times do
    current_iteration += 1
    break if current_iteration > num

    stars.push('*' * current_iteration)
  end

  stars.each do |stars|
    puts "#{' ' * num}#{stars}"
    num -= 1
  end
end

triangle(5)
triangle(9)
