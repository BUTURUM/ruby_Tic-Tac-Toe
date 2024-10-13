WIN_CASES = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]
            .map(&:freeze)
            .freeze

class Board
  attr_reader :content

  def initialize
    @content = Array.new(9)
  end

  def mark_cell(cell_number, player_mark)
    @content[cell_number] = player_mark
  end

  def free_cell?(cell_number)
    @content.fetch(cell_number).nil?
  end

  def won?(player_mark)
    WIN_CASES.any? do |win_case|
      @content.values_at(*win_case).all?(player_mark)
    end
  end

  def full?
    !@content.include?(nil)
  end
end
