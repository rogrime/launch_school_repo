def prompt(message)
  puts "=> #{message}"
end

win_logic = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def plyr_win?(plyr, cpu, win_logic)
  win_logic[plyr].include?(cpu)
end

def results(player, cpu, win_logic)
  if plyr_win?(player, cpu, win_logic) == true
    'You won!'
  elsif (player == cpu)
    'You tied!'
  else # Computer won
    'Computer won!'
  end
end

count = { player: 0, cpu: 0 }

def win_count_increase(player, cpu, win_count, win_logic)
  if results(player, cpu, win_logic) == 'You won!'
    win_count[:player] += 1
  elsif results(player, cpu, win_logic) == 'Computer won!'
    win_count[:cpu] += 1
  end
end

choice = nil

convert_choice_from_shorthand = Proc.new do
  case choice
  when 'r'
    choice = 'rock'
  when 'p'
    choice = 'paper'
  when 's'
    choice = 'scissors'
  when 'l'
    choice = 'lizard'
  when 'sp'
    choice = 'spock'
  end
end

prompt("Weclome to RPSLSP!")

loop do # ---Main Loop---
  loop do
    prompt("Rock (r), Paper (p), Scissors (s), Lizard (l), Spock (sp)?")
    choice = gets.chomp.downcase
    valid_choice = ['r', 'p', 's', 'l', 'sp']
    if valid_choice.include?(choice)
      convert_choice_from_shorthand.call
      break
    else
      prompt('Invalid choice!')
    end
  end

  computer_choice = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample

  prompt(results(choice, computer_choice, win_logic))
  win_count_increase(choice, computer_choice, count, win_logic)

  you_both_chose = "YOU: #{choice}, COMPUTER: #{computer_choice},"
  current_score = "[SCORE: #{count[:player]} - #{count[:cpu]}]"
  prompt("#{you_both_chose} #{current_score}")

  break if count[:player] == 5 || count[:cpu] == 5
end

prompt("Thank you for playing!")
