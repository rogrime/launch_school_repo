# Question 1: It should print out "1, 2, 2, 3"

# Question 2:
# 1.  != means NOT equal. You could use it in a conditional
#     Or any place you need to check if something is not equal
# 2.  ! before something will check if something is NOT true.
#     Example: !true will be false
# 3.  ! after something will sometimes indicate that the
#     method will be destructive
# 4.  ? before something could make error
# 5.  ? after something could indicate a ternery operator
#     It could also indicate something will return a bolean
# 6.  Putting !! before something will indicate true unless
#     It is originally false

# Question 3:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
puts advice

# Question 4: numbers.delete_at(1) will delete "2".
# numbers.delete(1) will delete the "1"

# Question 5:

p (10..100).include?(42)
p 42.between?(10, 100)
p (10..100).cover?(42)

# Question 6:
famous_words = "seven years ago..."
puts "Four score and #{famous_words}"
puts "Four score and " + famous_words
puts "Four score and " << famous_words
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
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = (flintstones.select {|key, v| key == "Barney"}).to_a.flatten!
p flintstones
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.assoc("Barney")
p flintstones
