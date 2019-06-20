# Question 1:
count = 0

loop do
  count += 1

  puts "The number #{count} is: odd" if count.odd?
  puts "The number #{count} is: even" if count.even?

  break if count == 5
end

# Question 2:
loop do
  number = rand(100)
  puts number

  break if number.between?(0,10)
end

# Question 3:
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "the loop was proccesed!"

    break
  end
else
  puts "The loop wasn't proccesed"
end
