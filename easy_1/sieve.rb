class Sieve
  attr_accessor :range

  def initialize(limit)
    @limit = limit
    @range = Hash.new
    (2..limit).each { |int| @range[int] = :prime }
  end

  def primes
    (2..@limit).each do |int|
      next if @range[int] == :not_prime
      multiple = int + int
      while multiple <= @limit
        @range[multiple] = :not_prime
        multiple += int
      end
    end
    @range.select { |_, v| v == :prime }.keys
  end
end
