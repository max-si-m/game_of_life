# frozen_string_literal: true

require_relative 'cell'

class World
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def add(cell)
    cells << cell
  end

  def cell_at(x, y)
    cells.find { |c| c.x == x && c.y == y }
  end

  def next_generation
    cells.map(&:toggle)
  end
end
