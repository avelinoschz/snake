require 'minitest/autorun'
require_relative '../src/actions/actions'
require_relative '../src/model/state'

class ActionsTest < Minitest::Test
	def test_move_snake
		initial_snake = Model::Snake.new(
	      [
	        Model::Coord.new(1, 1),
	        Model::Coord.new(0, 1)
	      ]
	    )
	    initial_food = Model::Food.new(4, 4)
	    initial_grid = Model::Grid.new(8, 12)
	    initial_next_direction = Model::Direction::DOWN
	    initial_state = Model::State.new(initial_snake, initial_food, initial_grid, initial_next_direction, false)

	    expected_snake = Model::Snake.new(
	      [
	        Model::Coord.new(2, 1),
	        Model::Coord.new(1, 1)
	      ]
	    )
	    expected_food = Model::Food.new(4, 4)
	    expected_grid = Model::Grid.new(8, 12)
	    expected_next_direction = Model::Direction::DOWN
	    expected_state = Model::State.new(expected_snake, expected_food, expected_grid, expected_next_direction, false)

	    actual_state = Actions::move_snake(initial_state)
	    assert_equal actual_state, expected_state
	end
end