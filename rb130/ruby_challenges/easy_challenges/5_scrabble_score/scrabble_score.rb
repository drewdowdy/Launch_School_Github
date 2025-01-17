class Scrabble
  SCORES = {
    %w(a e i o u l n r s t)=>1,
    %w(d g)=>2,
    %w(b c m p)=>3,
    %w(f h v w y)=>4,
    %w(k)=>5,
    %w(j x)=>8,
    %w(q z)=>10
  }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    score = 0

    return score if @word.nil? || @word.empty? || @word.chars.none? { |char| char.match?(/[a-z]/i) }

    @word.downcase.each_char do |letter|
      SCORES.each do |group, points|
        score += points if group.include?(letter)
      end
    end

    score
  end
end
