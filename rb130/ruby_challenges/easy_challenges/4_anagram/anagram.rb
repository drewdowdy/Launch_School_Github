class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    match_value = @word.downcase.chars.sort

    array.select do |candidate|
      anagram = (candidate.downcase.chars.sort == match_value)
      same_word = (candidate.downcase == @word.downcase)

      anagram && !same_word
    end
  end
end
