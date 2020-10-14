class PigLatin
  @@beginning_vowel_sound = /\A([aeiou]|y[^aeiou]|x[^aeiou])/i
  @@vowel_sound = /([aeio]|u+[^aeio])/i
  @@single_word = /\A\w+\Z/

  def self.translate(phrase)
    if phrase.match?(@@single_word)
      translate_word(phrase)
    else
      phrase.split(" ").map do |word|
        translate_word(word)
      end.join(" ")
    end
  end

  def self.translate_word(word)
    if word.match?(@@beginning_vowel_sound)
      word << "ay"
    else
      start_of_vowel_sound = word =~ @@vowel_sound
      consonant_sounds = word.slice!(0...start_of_vowel_sound)
      word << consonant_sounds << "ay"
    end
  end
end
