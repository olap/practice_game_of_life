Given /^the following setup$/ do |table|
  table.should be_kind_of(Cucumber::Ast::Table)
  @game = Game.two_d_init(table.raw)
  @height = table.raw.size
  @width = table.raw[0].size
end

When /^I evolve the board$/ do
  @game.evolve
end

Then /^the center cell should be dead$/ do
  @game.game[[@height/2,@width/2]].alive?.should be_false
end

Then /^the center cell should be alive$/ do
  @game.game[[@height/2,@width/2]].alive?.should be_true
end

Then /^I should see the following board$/ do |table|
  table.should be_kind_of(Cucumber::Ast::Table)
  @new_game = Game.two_d_init(table.raw)
  Game.compare(@new_game, @game).should be_true
end
