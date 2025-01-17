=begin

=== PROBLEM ===

write a program that converts an octal input number into a decimal number

Rules:
- valid octal digits are 0, 1, 2, 3, 4, 5, 6, and 7
- 

=end

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 unless valid_octal?

    digits = @octal_string.to_i.digits

    digits.map!.with_index do |digit, idx|
      digit * (8**idx)
    end

    digits.sum
  end

  private

  def valid_octal?
    @octal_string.chars.all? do |char|
      %w(0 1 2 3 4 5 6 7).include?(char)
    end
  end
end
