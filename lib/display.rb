def print_board(board_content) # rubocop:disable Metrics/MethodLength
  puts '-' * 13
  board_content.each_with_index do |cell, index|
    if cell.nil?
      print "| #{index + 1} "
    else
      print "| #{cell ? "\e[31mx" : "\e[34mo"}\e[0m "
    end
    if ((index + 1) % 3).zero?
      print "|\n"
      puts '-' * 13
    end
  end
end

def announce_player(player_mark)
  if player_mark
    puts "\e[31mCrosses\e[0m to move"
  else
    puts "\e[34mNought\e[0m to move"
  end
end

def announce_winner(player_mark)
  puts(
    case player_mark
    when true then "\e[31mCrosses\e[0m have won!"
    when false then "\e[34mNought\e[0m have won!"
    else 'Game have ended in draw!'
    end
  )
end

def input_cell # rubocop:disable Metrics/MethodLength
  print 'Which cell do you want to mark?: '
  begin
    cell_number = Integer(gets.chomp)
  rescue ArgumentError
    puts "This isn't valid cell"
    return input_cell
  end

  if cell_number.between?(1, 9)
    cell_number - 1
  else
    puts "This isn't valid cell"
    input_cell
  end
end

def place_move(game)
  game.make_move(input_cell)
rescue OccupiedError
  puts 'This cell is already occupied'
  place_move(game)
end
