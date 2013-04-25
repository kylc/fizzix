module Fizzix
  class Vector
    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def +(o)
      Vector.new(@x + o.x, @y + o.y)
    end

    def -(o)
      Vector.new(@x - o.x, @y - o.y)
    end

    def *(o)
      Vector.new(@x * o.x, @y * o.y)
    end

    def /(o)
      Vector.new(@x / o.x, @y / o.y)
    end

    def scale(c)
      Vector.new(@x * c, @y * c)
    end

    def length
      Math::sqrt(length2)
   end

    def length2
      @x ** 2 + @y ** 2
    end
  end
end
