require 'spec_helper'

RSpec.describe 'Tic Tac Toe test' do

  before(:each) do
    @board = Board.new
    @location = Location.new(1,1)
    @player1 = Player.new("Vijay", :X)
    @player2 = Player.new("Ajay", :O)
    @game = Game.new(@board, @player1, @player2)
    @tic_Tak_Toe_controller = TicTakToe.new
  end

  it 'validate input should return false when invalid input' do
    expect(@tic_Tak_Toe_controller.validate_input?("1,2,3,4")).to be false
    expect(@tic_Tak_Toe_controller.validate_input?("1")).to be false
    expect(@tic_Tak_Toe_controller.validate_input?("1,w")).to be false
    expect(@tic_Tak_Toe_controller.validate_input?("w,2")).to be false
    expect(@tic_Tak_Toe_controller.validate_input?("3,4")).to be false
  end

  it 'validate input should return true when valid input' do
    expect(@tic_Tak_Toe_controller.validate_input?("1,2")).to be true
    expect(@tic_Tak_Toe_controller.validate_input?("1,1")).to be true
    expect(@tic_Tak_Toe_controller.validate_input?("0,0")).to be true
  end

end
