class Triangle
  attr_reader :kind

  def initialize(side1, side2, side3)
    sides = [side1, side2, side3]
    raise ArgumentError unless valid_side_lengths?(sides)

    @sides = sides
    @kind = find_kind
  end

  private

  def valid_side_lengths?(sides)
    sides.all?(&:positive?) &&
      sides.none? { |side| side >= (sides.sum - side) }
  end

  def find_kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end
end
