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

    def self.make_grid(segements, spacing)
      particles = []
      constraints = []

      segements.times do |x|
        particles << []
        segements.times do |y|
          p = Particle.new(Vector[x * spacing, y * spacing])
          particles[x] << p

          # Pin the top row
          if y == 0
            constraints << PinConstraint.new(p)
          end

          if x > 0
            constraints << DistanceConstraint.new(p, particles[x - 1][y], 0.02)
          end

          if y > 0
            constraints << DistanceConstraint.new(p, particles[x][y - 1], 0.02)
          end
        end

      end

      Composite.new(particles.flatten, constraints)
    end
  end
end
