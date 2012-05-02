require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GameOfLife" do
  it "can instantiate" do
    game = Game.new(3,3)
    game.grid.size.should == 9
  end

  it "can count neighours alive" do
     game = Game.new(3,3)
     game.grid[[1,1]] = Cell.new(true)
     game.count_neighbours(1,1).should == 0
  end
end
