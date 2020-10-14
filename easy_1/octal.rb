class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal.match?(/(8|9|[a-zA-Z])/)
    chars = @octal.chars
    values = []
    base = 0

    chars.reverse.each do |char|
      values << char.to_i * (8**base)
      base += 1
    end

    values.sum
  end
end
