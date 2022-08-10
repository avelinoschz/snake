# frozen_string_literal: true

# Model - wraps all the elements in the game
module Model
  # Direction - simply has all the 4 directions of the snake
  module Direction
    UP = :up
    RIGHT = :right
    DOWN = :down
    LEFT = :left
  end

  # Coord - representation of positions in the grid
  class Coord < Struct.new(:row, :col)
  end

  # Food - food element occupying a single space in the grid
  class Food < Coord
  end

  # Snake - player snake object. Basically an array of coords
  class Snake < Struct.new(:positions)
  end

  # Grid - Play zone represented like a grid of rows and cols
  class Grid < Struct.new(:rows, :cols)
  end

  # State - stores all the game state.
  # Every movement the state is being updated, and so the view, objs, etc.
  class State < Struct.new(:snake, :food, :grid, :next_direction, :game_over)
  end

  # this is a class (or module) method
  def self.initial_state
    snake = Model::Snake.new(
      [
        Model::Coord.new(1, 1),
        Model::Coord.new(0, 1)
      ]
    )

    food = Model::Food.new(4, 4)

    grid = Model::Grid.new(8, 12)

    next_direction = Direction::DOWN

    Model::State.new(snake, food, grid, next_direction, false)
  end
end
