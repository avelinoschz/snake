require "ruby2d"

module View
  class Ruby2dView
    def initialize
      @pixel_size = 50
    end

    def render(state)
      extend Ruby2D::DSL
      set(
        title: "Snake", 
        width: @pixel_size * state.grid.cols, 
        height: @pixel_size * state.grid.rows
      )
      render_snake(state)
      render_food(state)
      show
    end

    private

    def render_food(state)
    end

    def render_snake(state)
    end
  end
end

