require 'yaml'
score = { player: 0, cpu: 0 }
WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6]]
FIRST_PLAYER = 'computer'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME_MSG = YAML.load_file("tic_tac_toe_messages.yml")
SELECTION_TO_SQR = { 'T1' => 1, 'T2' => 2, 'T3' => 3,
                     'M1' => 4, 'M2' => 5, 'M3' => 6,
                     'B1' => 7, 'B2' => 8, 'B3' => 9 }

board = {}
def initialize_board(board)
  board[1] = INITIAL_MARKER
  board[2] = INITIAL_MARKER
  board[3] = INITIAL_MARKER
  board[4] = INITIAL_MARKER
  board[5] = INITIAL_MARKER
  board[6] = INITIAL_MARKER
  board[7] = INITIAL_MARKER
  board[8] = INITIAL_MARKER
  board[9] = INITIAL_MARKER
end

def display_board(brd, score)
  system 'clear'
  puts <<-BRD
                SCORE:

            Xs         Os
         [YOU: #{score[:player]}]   [CPU: #{score[:cpu]}]

       [1]      [2]       [3]
            |          |
  (T)   #{brd[1]}   |    #{brd[2]}     |   #{brd[3]}
      ______|__________|______
            |          |
  (M)   #{brd[4]}   |    #{brd[5]}     |   #{brd[6]}
      ______|__________|______
            |          |
  (B)   #{brd[7]}   |    #{brd[8]}     |   #{brd[9]}
            |          |

  BRD
end

def prompt(msg)
  puts "==> #{msg}"
end

def join_by_or(array)
  if array.size > 1
    array[0..-2].join(', ') + ' or ' + array[-1]
  else
    array[-1]
  end
end

def choose_first_player
  choice_to_player = { 'Y' => PLAYER_MARKER, 'N' => COMPUTER_MARKER }
  valid_choice = choice_to_player.keys

  loop do
    prompt(GAME_MSG['choose_first_player'])
    choice = gets.chomp.upcase
    return choice_to_player[choice] if valid_choice.include?(choice)
  end
end

def determine_first_player(setting)
  case setting
  when 'computer' then COMPUTER_MARKER
  when 'player' then PLAYER_MARKER
  when 'choose' then choose_first_player
  end
end

def alternate_players(player)
  player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER
end

def avaliable_squares(game_board)
  open_sqrs = []

  game_board.values.each_with_index do |sqr, i|
    open_sqrs << (i + 1) if sqr == INITIAL_MARKER
  end
  open_sqrs
end

def avaliable_player_choices(game_board)
  avaliable_squares(game_board).map { |sqr| SELECTION_TO_SQR.key(sqr) }
end

def immediate_threat(game_board, marker)
  brd_values = game_board.values

  WINNING_LINES.select do |winning_line|
    if winning_line.count { |sqrs| brd_values[sqrs] == marker } == 2
      winning_line.any? { |sqrs| brd_values[sqrs] == INITIAL_MARKER }
    end
  end[0]
end

def at_risk_sqr(game_board, line)
  brd_values = game_board.values
  sqr_at_risk = line.select { |sqr| brd_values[sqr] == ' ' }[0] + 1
  sqr_at_risk
end

def request_sqr_from_usr(game_board, score)
  valid_choices = avaliable_player_choices(game_board)

  loop do
    display_board(game_board, score)

    prompt(GAME_MSG['request_square'])
    prompt(join_by_or(valid_choices))
    sqr_choice = gets.chomp.upcase

    return SELECTION_TO_SQR[sqr_choice] if valid_choices.include?(sqr_choice)
    prompt(GAME_MSG['invalid_choice'])
    sleep 1
  end
end

def player_marks_square!(game_board, score)
  sqr_choice = request_sqr_from_usr(game_board, score)
  game_board[sqr_choice] = PLAYER_MARKER
end

def computer_marks_square!(game_board)
  sleep 2
  plyr_is_threat = immediate_threat(game_board, PLAYER_MARKER)
  cpu_threat_to_plyr = immediate_threat(game_board, COMPUTER_MARKER)

  if cpu_threat_to_plyr
    sqr_choice = at_risk_sqr(game_board, cpu_threat_to_plyr)
  elsif plyr_is_threat
    sqr_choice = at_risk_sqr(game_board, plyr_is_threat) if plyr_is_threat
  end

  sqr_choice = 5 if avaliable_squares(game_board).include?(5)
  sqr_choice = avaliable_squares(game_board).sample if !sqr_choice
  game_board[sqr_choice] = COMPUTER_MARKER
end

def mark_square!(game_board, score, player)
  player_marks_square!(game_board, score) if player == PLAYER_MARKER
  computer_marks_square!(game_board) if player == COMPUTER_MARKER
end

def determine_winner(game_board)
  brd_values = game_board.values

  if WINNING_LINES.any? do |winning_line|
       marker = brd_values[winning_line[0]]

       next if marker == INITIAL_MARKER
       return marker if winning_line.all? { |sqrs| brd_values[sqrs] == marker }
     end
  end
end

def winner?(game_board)
  !!determine_winner(game_board)
end

def tie?(game_board)
  avaliable_squares(game_board).empty?
end

def update_score!(winner, score)
  case winner
  when PLAYER_MARKER
    score[:player] += 1
  when COMPUTER_MARKER
    score[:cpu] += 1
  end
end

def display_winning_msg(winner)
  case winner
  when PLAYER_MARKER then puts GAME_MSG['player_won']
  when COMPUTER_MARKER then puts GAME_MSG['computer_won']
  else # Its a tie
    puts GAME_MSG['tied']
  end
end

loop do # Main loop
  initialize_board(board)
  display_board(board, score)
  player = determine_first_player(FIRST_PLAYER)

  loop do
    puts GAME_MSG['computer_thinking'] if player == COMPUTER_MARKER
    mark_square!(board, score, player)
    display_board(board, score)

    player = alternate_players(player)
    break if winner?(board) || tie?(board)
  end
  winner = determine_winner(board)
  update_score!(winner, score)
  display_winning_msg(winner)

  puts GAME_MSG['next_game_starting'] if score[:player] != 5 && score[:cpu] != 5
  sleep 3
  break if score[:player] == 5 || score[:cpu] == 5
end

puts GAME_MSG['exiting']
