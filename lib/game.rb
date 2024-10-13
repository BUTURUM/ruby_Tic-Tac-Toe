require_relative 'board'
require_relative 'display'

class Game
  def initialize
    @board = Board.new
    @current_player = true

    @outcome = nil
    @finished = false
  end

  def input_cell
    print 'Which cell do you want to mark? '
    cell_number = gets.chomp.to_i

    unless cell_number.between?(1, 9)
      puts 'This is invalid cell number'
      return input_cell
    end

    cell_number -= 1

    unless @board.free_cell?(cell_number)
      puts 'This cell already occupied'
      return input_cell
    end

    cell_number
  end

  def make_move
    @board.mark_cell(input_cell, @current_player)

    if @board.won?(@current_player)
      @outcome = @current_player
      @finished = true
    elsif @board.full?
      @finished = true
    end

    @current_player = !@current_player
  end

  def play
    until @finished
      announce_player(@current_player)
      print_board(@board.content)

      make_move
    end

    announce_winner(@outcome)
    print_board(@board.content)
  end
end
