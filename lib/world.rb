# frozen_string_literal: true

class World
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def add(cell)
    cells << cell
  end
end
