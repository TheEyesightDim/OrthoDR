# !INCOMPLETE!

class AnimationHandler
  # Internal class for holding the animation
  class AnimEntity
    attr_accessor :entity, :animations

    def initialize(entity, animations)
      @entity = entity
      # Even if you pass in a single animation, should still be an Array here
      @animations = [animations].flatten
    end
  end

  def initialize
    @entity_list = []
  end

  def register_entity(entity, animations = [])
    @entity_list << AnimEntity.new(entity, animations)
  end

  def advance
    @entity_list.each do |e|
      e.animations.each { |a| a.call(e) }
    end
  end
end

# What should an animation look like?
# Animations are Procs (created with Proc.new), or a lambda, with the following signature:
# fn(entity, active)
