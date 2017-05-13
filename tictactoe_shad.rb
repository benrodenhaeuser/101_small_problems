require 'io/console'

EMPTY_BOARD      = { 1 => nil, 2 => nil, 3 => nil,
                     4 => nil, 5 => nil, 6 => nil,
                     7 => nil, 8 => nil, 9 => nil }

ALL_LINES        = [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontals
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # verticals
                   [1, 5, 9], [7, 5, 3]             # diagonals

POINTS_TO_WIN    = 5
PLAYERS          = [:player,
                    :computer]
SCOREBOARD       = { player:   0,
                     computer: 0 }
MARKS            = { player:   "X",
                     computer: "O" }
MINIMAX_VALUES   = { player:   -1,
                     computer: 1,
                     tie:      0 }
MINIMAX_STRAT    = { player:   :min,
                     computer: :max }

H_LINE             = " *───────*───────*───────* "
V_LINE             = " | "
SQ_WIDTH           = " " * 5
V_LINES_WITH_SPACE = ((V_LINE + SQ_WIDTH) * 3) + V_LINE

PROMPT      = ">> "
L_MARGIN    = " " * (PROMPT.size - 1)
TOTAL_WIDTH = (L_MARGIN.size * 2) + H_LINE.size

TERMINATION_CHARS = { "\u0003" => "^C",
                      "\u0004" => "^D",
                      "\u001A" => "^Z" }

############### GAME LOGIC ###############

def board_full?(board)
  board.values.all?
end

def check_result(turns_played, board)
  return nil if turns_played < 5

  round_winner = find_round_winner(board)
  return round_winner if round_winner
  return :tie         if turns_played > 8 && board_full?(board)
end

def detect_3_same_marks(line_values)
  return nil unless line_values.all?

  unique_symbols_on_line = line_values.uniq.size
  return line_values.first if unique_symbols_on_line == 1

  nil
end

def fetch_line_values(board)
  ALL_LINES.map { |line| board.values_at(*line) }
end

def find_round_winner(board)
  line_values = fetch_line_values(board)

  line_values.each do |line|
    result = detect_3_same_marks(line)

    return result if result
  end

  nil
end

def match_winner(score)
  score.key(POINTS_TO_WIN)
end

def next_move(board, player_turns, turns_played)
  curr_player = player_turns.shift

  curr_player == :player ? ask_for_move(board) : ai_move(board, turns_played)

  player_turns.push(curr_player)
end

def valid_moves(board)
  board.select { |_square, mark| mark.nil? }
       .keys
end

############### AI ###############

def ai_move(board, turns_played)
  chosen_move = choose_move(board, turns_played)
  board[chosen_move] = :computer
  sleep 0.5 if turns_played > 2
end

# observation: choose_move and explore_game_tree are a little similar. 

def choose_move(board, turns_played)
  moves = valid_moves(board)

  move_values = {}
  moves.each do |move|
    value = minimax(board, turns_played, move) # minimax is computed for a move
    next if value == -1
    move_values[move] = value
    break if value == 1
  end

  move_values.key(1) || move_values.key(0)
end

def explore_game_tree(game_state, turns_played, depth, opp_strategy)
  moves_evaluation = {}
  possible_moves   = valid_moves(game_state)

  possible_moves.each do |move|
    moves_evaluation[move] =
      minimax(game_state, turns_played, move, depth)
  end

  moves_evaluation.values.send(opp_strategy)
end

def minimax(board, turns_played, action, depth = 0)
  game_state = board.dup
  player     = PLAYERS[(depth + 1) % 2]
  opponent   = PLAYERS[(depth % 2)]

  game_state[action] = player
  terminal_state     = check_result(turns_played + 1, game_state)
  return MINIMAX_VALUES[terminal_state] if terminal_state

  opp_strategy = MINIMAX_STRAT[opponent]
  explore_game_tree(game_state, turns_played + 1, depth + 1, opp_strategy)
end

############### PRINTING ###############

def display_game_state(score, board = nil)
  clear_screen
  print_scoreboard(score)
  draw_board(board) if board
end

def draw_board(board)
  board.each_slice(3) do |row|
    puts  L_MARGIN + H_LINE
    puts  L_MARGIN + V_LINES_WITH_SPACE
    print L_MARGIN + V_LINE

    draw_with_symbols(row)

    puts  L_MARGIN + V_LINES_WITH_SPACE
  end
  puts L_MARGIN + H_LINE
end

def draw_with_symbols(row)
  row.each_with_index do |sq_with_value, column_index|
    print board_sq_symbol(sq_with_value) + V_LINE
    puts if column_index == 2
  end
end

def print_scoreboard(score)
  player1 = PLAYERS[0]
  player2 = PLAYERS[1]
  score = "#{player1.upcase} #{score[player1]} : " \
          "#{score[player2]} #{player2.upcase}"

  puts score.center(TOTAL_WIDTH)
end

def print_quit_info
  prompt "Press Control+Z to quit the game at any time"
end

def print_welcome_message
  clear_screen
  puts L_MARGIN + "Welcome to Tic-tac-toe GAME."
  puts L_MARGIN + "You are going to play versus the computer."
  puts L_MARGIN + "The first to win #{POINTS_TO_WIN} rounds wins the game!"
  puts L_MARGIN + "Good luck (you are going to need it)."
  puts
end

def round_summary(round_winner)
  if PLAYERS.include?(round_winner)
    "#{round_winner.upcase} wins the round!"
  else
    "It's a tie!"
  end
end

############### INTERACTING W/ USER ###############

def ask_for_move(board)
  listed_moves = joinor(valid_moves(board))
  mark         = MARKS[:player].upcase
  prompt "Please make a move for #{mark} (#{listed_moves}):"

  loop do
    choice = getch.to_i
    next prompt "Invalid move"     unless board.key?(choice)
    next prompt "Square occupied!" if     board[choice]

    break board[choice] = :player
  end
end

def getch
  char_input = STDIN.getch

  termination_input = TERMINATION_CHARS[char_input]
  abort("Program aborted (#{termination_input})") if termination_input

  char_input
end

def propose_rematch
  prompt "Do you want to play another match? (y/n)"

  answer = take_yes_no_input

  if answer == "n"
    prompt "Thanks for playing. Good bye!"
    exit
  end
end

def take_yes_no_input
  loop do
    answer = getch.downcase

    if %w[y n].include?(answer)
      break answer
    else
      next prompt "Please choose \"y\" or \"n\""
    end
  end
end

def wait_for_any_key
  prompt "Press ANY KEY to continue"
  getch
end

############### UX ###############

def board_sq_symbol(sq_with_value)
  square, value = sq_with_value

  value ? "  #{MARKS[value]}  " : " <#{square}> "
end

def clear_screen
  system("cls") || system("clear")
end

def joinor(array, separator = ", ", word = "or")
  return array.first if array.size < 2

  array[-1] = "#{word} #{array[-1]}"
  array.join(separator)
end

def prompt(message)
  puts PROMPT + message
end

############### THE GAME ###############

print_welcome_message
print_quit_info
wait_for_any_key

loop do
  score  = SCOREBOARD.dup
  winner = nil

  until winner
    board        = EMPTY_BOARD.dup
    player_turns = PLAYERS    .dup
    round_result = nil
    turns_played = 0

    display_game_state(score, board)

    until round_result
      next_move(board, player_turns, turns_played)
      turns_played += 1

      display_game_state(score, board)

      round_result = check_result(turns_played, board)
    end

    prompt round_summary(round_result)
    score[round_result] += 1 unless round_result == :tie
    print_quit_info
    wait_for_any_key

    winner = match_winner(score)
  end

  display_game_state(score)
  puts
  prompt "#{winner.upcase} wins the match!"
  propose_rematch
end
