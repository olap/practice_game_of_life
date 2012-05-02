class Game
  attr_reader :height, :width
  attr_accessor :grid

  def self.two_d_init(two_dimension)
    grid = Game.new(two_dimension[0].size, two_dimension.size)
    two_dimension.each_with_index do |row, x|
      row.each_with_index do |col, y|
        grid.grid[[x,y]] = Cell.new(col == 'x')
      end
    end
    grid
  end

  def self.compare(a, b)
    a.to_s === b.to_s
  end

  def initialize(width, height)
    @height = height
    @width = width
    @grid = Hash.new(Cell.new)
    height.times do |x|
      width.times do |y|
        @grid[[x,y]] = Cell.new
      end
    end
  end

  def to_s
    out = "| "
    @height.times do |x|
      @width.times do |y|
        out += @grid[[x,y]].to_s + " | "
      end
      out = out[0..-2]
      out += "\n| "
    end
    out = out[0..-4]
    out
  end

  def evolve
    new_grid = grid
    @height.times do |x|
      @width.times do |y|
        count = count_neighbours(x,y)
        result = nil
        if grid[[x,y]].alive?
          # Less than 2 or more than 3 alive neighbours, kill it!
          result = !((count < 1) || (count > 3))
        else
          # Need 3 alive neighbours to spawn next
          result = (count > 3)
        end
        new_grid[[x,y]] = Cell.new(result)
      end
    end
  end

  def count_neighbours(x,y)
    0
  end
end