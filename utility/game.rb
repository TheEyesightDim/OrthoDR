module ODR
  # A base class which encapsulates the `$gtk.args` object and the game loop.
  # **Override this class** and implement your own `#game_logic` method
  # with your game's code.
  class GameInstance
    def initialize(args)
      @args = args
      @state = args.state
      @outputs = args.outputs
      @gtk = args.gtk
    end

    def tick
      queue_input
      game_logic
      render
    end

    def queue_input
    end

    def game_logic
    end

    def render
    end
  end
end
