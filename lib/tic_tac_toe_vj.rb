require "tic_tac_toe_vj/version"
require 'tic_tac_toe_vj/board'
require 'tic_tac_toe_vj/game'
require 'tic_tac_toe_vj/player'
require 'tic_tac_toe_vj/location'
require 'tic_tac_toe_vj/game_status'

class TicTakToe
  include TicTacToeVj
  include GameStatus

  def initialize(player1_name="player1", player2_name="player2")
    @board = Board.new
    @tile_location = Location.new(0,0)
    @player1 = Player.new(player1_name, :O)
    @player2 = Player.new(player2_name, :X)
    @game = Game.new(@board, @player1, @player2)
  end

  def start
    puts "Tic tak toe is starting -------------"
    sleep(1)
    puts "turns should be write as row coma column ex 1,1 this will Enter your Symbol in the middle"
    sleep(0.5)
    user_play_move
  end

  def validate_input?(user_input)
    split_input = user_input.split(",")
    validate = split_input.length == 2
    if validate
      split_input.each do |index|
        validate = validate && check_int?(index) && index.to_i >= 0 && index.to_i <= 2
      end
    end
    return validate
  end

  def reset_game
    @board = Board.new
    @tile_location = Location.new(0,0)
    @player1 = Player.new(@player1.name, :cross)
    @player2 = Player.new(@player2.name, :zero)
    @game = Game.new(@board, @player1, @player2)
    start
  end

  private

  def update_game_after_move(gamestatus)
    case gamestatus
    when GameStatus::NEXT_MOVE
      puts "your turn #{@game.current_player.name}"
      user_play_move
    when GameStatus::DRAW
      puts "its a draw"
      puts "Game is starting again"
      sleep(1)
      reset_game
    else
      "#{@game.current_player.name} wins"
    end
  end

  def check_int?(int)
    result = Integer(int) rescue false
    return result == false ? false : true
  end

  def user_play_move
    @board.tile.each do |row|
      row.each do |column|
        print " #{column} "
      end
      puts " "
    end

    puts "Enter your turn #{@game.current_player.name}"
    location = gets.chomp
    if validate_input?(location)
      move_locations = location.split(",")
      @tile_location = Location.new(move_locations[0].to_i,move_locations[1].to_i)
      if @board.is_tile_not_marked?(@tile_location)
        @board.mark_tile(@tile_location, @game.current_player.symbol)
        @game.play_move(@tile_location)
      else
        puts "location is already marked please do turns again"
        user_play_move
      end
    else
      puts "invalid input please give a valid input in the form of 1,1"
    end
    update_game_after_move(@game.status)
    end
end