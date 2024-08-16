def get_movement(board, player) # rubocop:disable Metrics/MethodLength
  loop do
    puts "Player #{player}, enter your movement (row, and column, separated by a space):"
    input = gets.chomp
    begin
      row, col = input.split.map(&:to_i)
      row -= 1
      col -= 1
      if row.negative? || row >= board.size || row.zero? || col.negative? || col >= board.size || col.zero?
        raise ArgumentError, "Invalid row or column"
      end

      return [row, col]
    rescue ArgumentError => e
      puts "Invalid input: #{e.message}. Please try again"
    rescue StandardError
      puts "Invalid input. Please enter a row and column separated by a space"
    end
  end
end

def display_board(board)
  board.each do |row|
    puts row.map { |c| c.nil? ? " " : c }.join(" | ")
    puts "---+---+---"
  end
end

def update_board(board, row, col, player)
  board[row][col] = player
end

def check_winner(board, player)
  # Check rows and columns
  3.times do |i|
    return true if board[i].all? { |col| col == player }
    return true if board.all? { |row| row[i] == player }
  end
  # Check diagonals
  return true if (0..2).all? { |i| board[i][i] == player }
  return true if (0..2).all? { |i| board[i][2 - i] == player }

  false
end