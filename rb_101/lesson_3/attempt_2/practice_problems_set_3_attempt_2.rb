# Question 1:
10.times {|spaces| puts (' ' * spaces) + "The Flintstones Rock!"}

# Question 2:
# It is trying to add an integer and a string.
# You could use string interpolation or convert the number to a string
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3:
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
p factors(-11)

# Question 4:
# The << method mutates the caller, while + doesn't.

# Question 5:
# The variable isn't avaliable in the method scope. You have to pass it as argument
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6: 34

# Question 7:
# Yes because hash[key]= mutates the key value pair.

# Question 8: Paper

# Question 9: No 
