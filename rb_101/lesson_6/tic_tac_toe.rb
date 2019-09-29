require 'yaml'
score = { player: 0, cpu: 0 }
WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6]]
FIRST_PLAYER = 'player'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME_MSG = YAML.load_file("tic_tac_toe_messages.yml")

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

            |          |
        #{brd[1]}   |    #{brd[2]}     |   #{brd[3]}
      ______|__________|______
            |          |
        #{brd[4]}   |    #{brd[5]}     |   #{brd[6]}
      ______|__________|______
            |          |
        #{brd[7]}   |    #{brd[8]}     |   #{brd[9]}
            |          |
  BRD
end

def prompt(msg)
  puts "==> #{msg}"
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

def request_row_from_usr(game_board, score)
  display_board(game_board, score)
  choice_to_num = { 'TOP' => 1, 'MIDDLE' => 2, 'BOTTOM' => 3 }
  valid_choice = choice_to_num.keys

  loop do
    prompt(GAME_MSG['request_row'])
    row_choice = gets.chomp.upcase
    return choice_to_num[row_choice] if valid_choice.include?(row_choice)
  end
end

def request_sqr_from_usr
  choice_to_num = { 'LEFT' => 0, 'MIDDLE' => 1, 'RIGHT' => 2 }
  valid_choice = choice_to_num.keys

  loop do
    prompt(GAME_MSG['request_square'])
    sqr_choice = gets.chomp.upcase
    return choice_to_num[sqr_choice] if valid_choice.include?(sqr_choice)
  end
end

def player_marks_square!(game_board, score)
  selection_to_sqr = { 1 => [1, 2, 3], 2 => [4, 5, 6], 3 => [7, 8, 9] }
  sqr_choice = ''

  loop do
    row = request_row_from_usr(game_board, score)
    sqr = request_sqr_from_usr
    sqr_choice = selection_to_sqr[row][sqr]

    break if avaliable_squares(game_board).include?(sqr_choice)
    prompt(GAME_MSG['unavaliable_choice'])
    sleep 1
  end
  game_board[sqr_choice] = PLAYER_MARKER
end

def computer_marks_square!(game_board)
  sleep 2
  immediate_threat_plyr = immediate_threat(game_board, PLAYER_MARKER)
  cpu_threat_to_plyr = immediate_threat(game_board, COMPUTER_MARKER)

  # Defensive action
  if immediate_threat_plyr
    sqr_choice = at_risk_sqr(game_board, immediate_threat_plyr)
  end
  # Offensive action
  if cpu_threat_to_plyr
    sqr_choice = at_risk_sqr(game_board, cpu_threat_to_plyr)
  end
  # Pick square 5 if avaliable or pick random if not
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

def update_score!(game_board, score)
  winner = determine_winner(game_board)
  case winner
  when PLAYER_MARKER
    score[:player] += 1
  when COMPUTER_MARKER
    score[:cpu] += 1
  end
end

def display_winning_msg(game_board)
  winner = determine_winner(game_board)
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
  update_score!(board, score)
  display_winning_msg(board)

  puts GAME_MSG['next_game_starting'] if score[:player] != 5 && score[:cpu] != 5
  sleep 3
  break if score[:player] == 5 || score[:cpu] == 5
end

puts GAME_MSG['exiting']
