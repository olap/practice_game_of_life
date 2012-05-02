class Cell
  def initialize(alive = false)
    @alive = alive
  end

  def alive?
    @alive
  end

  def to_s
    @alive ? "x" : "."
  end
end
