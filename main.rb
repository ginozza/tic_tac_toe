require_relative "methods"

# Initialization of a square matrices
board = Array.new(3) { Array.new(3, nil) }

current_player = "X"
loop do
  display_board(board)
  row, column = get_movement(board, current_player)
  update_board(board, row, column, current_player)
  if check_winner(board, current_player)
    display_board(board)
    puts "¡Player #{current_player} has won!"
    break
  elsif board.flatten.none?(&:nil?)
    display_board(board)
    puts "¡It's a tie!"
    break
  else
    current_player = current_player == "X" ? "O" : "X"
  end
end
