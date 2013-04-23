require 'gosu'

require_relative '../lib/fizzix'

class Window < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Fizzix Demo"

    v = Fizzix::Vector.new(100, 100)
    @particle = Fizzix::Particle.new(v)
  end

  def update
    @particle.update!
  end

  def draw
    draw_particle(@particle)
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
