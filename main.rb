require_relative 'lib/board'
require_relative 'lib/display'
require_relative 'lib/game'

game = Game.new

until game.finished
  announce_player(game.current_player)
  print_board(game.board_content)
  place_move(game)
  print "\n"
end

announce_winner(game.winner)
print_board(game.board_content) unless game.winner.nil?
