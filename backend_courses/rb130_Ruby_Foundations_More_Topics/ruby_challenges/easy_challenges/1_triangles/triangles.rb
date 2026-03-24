class ArgumentError < StandardError
end

class Triangle
  def initialize(side1, side2, side3)
    raise ArgumentError unless valid_triangle?(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    @sides.each do |side|
      if @sides.count(side) == 3
        return 'equilateral'
      elsif @sides.count(side) == 2
        return 'isosceles'
      end
    end

    @sides.all? do |side|
      return 'scalene' if @sides.count(side) == 1
    end
  end

  private

  def valid_triangle?(side1, side2, side3)
    sides = [side1, side2, side3]
    
    two_sides = [0, 1, 2].all? do |idx|
      remaining = sides.dup
      current_side = remaining.delete_at(idx)

      remaining.sum > current_side
    end

    all_not_zero = sides.none? { |side| side.zero? }

    two_sides && all_not_zero
  end
end
