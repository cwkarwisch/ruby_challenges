class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    differences_counter = 0

    @strand.chars.each_with_index do |char, index|
      break if index >= other_strand.length
      if char != other_strand[index]
        differences_counter += 1
      end
    end

    differences_counter
  end
end
