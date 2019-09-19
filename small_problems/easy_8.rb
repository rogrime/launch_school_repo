# Problem 1:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array.
# You may assume that the Array always contains at least one number.
# E:
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35
# D: Input an array, output an integer
# A:
# Create a method sum_of_sums that takes one argument an array
# set variable result equal to zero
# call each_with_index on array
# add the sum of the range 0 to current index to result
# return result variable
def sum_of_sums(array)
  result = 0
  array.each_index {|idx| result += array[0..idx].sum}
  result
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Problem 2:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Mad libs are a simple game where you create a story template with blanks
# for words. You, or another player, then construct a list of words
# and place them into the story, creating an often silly or funny story as a result.
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.
# E:
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
# Do you walk your blue dog quickly? That's hilarious!
# D: input user data, output sentences
# A:
# create a method prompt that takes one argument a string
# put a prompt in front of the string and display it
# call prompt and display message asking for a noun
# set variable noun equal to gets.chomp
# call prompt and display message asking for a verb
# set variable verb equal to gets.chomp
# call prompt and display message asking for an adjective
# set variable adjective equal to gets.chomp
# call prompt and display message asking for an adjective
# Display madlibs
def prompt(message)
  puts "=> #{message}"
end

prompt('Enter a noun:')
noun = gets.chomp

prompt('Enter a verb:')
verb = gets.chomp

prompt('Enter an adjective:')
adjective = gets.chomp

prompt('Enter an adverb:')
adverb = gets.chomp

puts <<-MSG
"It was a great day for a #{noun}"
"He was quite a #{adjective} #{noun}"
"The #{noun} #{verb} #{adverb} throughout the day"
MSG

# Problem 3:
# =========
# PEDAC. Problem, Examples, Data Structure, Algorithum, Code
# P:
# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should
# be arranged in order from shortest to longest substring.
# E:
# substrings_at_start('abc') == ['a', 'ab', 'abc']
# substrings_at_start('a') == ['a']
# substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# D: Input string, output array
# A:
# Create a method substrings_at_start that takes one argument a string
# Set results variable equal to an empty array
# Call times on string.length
# push string sliced from 0 to the current iteration to results
# return results

def substrings_at_start(string)
  results = []

  string.length.times do |count|
    results << string.slice(0, count +1)
  end
  results
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Problem 4:
# =========
# P:
# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring
# begins. This means that all substrings that start at position 0 should come
# first, then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given
# position should be returned in order from shortest to longest.
# You may (and should) use the substrings_at_start method you wrote in the previous exercise:
# E:
# substrings('abcde') == [
#  'a', 'ab', 'abc', 'abcd', 'abcde',
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'd', 'de',
#  'e'
# ]
# D: Input string, output array of substrings
# A:
# Create method substrings that takes one argument a string
# set results variable equal to an empty array
# set variable iteration equal to 0
# iterate through string variable
# push calling substrings_at_start on the string sliced from current iteration to -1
# add 1 to current iteration
# break if the iteration is equal to string.length -1
# return results
def substrings(string)
  results = []
  iteration = 0
  string = string

  loop do
    current_iteration = string[iteration..-1]
    results << substrings_at_start(current_iteration)
    iteration += 1
    break if iteration == string.length
  end
  results.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Problem 5:
# =========
# P:
# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.
# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.
# E:
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
# D: Input string, output array of palindromes
# A:
# Create a method palindromes that takes one argument a string
# set results variable equal to an calling substrings on string
# Use select on results to select only elements that are the same reversed

def palindromes(string)
  results = substrings(string)
  results.select {|substring| substring == substring.reverse && substring.length > 1}
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Problem 6:
# =========
# P:
# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".
# E:
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
# D: Input two numbers, output display numbers and words
# A:
# Create a method called fizzbuzz that takes two arguments, num_1, and num_2
# Iterate through the numbers num_1 to num_2
# If the current iteration is divisble by 3 print "fizz"
# elsif it is divisble by 5 print "Buzz"
# elsif it is divisble by 3 and 5 print FizzBuzz
# else just print the number

def fizzbuzz(num_1, num_2)
  for num in num_1..num_2
    output = ""
    output += "Fizz" if (num % 3) == 0
    output += "Buzz" if (num % 5) == 0
    output += num.to_s if !(num % 3 == 0) && !(num % 5 == 0)
    print output + ", "
  end
end

fizzbuzz(1, 15)
puts "Space for next problem"

# Problem 7:
# =========
# P:
# Write a method that takes a string, and returns a new
# string in which every character is doubled.
# E:
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''
# D: input string, output string
# A:
# create a method repeater that takes one argument a string
# set variable string equal to calling split on string by spaces
# iterate through string
# set the current iteration equal to calling split on it
# iterate through the current iteration. Double each letter
# Join the splitted current iteration together

def repeater(string)
  string = string.split(" ")

  string.map do |word|
    word = word.split('')
    word.map {|letter| letter * 2}.join('')
  end.join('  ')
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Problem 8:
# =========
# P:
# Write a method that takes a string, and returns a new string in which
# every consonant character is doubled. Vowels (a,e,i,o,u),
# digits, punctuation, and whitespace should not be doubled.
# E:
# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""
# D: Input string, output string
CONSONANTS = "qwrtypsdfghjklzxcvbnm"

def double_consonants(string)
  string = string.split(" ")

  new_string = string.map do |word|
    word = word.split('')
    word.map! {|letter| CONSONANTS.include?(letter.downcase) ? letter * 2 : letter}
    word.join('')
  end

  new_string.join(' ')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Problem 9:
# =========
# P:
# Write a method that takes a positive integer as an argument and returns
# that number with its digits reversed.
# Don't worry about arguments with leading zeros -
# Ruby sees those as octal numbers, which will cause confusing results.
# For similar reasons, the return value for our fourth example doesn't have any leading zeros.
# E:
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
# D: Input integer, output integer
# A:
# CReate a method reversed_number that takes one argument an integer
# convert the integer to a string and reverse it
# then convert it back to an integer
def reversed_number(integer)
  integer.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Problem 10:
# =========
# P:
# Write a method that takes a non-empty string argument, and returns the
# middle character or characters of the argument. If the argument has an
# odd length, you should return exactly one character.
# If the argument has an even length, you should return exactly two characters.
# E:
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'
# D: Input string, output string
# A:
# Create a method center_of that takes one argument a string
# Set center variable equal to an empty string
# if string.length is odd then put the value of string at
# index of half the strings length into center variable
# if string.length is even then put the value of string at index half of strings length
# and the value of string at index half of strings length + 1
# return center

def center_of(string)
  half = (string.length / 2) - 1
  center = string[(string.length / 2)] if string.length.odd?
  center = string[half..half+1] if string.length.even?
  center
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
