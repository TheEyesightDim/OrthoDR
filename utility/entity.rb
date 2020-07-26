module ODR

  # A base class for representing DragonRuby's output primitives via duck typing.
  class RenderEntity
    include ODR::Serialization
    # Accessors for all DR output primitive types
    attr_accessor :x, :y, :r, :g, :b, :a, :w, :h, :x2, :y2,
                  :text, :size_enum, :alignment_enum, :font,
                  :path, :angle, :source_x, :source_y, :source_w, :source_h,
                  :flip_horizontally, :flip_vertically, :angle_anchor_x, :angle_anchor_y,
                  :default_marker

    def initialize(property_hash = {}, default_marker = :sprite)
      @default_marker = default_marker
      property_hash.each do |k, v|
        instance_variable_set("@#{k}", v)
      end
    end

    def primitive_marker
      @default_marker
    end

    # def update_properties(property_hash)
    #   property_hash.each do |k, v|
    #     instance_variable_set("@#{k}", v)
    #   end
    # end

    # The `as_<primitive>` family of methods creates a shallow copy of the instance
    # with Object#dup, then returns that copy with an altered default_marker
    # def as_label
    # end

    # def as_solid
    # end

    # def as_border
    # end

    # def as_line
    # end

    # def as_sprite
    # end
  end

  # A subclass of RenderEntity specialized for animation.
  class AnimatedEntity < RenderEntity
    # A helper class for holding animation functions and their current frame number.
    class Animation
      attr_accessor :name, :fn, :frame

      def initialize(name, frame = 0, &anim_fn)
        @name = name
        @fn = anim_fn
        @frame = frame
      end

      def step(entity)
        @fn.call(entity, @frame)
        @frame += 1
      end
    end

    def initialize(property_hash = {}, default_marker = :sprite)
      @animation_list = []
      super
    end

    def add_animation(name, start_frame = 0, &anim_fn)
      @animation_list << Animation.new(name, start_frame, &anim_fn)
    end

    def next_frame
      @animation_list.each { |anim| anim.step(self) }
      self
    end
  end
end
