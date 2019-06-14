# Question 1:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.key?("Spot")

# Question 2:
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
puts munsters_description

# Question 3:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
puts ages

# Question 4:
advice = "Few things in life are as important as house training your pet dinosaur."
puts 'true' if advice =~ /dino/

# Question 5:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6:
flintstones.push("Dino")

# Question 7:
flintstones.push("Dino", "Hoppy")
flintstones.concat(%w(Dino Hoppy))
flintstones.push("Dino").push("Hoppy")

# Question 8:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house'))
puts advice

# Question 9:
statement = "The Flintstones Rock!"
p statement.count('t')

# Question 10:
title = "Flintstone Family Members"
puts title.center(40)
