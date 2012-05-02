require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GameOfLife" do
  it "can instantiate" do
    grid = Grid.new(3,3)
    grid.grid.size.should == 9
  end
end
