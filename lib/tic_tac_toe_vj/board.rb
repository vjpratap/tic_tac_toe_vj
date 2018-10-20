require __dir__ + '/location'

class Board
  BOARD_SIZE = 3

  attr_reader :tile

  def initialize()
    @number_of_tiles_marked = 0
    @tile = Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
  end

  def mark_tile(location, mark)
    if is_tile_not_marked?(location)
      @tile[location.row][location.column] = mark
      @number_of_tiles_marked += 1
    end
  end

  def is_tile_not_marked?(location)
    return @tile[location.row][location.column].nil?
  end

  def number_of_terns
    @number_of_tiles_marked
  end

  def is_game_finish?(player_symbol)
    return check_left_diognal?(player_symbol) || chek_right_diognal?(player_symbol) || check_row?(player_symbol) || check_column?(player_symbol)
  end

  private

  def check_left_diognal?(player_symbol)
    check_win = true
    BOARD_SIZE.times do |index|
      check_win = @tile[index][index] == player_symbol
      return false if !check_win
    end
    return true
  end

  def chek_right_diognal?(player_symbol)
    check_win = true
    BOARD_SIZE.times do |index|
      check_win = @tile[index][BOARD_SIZE - 1 - index] == player_symbol
      return false if !check_win
    end
    return true
  end

  def check_row?(player_symbol)
    BOARD_SIZE.times do |row|
      check_win = true
      BOARD_SIZE.times do |column|
        check_win = check_win && @tile[row][column] == player_symbol
      end
      return true if check_win
    end
    return false
  end

  def check_column?(player_symbol)
    BOARD_SIZE.times do |row|
      check_win = true
      BOARD_SIZE.times do |column|
        check_win = check_win && @tile[column][row] == player_symbol
      end
      return true if check_win
    end
    return false
  end
end