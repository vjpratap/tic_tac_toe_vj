require 'spec_helper'

RSpec.describe 'Board test' do

  before(:each) do
    @board = Board.new()
    @location = Location.new(1,1)
  end

  it 'test mark tile should increase the count of the number of count' do
    expect(@board.number_of_terns).to eq 0
    @board.mark_tile(@location, :O)
    expect(@board.number_of_terns).to eq 1
  end

  it 'test should check the tile is marked or not' do
    expect(@board.is_tile_not_marked?(@location)).to be true
    @board.mark_tile(@location, :O)
    expect(@board.is_tile_not_marked?(@location)).to be false
  end

  it 'test is_game_finish? should return false when ' do
    # expect(@board.is_game_finish?(:X)).to be false
    # expect(@board.is_game_finish?(:O)).to be false
    # @board.tile = [[:O, :X, :X], [:X, :O, :O], [:O, :X, :O]]
    # expect(@board.is_game_finish?(:X)).to be false
    # expect(@board.is_game_finish?(:O)).to be false
  end
end
