require 'gosu'

require_relative '../lib/fizzix'

class Window < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Fizzix Demo"

    # vs = [Fizzix::Particle.new(Fizzix::Vector.new(100, 100)),
    #       Fizzix::Particle.new(Fizzix::Vector.new(200, 200)),
    #       Fizzix::Particle.new(Fizzix::Vector.new(210, 200)),
    #       Fizzix::Particle.new(Fizzix::Vector.new(200, 220)),
    #       Fizzix::Particle.new(Fizzix::Vector.new(300, 200))]
    # @composite = Fizzix::Composite.make_line_segements(vs, 0.02)
    # @composite.constraints << Fizzix::PinConstraint.new(vs[3])
    @composite = Fizzix::Composite.make_grid(20, 10)
  end

  def update
    @composite.update!
  end

  def draw
    draw_composite(@composite)
  end

  def draw_composite(c)
    # c.particles.each do |p|
    #   draw_particle(p)
    # end

    c.constraints.each do |s|
      draw_constraint(s)
    end
  end

  def draw_constraint(s)
    sx, sy = s.a.pos.x, s.a.pos.y
    ex, ey = s.b.pos.x, s.b.pos.y


    c = Gosu::Color::WHITE
    draw_line(sx, sy, c, ex, ey, c)
  end

  def draw_particle(p)
    x, y = p.pos.x, p.pos.y
    c = Gosu::Color::WHITE
    draw_quad(x - 3, y + 3, c,
              x + 3, y + 3, c,
              x + 3, y - 3, c,
              x - 3, y - 3, c)
  end
end

window = Window.new
window.show
