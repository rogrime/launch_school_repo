score = { user: 0, dealer: 0 }
GOAL = 21
DEALER_GOAL = GOAL - 4
CARD_TO_VALUE = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUITS = ['H', 'S', 'D', 'C']
WINNING_MSG = { 'user' => 'You Won!',
                'dealer' => 'You Lose!', 'tie' => 'You Tied!' }

def prompt(msg)
  puts "==> #{msg}"
end

def integer?(string)
  string.to_i.to_s == string || string == '0'
end

def initialize_deck(suits, cards)
  suits.product(cards)
end

def deal_hand!(deck)
  drawn_cards = deck.sample(2)

  drawn_cards.each { |card| deck.delete(card) }
  drawn_cards
end

def hit!(deck, hand)
  drawn_card = deck.sample

  hand << drawn_card
  deck.delete(drawn_card)
end

def no_more_changeable_aces?(card_values)
  !card_values.include?(11)
end

def choose_value_of_aces!(card_values)
  until card_values.sum <= GOAL || no_more_changeable_aces?(card_values)
    ace_index = card_values.index(11)
    card_values[ace_index] = 1
  end
end

def total(hand)
  card_values = hand.map { |cards| cards[1] }
  card_values.map! { |card| integer?(card) ? card.to_i : CARD_TO_VALUE[card] }

  choose_value_of_aces!(card_values)
  card_values.sum
end

def bust?(total)
  total > GOAL
end

def winner(user_hand, dealer_hand)
  dealer_sum = total(dealer_hand)
  user_sum = total(user_hand)
  user_bust = bust?(user_sum)
  dealer_bust = bust?(dealer_sum)

  return 'tie' if user_sum == dealer_sum
  return 'user' if dealer_bust || dealer_sum < user_sum && !user_bust
  'dealer'
end

def update_score!(score, round_winner)
  case round_winner
  when 'user' then score[:user] += 1
  when 'dealer' then score[:dealer] += 1
  end
end

def hit_or_stay?
  valid_choices = ['H', 'S']
  choice = ''

  loop do
    prompt('Would you like to [h]it or [s]tay?:')
    choice = gets.chomp.upcase
    break if valid_choices.include?(choice)
  end
  choice
end

def corners_of_cards(hand)
  top_of_cards = []
  bottom_of_cards = []

  hand.each do |card|
    card = card.reverse.join
    top_of_cards.push("|#{card}" + ' ' * (4 - card.size) + '|')
    bottom_of_cards.push('|' + ' ' * (4 - card.size) + "#{card}|")
  end
  [top_of_cards, bottom_of_cards]
end

# rubocop:disable Metrics/AbcSize
def display_cards(score, user_hand, dealer_hand)
  corners_of_cards_user = corners_of_cards(user_hand)
  corners_of_cards_dealer = corners_of_cards(dealer_hand)
  user_size = user_hand.size
  dealer_size = dealer_hand.size

  system 'clear'
  puts <<-CARDS
     5 points to win
  |YOU: #{score[:user]}| |DEALER: #{score[:dealer]}|

  (DEALER):
  #{'+----+ ' * dealer_size}
  |?   | #{corners_of_cards_dealer[0][1..-1].join(' ')}
  #{'|    | ' * dealer_size}
  |   ?| #{corners_of_cards_dealer[1][1..-1].join(' ')}
  #{'+----+ ' * dealer_size}
  (YOU):
  #{'+----+ ' * user_size}
  #{corners_of_cards_user[0].join(' ')}
  #{'|    | ' * user_size}
  #{corners_of_cards_user[1].join(' ')}
  #{'+----+ ' * user_size}
  CARDS
end
# rubocop:enable Metrics/AbcSize

def display_total(current_total)
  prompt("Total: #{current_total}")
end

def display_round_score(user_sum, dealer_sum)
  prompt("Your Total: #{user_sum}")
  prompt("Dealers Total: #{dealer_sum}")
end

def display_winning_msg(round_winner)
  prompt(WINNING_MSG[round_winner])
end

loop do # Main Loop
  deck = initialize_deck(SUITS, CARDS)
  user_hand = deal_hand!(deck)
  dealer_hand = deal_hand!(deck)
  current_player_hand = user_hand

  loop do
    dealer_total = total(dealer_hand)
    user_total = total(user_hand)
    current_player_total = total(current_player_hand)

    display_cards(score, user_hand, dealer_hand)
    display_total(user_total)
    break if bust?(current_player_total)

    user_choice = hit_or_stay? unless current_player_hand == dealer_hand
    current_player_hand = dealer_hand if user_choice == 'S'

    break if dealer_total >= DEALER_GOAL && current_player_hand == dealer_hand
    hit!(deck, current_player_hand)
  end
  round_winner = winner(user_hand, dealer_hand)
  update_score!(score, round_winner)

  display_cards(score, user_hand, dealer_hand)
  display_round_score(total(user_hand), total(dealer_hand))
  display_winning_msg(round_winner)

  break if score.values.any? { |scores| scores == 5 }
  puts 'Starting next round...'
  sleep 5
end
puts 'Thank you for playing! Goodbye!'
