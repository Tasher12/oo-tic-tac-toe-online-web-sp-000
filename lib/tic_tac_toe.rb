

class TicTacToe
  
  attr_accessor = :board 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num)
    num.to_i - 1 
  end 
  
  def move(board, token = "X")
    @board[board] = token 
  end 
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end 
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O" 
  end 


  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn 
    end
  end

  def won?
    WIN_COMBINATIONS.each do |single_win|
      win_index_1 = single_win[0]
      win_index_2 = single_win[1]
      win_index_3 = single_win[2]
    
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
   
      if position_1 == position_2 && position_2 == position_3 && position_taken?(@board.to_ary)
        single_win
      end
    end
      false
  end

  def full?
    if @board.any? {|index| index == nil || index == " "}
      return false
    else
      return true 
    end
  end

  def draw?
    if !won? && full?
      return true
    else 
      return false 
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board);
      return true
    end
  end


  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
  end




  def play
    until over?(board)
      turn
    end 
    if won?(board)
      winner(board) == "X" || winner(board) == "O"
      winner(board) == "x" || winner(board) == "o"
      puts "Congratulations #{winner(board)}!"
    elsif draw?
      puts "Cat's Game!" 
    end
  end 
end   
  
  
  
  
  
  
  
  
  
  
  
  
  
