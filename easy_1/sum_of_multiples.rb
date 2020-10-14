class SumOfMultiples
  attr_reader :multiples

  DEFAULT_MULTIPLES = [3, 5]

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    sum = 0

    1.upto(limit - 1) do |num|
      DEFAULT_MULTIPLES.each do |multiple|
        if num % multiple == 0
          sum += num
          break
        end
      end
    end

    sum
  end

  def to(limit)
    sum = 0

    1.upto(limit - 1) do |num|
      @multiples.each do |multiple|
        if num % multiple == 0
          sum += num
          break
        end
      end
    end

    sum
  end
end
