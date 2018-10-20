require 'spec_helper'

RSpec.describe 'Game test' do

  before(:each) do
    @board = Board.new()
    @location = Location.new(1,1)
    @player1 = Player.new("Vijay", :X)
    @player2 = Player.new("Ajay", :O)
    @game = Game.new(@board, @player1, @player2)
  end

  it 'play move should change the status' do
    expect(@game.current_player).to eq @player1
    @game.play_move(@location)
    expect(@game.current_player).to eq @player2
  end

end
