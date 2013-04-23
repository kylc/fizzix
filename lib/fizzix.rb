require_relative 'fizzix/vector'
require_relative 'fizzix/particle'
require_relative 'fizzix/constraints'
require_relative 'fizzix/composite'

module Fizzix
  RELAXATION_STEPS = 16
  RELAXATION_STEP_COEF = 1.0 / RELAXATION_STEPS

  GRAVITY = Fizzix::Vector.new(0, 0.02)
end
