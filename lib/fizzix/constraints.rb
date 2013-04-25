module Fizzix
  class Constraint
    # The first particle.
    attr_reader :a

    # The second particle.
    attr_reader :b

    def initialize(a, b)
      @a, @b = a, b
    end
  end

  class DistanceConstraint < Constraint
    attr_reader :stiffness

    attr_reader :resting_dist

    def initialize(a, b, stiffness, resting_dist=nil)
      @stiffness = stiffness
      @resting_dist = resting_dist ? resting_dist : (a.pos - b.pos).magnitude

      super a, b
    end

    def relax!(coef)
      norm = @a.pos - @b.pos
      l = norm.magnitude ** 2

      norm = norm * (((@resting_dist ** 2 - l) / l) * @stiffness * coef)

      @a.pos += norm
      @b.pos -= norm
    end
  end

  class PinConstraint < Constraint
    def initialize(a)
      @pinned_pos = a.pos

      super a, a
    end

    def relax!(coef)
      @a.pos = @pinned_pos
    end
  end
end
