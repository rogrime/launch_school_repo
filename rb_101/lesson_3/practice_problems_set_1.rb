# Question 1: It will output 1 2 2 3

# Question 2: ! is the bang suffix. It often idicates that a method is destructive. It can also check if something is not true.
# ? usually indicates it will return true / false.
# 1. != checks if something is not equal.
# 2. Putting ! before an integer returns false. As everything other than nil and false are truthy.
# 3. Returns an error
# 4. Returns an error
# 5. Returns true, for the some reason as #2.

# Question 3:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!(/important/, 'urgent')
puts advice

# Question 4: The first method removes the integer 2. The second removes the integer 1

# Question 5:
puts (10..100).cover?(42)

# Question 6:
famous_words = "seven years ago..."
puts "Four score and " + famous_words
famous_words.prepend("Four score and ")
puts famous_words

# Question 7: 42

# Question 8:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!
p flintstones

# Question 9:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.assoc("Barney")
