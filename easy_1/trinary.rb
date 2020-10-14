class Trinary
  BASE = 3
  NOT_TRINARY = /[^0-2]/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary.match?(NOT_TRINARY)
    @trinary
      .chars
      .reverse
      .map.with_index { |char, index| char.to_i * (BASE**index) }
      .sum
  end
end
