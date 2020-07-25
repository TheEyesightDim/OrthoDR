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
end
