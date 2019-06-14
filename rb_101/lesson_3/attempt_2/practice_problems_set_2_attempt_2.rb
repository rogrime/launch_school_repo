# Question 1:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?("Spot")
p ages.keys.include?("Spot")
p ages.member?("Spot")

# Question 2:
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Question 3:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Question 4:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("dino")
p /dino/.match?(advice)
p advice.match?("dino")
p !!(advice =~ /dino/)

# Question 5:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 6:
flintstones.push("Dino")
flintstones << "Dino"
p flintstones

# Question 7:
flintstones.push("Dino", "Hoppy")
puts "\n"
p flintstones
flintstones.concat(%w(Hoppy Dino))
p flintstones

# Question 8:
advice = "Few things in life are as important as house training your pet dinosaur."
puts "\n"
p advice.slice!(0, advice.index("house"))
puts "\n"
p advice

# Question 9:
statement = "The Flintstones Rock!"
p statement.count("t")

# Question 10:
title = "Flintstone Family Members"
title = title.center(40)
p title
