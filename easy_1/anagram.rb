class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    results = []
    target_word_array = @word.downcase.chars.sort

    possible_anagrams.each do |possible_anagram|
      if target_word_array == possible_anagram.downcase.chars.sort
        results << possible_anagram unless @word.downcase ==
                                           possible_anagram.downcase
      end
    end

    results
  end
end
