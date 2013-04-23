module Fizzix
  class Vector
    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x.to_f, y.to_f
    end

    def +(o)
      Vector.new(self.x + o.x, self.y + o.y)
    end

    def -(o)
      Vector.new(self.x - o.x, self.y - o.y)
    end

    def *(o)
      Vector.new(self.x * o.x, self.y * o.y)
    end

    def /(o)
      Vector.new(self.x / o.x, self.y / o.y)
    end

    def scale(c)
      Vector.new(self.x * c, self.y * c)
    end

    def length
      Math::sqrt(length2)
    end

    def length2
      self.x ** 2 + self.y ** 2
    end
  end
end
