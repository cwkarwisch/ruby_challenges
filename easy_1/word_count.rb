class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.split(/[^a-zA-Z0-9']/)
    word_counts = Hash.new(0)
    words.each do |word|
      next if word == ""
      if word.chars.first.match?(/['"]/) && word.chars.first == word.chars.last
        word = strip_surrounding_quotation_marks(word)
      end
      word_counts[word.downcase] += 1
    end
    word_counts
  end

  private

  def strip_surrounding_quotation_marks(word)
    word_array = word.chars
    word_array.pop
    word_array.shift
    word_array.join
  end
end
