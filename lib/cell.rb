# frozen_string_literal: true

require 'byebug'

class Cell
  attr_accessor :x, :y, :live, :world

  def initialize(world, x, y, live: true)
    @world = world
    @x = x
    @y = y
    @live = live
  end

  def neighbours
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) }.compact
  end

  def alive_neighbour_count
    neighbours.select(&:live).length
  end

  def toggle
    live ? toggle_live : toggle_dead
  end

  def kill!
    @live = false
  end

  def live!
    @live = true
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

  def toggle_live
    kill! if should_be_killed?
  end

  def toggle_dead
    live! if can_reproduce?
  end

  def should_be_killed?
    alive_neighbour_count < 2 || alive_neighbour_count > 3
  end

  def can_reproduce?
    alive_neighbour_count == 3
  end
end
