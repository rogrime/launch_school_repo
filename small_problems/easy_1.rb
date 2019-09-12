# Problem 1:
# =========
def display_mssg_repeated(message, times=1)
  puts (message + "\n") * times
end

# Problem 2:
# =========
def is_odd?(number)
  number % 2 == 1
end

# Problem 3:
# =========
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# Problem 4:
# =========
def count_occurrences(array)
  new_array = {}
  array.each {|value| new_array[value] = array.count(value)}

  new_array.each {|k, v| puts "#{k} => #{v}"}
end

# Problem 5:
# =========
def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

# Problem 6:
# =========
def reverse_words(string)
  words = string.split
  words.map! {|word| word.length >= 5 ? word.reverse : word}

  words.join(' ')
end

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Take a number. Return a new string of 1s and 0s of equal length.
# always starting with 1 and endning with 0. Assume it's a integer. Don't round up
# E: Don't round up. Assume it's an integer.
# D: string
# A:
# Create method stringy. Takes a number "length_of_string".
# initialize variable string that is an empty string
# Add '10' to string times length_of_string
# slice the string to the length_of_string
# return string

def stringy(length_of_string)
  string = ''
  string += '10' * length_of_string
  string.slice(0,length_of_string)
end

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Make a method that takes an array of positive integers. And returns the
# average number. It can be any length.
# E: It can be any length. We can assume it's positive integers only in the array
# D: Will work with array and return an integer.
# A:
# Create method average that takes an array of positive integers (array)
# Create a variable total with value of 0
# iterate over the array and add each interation to total variable
# take variable and devide it by the length of the array. return this

def averages(array)
  sum = array.sum
  total_length_of_array = array.length

  sum / total_length_of_array
end

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P: Write method takes a positive integer. Returns sum of its digits.
# E: Returns an integer that is sum of the provided numbers digits. Can use
# alternative syntax 101_101 for numbers.
# D: will take an positive integer and return a positive integer.
# A:
# Create method sum that takes a positive integer (number).
# make variable new_integer that is number converted to string and split
# initialize count variable to 0
# initialize total variable to 0
# loop through new_integer with loop do. Add each iteration converted to integer
# to the total variable. Break from the loop after finishing.
# return the total variable

def sums(number)
  array_of_digits = number.to_s.split('').map {|number| number.to_i}
  array_of_digits.sum
end

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# Write method that takes two arguments, number, and boolean value.
# Calculate the bonus to be given with the two. If false bonus is zero.
# if true then the bonus is half the salary.
# E: Can assume it is positive integer and recieve true or false.
# D: It will receieve a integer and a boolean. It will return an integer
# A:
# Create method calculate_bonus that takes positive integer and boolean (salary, bonus)
# If bonus is false return 0
# If bonus is true return half the salary

def calculate_bonus(salary,bonus)
  half_of_salary = salary / 2
  bonus ? half_of_salary : 0
end
