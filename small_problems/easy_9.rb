# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Create a method that takes 2 arguments, an array and a hash.
# The array will contain 2 or more elements that, when combined with adjoining
# spaces, will produce a person's name. The hash will contain two keys, :title
# and :occupation, and the appropriate values. Your method should
# return a greeting that uses the person's full name, and mentions the person's title.
# E:
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
# D: Input an array and a hash, output displays a message
# A:
# Create a method greetings that takes two arguments an array and a hash
# Display a message using the full name and title of this person
def greetings(name, status)
  full_name = name.join(' ')
  title = status[:title]
  "Hello #{full_name}, nice to meet a #{title} #{status[:occupation]}!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.
# E:
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# D: Input integer, output integer
# A:
# Create a method twice that takes one integer
# if integer is even then set check_num equal to integer to string
# return integer if check_num from 0 to check_num / 2 is equal to
# check_num / 2 to -1
# return integer * integer
def twice(integer)
  if integer.to_s.length.even?
    check_num = integer.to_s
    half = check_num.length / 2
    return integer if check_num[0..half -1] == check_num[half..-1]
  end

  integer * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number.
# If the number is 0 or negative, return the original number.
# E:
# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby
# D: Input integer, output integer
# A:
# Create a method negative take takes one argument an integer
# if integer is negative or zero return integer
# return integer times negative 1
def negative(integer)
  return integer if integer.negative? || integer == 0
  integer * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an integer argument,
# and returns an Array of all integers, in sequence, between 1 and the argument.
# You may assume that the argument will always be a valid integer that is greater than 0.
# E:
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]
# D: input integer, output array
# A:
# create a method sequence that takes one argument an integer
# set variable results to an empty array
# do the following integer times with index
# push current index to results array
# return results
def sequence(integer)
  (1..integer).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.
# E:
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true
# D: input string, output
# A:
# Create a method uppercase? that takes one argument a string
# convert all elements in the string to an array
# Remove all non-alphabetic characters
# check if all are uppercase

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string as an argument, and returns an Array
# that contains every word from the string, to which you have
# appended a space and the word length.
# You may assume that words in the string are separated by exactly
# one space, and that any substring of non-space characters is a word.
# E:
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#  ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []
# D: Input string, output array
# A:
# Create a method word_lengths that takes one argument a string
# Set string variable eqal to string split by spaces into an array
# Iterate over the array
# Set each iteration equal to iteration plus the iteration length
# return the array
def word_lengths(string)
  string.split(' ').map {|word| "#{word} #{word.length}"}
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a first name, a space, and a last name passed
# as a single String argument, and returns a string that
# contains the last name, a comma, a space, and the first name.
# E:
# swap_name('Joe Roberts') == 'Roberts, Joe'
# D: Input string, output string
# A:
# Create method called swap_name that takes one argument a string
# set string equal to string.split
# return the correct string
def swap_name(name)
  "#{name.split[1]}, #{name.split[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Create a method that takes two integers as arguments. The first argument
# is a count, and the second is the first number of a sequence that
# your method will create. The method should return an Array that contains
# the same number of elements as the count argument,
# while the values of each element will be multiples of the starting number.
# You may assume that the count argument will always have a
# value of 0 or greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned.
# E:
# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []
# D: Input two integers, output array
# A:
# Create a method sequence that takes two integers as arguments, count and first_num
# set variable count equal to 0 to count as an array
# set variable multiples equal to an empty array
# iterate through count with an index
# push the current index with the value first_num times the current index to
# the multiples variable
# return the multiples variable
def sequence(count, first_num)
  multiples = []
  count.times {|index| multiples[index] = first_num * (index +1) }
  multiples
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.
# Tested values are all between 0 and 100.
# There is no need to check for negative values or values greater than 100.
# E:
# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"
# D: Input three integers, output string
# A:
# Create a constant called GRADE_NUMBER? that contains a hash.
# put the numbers associated with each grade in the hash
# Create a method get_grade that takes three integers as arguments
# select the key from the hash that contains the value of adding all three integers
# and deviding them by 3
# return the key
GRADE_NUMBER = {"A" => (90..100).to_a, "B" => (80..90).to_a,
"C" => (70..80).to_a, "D" => (60..70).to_a, "F" => (0..60).to_a}

def get_grade(grade_1, grade_2, grade_3)
  grade = GRADE_NUMBER.select do |_, grade_range|
    grade_range.include?((grade_1 + grade_2 + grade_3) / 3)
  end

  grade.keys[0]
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method which takes a grocery list (array) of fruits with
# quantities and converts it into an array of the correct number of each fruit.
# E:
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#  ["apples", "apples", "apples", "orange", "bananas","bananas"]
# D: Input array, output new array
# A:
# Create a method buy_fruit that takes one argument an grocery_list
# Set variable array_of_fruits equal to an empty array
# # Iterate through grocery_list and push the first index of the current iteration
# times the second index of the current iteration
# return the array_of_fruits array
def buy_fruit(grocery_list)
  array_of_fruits = []

  grocery_list.each do |fruit|
    fruit[1].times { array_of_fruits << fruit[0]}
  end
  array_of_fruits
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
 ["apples", "apples", "apples", "orange", "bananas","bananas"]
