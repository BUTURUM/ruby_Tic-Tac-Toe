class Game
  attr_reader :current_player, :winner, :finished

  def initialize
    @board = Board.new
    @current_player = true
    @winner = nil
    @finished = false
  end

  private

  def update
    if @board.has_won?(@current_player)
      @winner = @current_player
      @finished = true
    elsif @board.full?
      @finished = true
    else
      @current_player = !@current_player
    end
  end

  public

  def make_move(cell_number)
    @board.mark_cell(cell_number, @current_player)
    update
  end

  def board_content
    @board.content.clone.freeze
  end
end
