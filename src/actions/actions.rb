# frozen_string_literal: true

# Actions - module for all the snake actions
module Actions
  def self.move_snake(state)
    # next_direction = state.next_direction
    next_position = calc_next_position(state)
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end

  private

  def self.calc_next_position(state)
    curr_position = state.snake.positions.first
    case state.next_direction
    when Model::Direction::UP
      return Model::Coord.new(
        curr_position.row - 1,
        curr_position.col
      )
    when Model::Direction::RIGHT
      return Model::Coord.new(
        curr_position.row,
        curr_position.col + 1
      )
    when Model::Direction::DOWN
      return Model::Coord.new(
        curr_position.row + 1,
        curr_position.col
      )
    when Model::Direction::LEFT
      return Model::Coord.new(
        curr_position.row,
        curr_position.col - 1
      )
    end
  end

  def self.position_is_valid?(state, position)
    # verify is not colliding with the grid edge
    is_invalid = (position.row >= state.grid.rows || position.row < 0) || (position.col >= state.grid.cols || position.col < 0)
    return false if is_invalid
    # verify is not colliding with a current snake position
    return !(state.snake.positions.include? position) 
  end


  def self.move_snake_to(state, next_position)
    # the head moves to the next position based on the direction
    # then all the other body points follow along, except the tail
    # whenever the snake is moving, the tail or last coord, needs to be removed
    # three dots is a non-inclusive range
    new_positions = [next_position] + state.snake.positions[0...1]
    state.snake.positions = new_positions
    state
  end

  def self.end_game(state)
    state.game_over = true
    state
  end
end
