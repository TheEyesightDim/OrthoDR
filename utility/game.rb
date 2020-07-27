module ODR
  # A class which encapsulates the `$gtk.args` object and the game loop.
  class GameInstance
    def initialize(args)
      @args = args
      @state = args.state
      @outputs = args.outputs
      @gtk = args.gtk
    end

    def tick
      queue_input
      calc_state
      render
    end

    def queue_input
    end

    def calc_state
    end

    def render
    end
  end
end
