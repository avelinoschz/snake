# frozen_string_literal: true

require_relative 'view/ruby2d'
require_relative 'model/state'
require_relative 'actions/actions'

# App - main class in charge of running the game
class App
  def initialize
    @state = Model::initial_state
  end

  def start
    view = View::Ruby2dView.new
    Thread.new { init_timer(view) }
    view.start(@state)
  end

  def init_timer(view)
    loop do
      # trigger movement
      @state = Actions::move_snake(@state)
      view.render_game(@state)
      # stops and moves  every half second
      sleep 0.5
    end
  end
end

app = App.new
app.start
