require __dir__ + '/board'
require __dir__ + '/player'
require __dir__ + '/game_status'

class Game

  attr_reader :current_player, :status
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @status = GameStatus::NEXT_MOVE
  end

  def restart
    @current_player = @player1
    @status = GameStatus::NEXT_MOVE
    @board.restart
  end

  def play_move(location)
    if @status == GameStatus::NEXT_MOVE
      @board.mark_tile(location, @current_player.symbol)
      @status = check_game_status
      @current_player = change_player
    end
    return status
  end

  private

  def is_win?
    @board.is_game_finish?(@current_player.symbol)
  end

  def winner
    @current_player = change_player
    return @current_player == @player1 ? GameStatus::PLAYER_1_WINS : GameStatus::PLAYER_2_WINS
  end

  def check_game_status
    number_of_terns = @board.number_of_terns
    if number_of_terns < 5
      return GameStatus::NEXT_MOVE
    elsif is_win?
      return winner
    elsif number_of_terns == 9
      return GameStatus::DRAW
    end
    return GameStatus::NEXT_MOVE
  end

  def change_player
    return @current_player == @player1 ? @player2 : @player1
  end

end