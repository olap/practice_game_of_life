require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GameOfLife" do
  before(:each) do
    @game = Game.new(3,3)
  end

  it "can instantiate" do
    @game.grid.size.should == 9
  end

  it "can birth squares" do
    @game.birth(1,1).should be_true
    @game.birth(1,1).should be_false
  end

  it "can kill squares" do
    @game.kill(1,1).should be_false
    @game.birth(1,1).should be_true
    @game.kill(1,1).should be_true
  end

  it "can count neighours alive" do
    @game.birth(1,0)
    @game.count_neighbours(1,0).should == 0
    @game.birth(1,1)
    @game.count_neighbours(1,1).should == 1
    @game.birth(1,2)
    @game.count_neighbours(1,1).should == 2
  end

  it "can evolve" do
    @game.birth(0,1)
    @game.birth(1,1)
    @game.birth(2,1)
    @game.evolve
    
    @mock = Game.new(3,3)
    @mock.birth(1,0)
    @mock.birth(1,1)
    @mock.birth(1,2)

    Game.compare(@mock, @game).should be_true
  end
end
