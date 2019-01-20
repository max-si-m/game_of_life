# frozen_string_literal: true

require 'byebug'

class Cell
  attr_accessor :x, :y, :live

  def initialize(x, y)
    @x = x
    @y = y
    @live = false
  end

  # FIXME: don't like that have to pass world to cell
  def neighbours(world)
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) }.compact
  end

  private

  # For example we have cell in x = 2, y = 2
  # So we have to check all possible cells from  [1..3] U [1..3]
  # -|-|-|-|-|-
  # -|-|2|-|-|-
  # -|-|-|-|-|-
  # Like this:
  # -|*|*|*|-|-
  # -|*|2|*|-|-
  # -|*|*|*|-|-

  def neighbours_coordinates
    coordinates = [x - 1, x, x + 1].product([y - 1, y, y + 1])
    coordinates.delete([x, y])
    coordinates
  end
end
