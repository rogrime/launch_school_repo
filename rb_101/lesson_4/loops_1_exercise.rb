# Question 1:
loop do
  puts 'Just keep printing...'
  break
end

# Question 2:
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'

    break
  end

  break
end

puts 'This is outside all loops.'

# Question 3:
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5

  iterations += 1
end

# Question 4:
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp

  break if answer == 'yes'
end

# Question 5:
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1

  say_hello = false if counter == 5
end

# Question 6:
numbers = []

while numbers.size < 5
  numbers << rand(0..99)
end

puts numbers
