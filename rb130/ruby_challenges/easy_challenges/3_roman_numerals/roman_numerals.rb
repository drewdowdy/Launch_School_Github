=begin

=== PROBLEM ===

convert decimal numbers to roman numerals

I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000

[0] ones -----------> [I, V, X]
I, II, III, IV, V, VI, VII, VIII, XI, 
[1] tens -----------> [X, L, C]
[2] hundreds -------> [C, D, M]
[3] more than 1000 -> [M]

=end

class RomanNumeral
  DIGIT_TO_NUMERAL = {
    0=>['I', 'V', 'X'],
    1=>['X', 'L', 'C'],
    2=>['C', 'D', 'M'],
    3=>'M'
  }

  def initialize(number)
    @decimal_number = number
  end

  def to_roman
    roman = []

    @decimal_number.digits.each_with_index do |digit, idx|
      if idx > 3
        roman.unshift(DIGIT_TO_NUMERAL[3] * (digit * 10**(idx - 3)))
      elsif idx == 3
        roman.unshift(DIGIT_TO_NUMERAL[idx] * digit)
      else
        numerals = DIGIT_TO_NUMERAL[idx]

        case digit
        when (1..3)
          roman.unshift(numerals[0] * digit)
        when 4
          roman.unshift((numerals[0] + numerals[1]))
        when 5
          roman.unshift(numerals[1])
        when (6..8)
          roman.unshift(numerals[1] + (numerals[0] * (digit - 5)))
        when 9
          roman.unshift(numerals[0] + numerals[2])
        end
      end
    end

    roman.join('')
  end
end
