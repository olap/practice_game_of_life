require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GameOfLife" do
  before(:each) do
    @game = Game.new(3,3)
  end

  it "can instantiate" do
    @game.grid.size.should == 9
  end

  it "can count neighours alive" do
    @game.grid[[1,1]] = Cell.new(true)
    @game.count_neighbours(1,1).should == 0
  end

  it "can evolve" do
    @game.grid[[1,1]] = Cell.new(true)
    @game.evolve
    Game.compare(Game.new(3,3), @game).should be_true
  end
end
