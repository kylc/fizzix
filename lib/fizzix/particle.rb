module Fizzix
  class Particle
    attr_accessor :pos

    attr_reader :last_pos

    # Public: Initialize a new Particle.
    #
    # pos - An initial Vector.
    #
    # Returns a new Particle.
    def initialize(pos)
      @pos = pos
      @last_pos = pos
    end

    # Public: Determine the new position of the particle, taking into account
    # gravity and inertia.
    #
    # Returns the new position.
    def update!
      velocity = @pos - @last_pos

      @last_pos = @pos

      @pos += Fizzix::GRAVITY
      @pos += velocity
    end
  end
end
