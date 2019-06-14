# Question 3:
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# Question 4:
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins"]

# Question 5:
def add_rutabaga_to_array!(an_array_param)
  an_array_param << "rutabaga"
end

def add_rutabaga_at_end_of_string(a_string_param)
  a_string_param += "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
add_rutabaga_to_array!(my_array)
add_rutabaga_at_end_of_string(my_string)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6:
def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
