class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    raise ArgumentError if length > @digits.length
    results = []
    digits_array = @digits.split("").map(&:to_i)
    digits_array.each_with_index do |_, index|
      break if (index + length) > @digits.length
      results << digits_array.slice(index, length)
    end
    results
  end
end
