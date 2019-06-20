# Question 1:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

# Question 2:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum_of_ages = 0
ages.values.each {|age| sum_of_ages += age }

# Question 3:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if {|_,age| age < 100}

# Question 4:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

# Question 5:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|name| name.start_with?("Be")}

# Question 6:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0..2]}
p flintstones

# Question 7:
statement = "The Flintstones Rock"
statement_hash = {}

statement.split("").each {|v| statement_hash[v] = statement.count(v)}

# Question 8:
# When we modify an array while iterating over it makes the code hard to read.
# it would output "1" , 3" and it would return [1,2,3,4].

# The output would be "1", "2". Pop returns the last element of
# the array and delete it. Each will return the original collection. In this case
# it will return [1,2,3,4]

# Question 9:
def titlesize(string)
  string.split.map {|v| v.capitalize}.join(' ')
end

# Question 10:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |name, details|
  age = [details]["age"]

  case age
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  when 65...1000
    details["age_group"] = "senior"
  end
end

p munsters
