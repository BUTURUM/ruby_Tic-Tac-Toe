WIN_CASES = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]
            .map(&:freeze)
            .freeze

class OccupiedError < StandardError; end

class Board
  attr_reader :content

  def initialize
    @content = Array.new(9)
  end

  def mark_cell(cell_number, player_mark)
    raise OccupiedError unless @content.fetch(cell_number).nil?

    @content[cell_number] = player_mark
    true
  end

  def has_won?(player_mark) # rubocop:disable Naming/PredicateName
    WIN_CASES.any? do |win_case|
      @content.values_at(*win_case).all? { |cell| cell == player_mark }
    end
  end

  def full?
    !@content.include?(nil)
  end
end
