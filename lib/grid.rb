class Grid
  attr_reader :height, :width
  attr_accessor :grid

  def self.two_d_init(two_dimension)
    grid = Grid.new(two_dimension[0].size, two_dimension.size)
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
    #TODO
  end
end
