class DNA
  def initialize(string)
    @sequence = string
  end

  def hamming_distance(other_sequence)
    hamming_distance = 0

    if @sequence.size < other_sequence.size
      short, long = @sequence, other_sequence
    elsif other_sequence.size < @sequence.size
      short, long = other_sequence, @sequence
    else
      short, long = @sequence, other_sequence
    end

    short.each_char.with_index do |base, idx|
      hamming_distance += 1 if base != long[idx]
    end

    hamming_distance
  end
end
