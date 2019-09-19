# Problem 1:
# =========
# Our countdown to launch isn't behaving as expected.
# Why? Change the code so that our program successfully counts down from 10 to 1.
#
# Answer:
# The decrease method does not mutate the caller as the variable is out of
# scope. The decrease method instead creates a new object which it removes
# 1 from. To fix this we simply set the counter variable equal to the return
# value of calling the decrease method on it.
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Problem 2:
# =========
# String#upcase! is a destructive method, so why does this code print HEY
# you instead of HEY YOU? Modify the code so that it produces the expected output.
#
# Answer:
# This is because the #chars method creates a new object seperate from the
# name object. It then modifies this new object. Then the unmodified object is
# displayed. To fix this we need to set the name variable equal to the modified
# object and call join on it to make into into a single word.
def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join('')

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Problem 3:
# =========
# The valid_series? method checks whether a series of numbers is valid.
# For the purposes of this exercise, a valid series of numbers must
# contain exactly three odd numbers. Additionally, the numbers in the series
# must sum to 47. Unfortunately, our last test case
# is not returning the expected result. Why is that?
#
# Answer:
# In the last line of code assignment(=) was being used instead of the equality
# operator(==). This was causing the method to return true since the number 3
# is truthy.

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# Problem 4:
# =========
# The reverse_sentence method should return a new string with the words of
# its argument in reverse order, without using any of Ruby's
# built-in reverse methods. However, the code below raises an
# error. Change it so that it behaves as expected.
#
# Answer:
# An error was raised that it can't add an array and a string. This was caused
# by the first line in the while loop. This is because it attempt to add
# the word to the begining of the array by setting the reversed_words variable
# equal to the current word plus the array. To fix this I used the #unshift
# method to add the current word to the begining of the array

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# Problem 5:
# =========
# We started working on a card game but got stuck.
# Check out why the code below raises a TypeError.
# Once you get the program to run and produce a sum,
# you might notice that the sum is off: It's lower than it should be. Why is that?
#
# Answer:
# During the assignment of the sum variable we use the map method. This did not
# modify the object assigned to the remaining_cards variable. Thus when we called
# the assignment of sum += remaining_cards.sum it was calling the original unmodified
# array. To fix this I changed the #map method to #map! so that it will call
# the modified array during assignment. The total remaining cards sum amount was
# also off. This is because their was not a seperate set of cards for each
# suit. Instead the suits all shared one set of cards. This meant the total number
# of cards was off significantly. To fix this I changed the deck hash to include
# clones of the cards array instead of sharing one cards array.

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map! do |card|
    score(card)
  end

  sum + remaining_cards.sum
end

puts sum

# Problem 6:
# =========
# We wrote a method for moving a given number of elements from one array to
# another. We decide to test it on our todo list, but invoking move on line
# 11 results in a SystemStackError. What does this error mean and why does it happen?
# Answer:
# This method used recursion but failed to provide any means to break out of the
# recusion. It was meant to iterate through the todo list and put nth elements
# into the done array. I created a line at the begining of the method to break
# from the method when the iteration was complete.

def move(n, from_array, to_array)
  return to_array if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']


# Problem 7:
# =========
# We wrote a neutralize method that removes negative words from sentences.
# However, it fails to remove all of them. What exactly happens?
#
# Answer:
# The neutralize method tried to delete elements in an array while iterating through
# it with the #each method. The iteration counter only went through the amount
# of times the original array lasted for. Thus by deleting one word you were set
# back on the counter. This caused the method to miss one of the negative words
# to fix this I switched the #each method with the #reject! method.
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! {|word| negative?(word)}

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Problem 8:
# =========
# The following code prompts the user to set their own password if they haven't
# done so already, and then prompts them to login with that password.
# However, the program throws an error. What is the problem and how can you fix it?
# Once you get the program to run without error, does it behave as
# expected? Verify that you are able to log in with your new password.
#
# Answer:
# The password variable was outside the scope of the method. To fix this it was
# put as an argument in the method. Secondly, the set_password method was edited
# to return the password instead of just assigning it to a variable within the
# method.
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end


verify_password(password)

# Problem 9:
# =========
# A friend of yours wrote a number guessing game. The first version
# he shows you picks a random number between 1 and a provided maximum
# number and offers you a given number of attempts to guess it.
# However, when you try it, you notice that it's not working
# as expected. Run the code and observe its behavior. Can you figure out what is wrong?
#
# Answer:
# It looped infinitely by calling itself and not providing a way to break from the
# loop if you when. I removed this unecesarry line of code and I added a break
# if you win the game.
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end

end

guess_number(10, 3)


# Problem 10:
# =========
# A friend of yours wants to build a basic search engine and starts reading up
# on information extraction. He decides to try a simple implementation
# of TF-IDF, a measure of the information content a term holds for a
# particular document in a document collection. However, he just started
# learning to code and somehow his numbers do not match what is expected.
# He knows you're enrolled in an awesome developer school, so he asks you to have a look.
# Answer:
# The last line of the idf method was causing a zero devision error as it was doing
# integer division instead o float. This was fixed by using the #fdiv method


# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  Math.log(number_of_documents.fdiv(number_of_documents_with_term))
end

# Very simple example

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4

# Problem 11:
# =========
# Josh wants to print an array of numeric strings in reverse numerical order.
# However, the output is wrong. Without removing any
# code, help Josh get the expected output.
# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
#
# Answer:
# Due to ruby's precedence rules using arr.sort after p causes it to bind more
# tightly. This returns the result of arr.sort and ignores the block after it.
# To fix this simply put paraenthees around the sort method.
arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)
