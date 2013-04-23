module Fizzix
  class Composite
    attr_reader :particles

    attr_reader :constraints

    def initialize(particles, constraints)
      @particles = particles
      @constraints = constraints
    end

    def update!
      @particles.each(&:update!)

      RELAXATION_STEPS.times do
        @constraints.each { |c| c.relax!(RELAXATION_STEP_COEF) }
      end
    end

    def self.make_line_segements(vs, stiffness)
      constraints = []

      vs.each_cons(2) do |(a, b)|
        constraints << DistanceConstraint.new(a, b, stiffness)
      end

      Composite.new(vs, constraints)
    end
  end
end
