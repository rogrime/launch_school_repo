# Question 1:
# The variable will not be intialized and return an error as the conditional statement was not true

# Question 2:
# it will return {a => 'hi there'} as the method << mutated the caller

# Question 3:
# a. will display "one is: one" "two is: two" "three is: three"
# b. will display "one is: one" "two is: two" "three is: three"
# c. will display "one is: two" "two is: three" "three is: one"

# Question 4:
def is_an_ip_number?(string)
  string.to_i.between?(0,255)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
p dot_separated_ip_address?("255.255.255.255")
