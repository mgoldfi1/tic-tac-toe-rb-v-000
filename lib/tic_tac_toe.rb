WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
  end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board,index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    true
  end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end



def turn(board)
  user_input = gets.strip
  index = input_to_index(user_input)
  puts "Please enter 1-9:"
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]
board[index_1] == board[index_2] && board[index_2]  == board[index_3] && position_taken?(board,index_1)
end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
