# Question 1:
10.times {|current_number| puts (" " * current_number + "The Flintstones Rock!")}

# Question 2:
# puts "the value of 40 + 2 is " + (40 + 2)
# This results in an error because you can't add a string and a number
puts "the value of 40 + 2 is: #{(40 + 2)}"
# String interpolation will fix it

# Question 3:
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
puts factors(5)
# The purpose of number % divisor is to check if the divisor is a factor of the number provided
# The purpose of "factors" on line 18 is to return the factors of the number provided.

# Question 4:
# << modifies the object outside of the method where as + does not.

# Question 5:
# The limit variable was outside the scope of the method. I initialized the varible in the method to fix it.
def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# Question 6:
# The output wil be 34

# Question 7:
# Yes because it modified the object and didn't reassign.

# Question 8:
# Paper

# Question 9:
# It will return "no"
