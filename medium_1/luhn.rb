class Luhn
  def initialize(number)
    @number = number
  end

  def self.create(number)
    return number if Luhn.new(number).valid?
    number = number.to_s.chars.push('0').join.to_i # adds a 0 to end of number
    return number if Luhn.new(number).valid?
    last_digit = 10 - (Luhn.new(number).checksum % 10)
    return number + last_digit if Luhn.new(number + last_digit).valid?
    nil
  end

  def addends
    @number.to_s.chars.map(&:to_i).reverse.map.with_index do |digit, index|
      if index.even?
        digit
      elsif (digit * 2) < 10
        digit * 2
      else
        (digit * 2) - 9
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10) == 0
  end
end
