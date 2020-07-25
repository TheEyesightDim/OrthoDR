module ODR

  # A mixin module for adding serialization support to objects in DR.
  module Serialization
    def serialize
      h = {}
      instance_variables.each do |iv|
        h[iv] = instance_variable_get(iv)
      end
      h
    end

    def inspect
      serialze.to_s
    end

    def to_s
      serialize.to_s
    end
  end
end
