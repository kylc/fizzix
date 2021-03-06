require 'gosu'

require_relative '../lib/fizzix'

class Window < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Fizzix Demo"

    @composite = Fizzix::Composite.make_grid(10, 5)
  end

  def update
    @composite.update!
  end

  def draw
    draw_composite(@composite)
  end

  def draw_composite(c)
    # We won't draw the individual points for a cloth demo, only the
    # constraints.

    # c.particles.each do |p|
    #   draw_particle(p)
    # end

    c.constraints.each do |s|
      draw_constraint(s)
    end
  end

  def draw_constraint(s)
    sx, sy = s.a.pos[0], s.a.pos[1]
    ex, ey = s.b.pos[0], s.b.pos[1]

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
