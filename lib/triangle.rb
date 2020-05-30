require 'pry'
class Triangle

  attr_reader :side_1, :side_2, :side_3
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def is_valid()
    return false if (side_1 <= 0 && side_2 <= 0 && side_3 <= 0)
    (side_1 + side_2 > side_3) && (side_1 + side_3 > side_2) && (side_2 + side_3 > side_1) 
  end

  def kind()
    if !is_valid()
      begin 
        raise TriangleError
      end
    else
      return get_type()
    end
  end

  def get_type()
    if (side_1() == side_2() && side_2() == side_3())
      return :equilateral
    elsif (side_1() == side_2() || side_1() ==side_3() || side_2() == side_3())
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
      def message()
        "Invalid Triangle"
      end
  end
end

binding.pry()
0
