# frozen_string_literal: true

require_relative 'view/ruby2d'
require_relative 'model/state'

# App - main class in charge of running the game
class App
  def start
    view = View::Ruby2dView.new
    initial_state = Model::initial_state
    view.render(initial_state)
  end

  def init_timer
    loop do
      # stops and moves  every half second
      sleep 0.5
      # trigger movement
    end
  end
end
