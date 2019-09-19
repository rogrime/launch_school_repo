# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.
# You may assume that both input Arrays are non-empty,
# and that they have the same number of elements.
# E:
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# D: Input two arrays, output one array
# A:
# Create a method interleave that takes two arguments array_1 and array_2
# set variable new_array equal to a blank array
# set variable total_elements equal to array_1 length plus array_2 length
# iterate through the numbers 0 to total_elements
# If the current iteration is odd add array_1 at current iteration index to
# new_array else add array_2 at current iteration index to new_array
# return new_array
def interleave(array_1, array_2)
  new_array = []
  total_elements = array_1.length + array_2.length
  array_1_current_idx, array_2_current_idx = 0 , 0

  total_elements.times do |current_iteration|
    if current_iteration.odd?
      new_array.push(array_2[array_2_current_idx])
      array_2_current_idx += 1
    else
      new_array.push(array_1[array_1_current_idx])
      array_1_current_idx += 1
    end
  end

  new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.
# E:
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
# D: Input string, output hash
# A:
# Create a constant called UPPERCASE that is equal to all uppercase letters
# Create a constant called LOWERCASE that is equal to all lowercase letter
# Create a method letter_case_count that takes one argument a string
# set results equal to an empty hash
# set hash value upper_case_count equal to zero
# set hash value lower_case_count equal to zero
# set hash value neither_case_count equal to zero
# iterate through each letter in string
# upper_case_count plus 1 if UPPERCASE contains current interation
# lower_case_count plus 1 if LOWERCASE contains current interation
# neither_case_count plus 1 if neither
# puts the hash
UPPERCASE = "QWERTYUIOPASDFGHJKLZXCVBNM"
LOWERCASE = "qwertyuiopasdfghjklzxcvbnm"

def letter_case_count(string)
  results = {lowercase: 0, uppercase: 0, neither: 0}

  string.split('').each do |l|
    if UPPERCASE.include?(l)
      results[:uppercase] += 1
    elsif LOWERCASE.include?(l)
      results[:lowercase] += 1
    else
      results[:neither] += 1
    end
  end

  results
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a single String argument
# and returns a new string that contains the original value of the argument
# with the first character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.
# E:
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# D: Input string, output string
# A:
# create a method word_cap that takes one argument a string
# call split method on string with a space the call map on it
# capitalize each iteration and join with a space
def word_cap(string)
  string.split(' ').map {|word| word.capitalize}.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word')  == 'This Is A "quoted" Word'

# Problem 4:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version,
# and every lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.
# E:
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# D: Input string, output string
# A:
# Create a method swapcase that takes one argument a string
# call split method on string then call map on string
# Call map method each iteration of a word
# capitalize the letter if it is lowercase and lowercase the letter if its capitalized
# join word without spaces
# join the new array by a space
def swapcase(string)
  string = string.split(' ')
  new_string = ""

  string.map! do |word|
    word = word.split('').map {|l| UPPERCASE.include?(l) ? l.downcase : l.upcase}
    word.join('')
  end

  string.join(' ')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Problem 5:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.
# E:
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# D: Input string, output string
# A:
# Create a method staggered_case that takes one argument string
# Split string by spaces
# Set current_idx equal to -1
# iterate through each word with map
# add one to current_idx
# split word and map through it
# upcase the letter if current_idx is even
# add one to current_idx
# join the word
# join all words by spaces
def staggered_case(string)
  string = string.split(' ')
  current_idx = -1

  new_string = string.map do |word|
    current_idx += 1
    word.chars.map do |letter|
      current_idx.even? ? letter.upcase! : letter.downcase!
      current_idx += 1
      letter
    end.join('')
  end
  new_string.join(' ')
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Problem 6:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.
# E:
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# C:
ALPHABET = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm "

def staggered_case(string)
  string = string.split(' ')
  current_idx = 0

  new_string = string.map do |word|
    word.chars.map do |letter|
        current_idx.even? ? letter.upcase! : letter.downcase!
        current_idx += 1 if ALPHABET.include?(letter)
        letter
    end.join('')
  end
  new_string.join(' ')
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Problem 7:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to
# 3 decimal places. Assume the array is non-empty.
# E:
# show_multiplicative_average([3, 5])
# The result is 7.500

# show_multiplicative_average([6])
# The result is 6.000

# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
# D: Input an array, output display results
# A:
# Create a method called show_multiplicative_average that takes one argument array
# set array_length equal to the array length
# set result variable equal to zero
# Calculate the product of the array and devid it by the float of array_length
# puts the results

def show_multiplicative_average(array)
  array_length = array.length + 0.000
  results = array.inject(:*) / array_length
  "The result is " + format('%.3f', results)
end

p show_multiplicative_average([3, 5]) == "The result is 7.500"
p show_multiplicative_average([6]) == "The result is 6.000"
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == "The result is 28361.667"

# Problem 8:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.
# E:
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# D: Input two arrays, output one array
# A:
# Create a method multiply_list that takes two arguments array_1 and array_2
# set variable results to an empty array
# call each_with_index on array_1
# push the result of array_1 index times array_2 index to results array
# return results
def multiply_list(array_1, array_2)
  results = []
  array_1.each_with_index {|num,idx| results << (num * array_2[idx])}
  results
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Problem 9:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# every pair of numbers that can be formed between the elements of
# the two Arrays. The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.
# E:
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# D: Input two arrays, output one array
# A:
# Create a method multiply_all_pairs that takes two arguments array_1 and array_2
# set variable results equal to an empty array
# call each do on array_1
# call each do on array_2
# put the result of multiplying the array_1 current iteration by the array_2 current iteration
# return results variable
def multiply_all_pairs(array_1, array_2)
  results = []

  array_1.each do |arr_1_num|
    array_2.each {|arr_2_num| results << (arr_1_num * arr_2_num)}
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Problem 10:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.
# E:
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'
# D: Input string, output string
# A:
# Create a method penultimate that takes one argument a string
# call split on string by spaces. and display the -2 index of the array
def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('Launch School is great!') == 'is'
