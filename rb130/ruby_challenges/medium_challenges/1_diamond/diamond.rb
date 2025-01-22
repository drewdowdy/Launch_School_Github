=begin

A

A
B B
A

A
B B
C   C
B B
A

=== PROBLEM ===

write a program that produces a diamond made up of the letters up to a given letter. 

=== BRAINSTORM ===

center each line to the longest one #center(num)
  how to determine longest line?
    (letter_idx * 2) - 1
    'A' is the exception; just needs to be centered

[0] A -> 1, no spaces
[1] B -> 2, 1 space
[2] C -> 2, 3 spaces
[3] D -> 2, 5 spaces
[4] E -> 2, 7 spaces

=end

class Diamond
  def self.make_diamond(letter)
    letter_arr = ('A'..letter).to_a
    longest_line = (letter_arr.size * 2) - 1

    top = letter_arr.map.with_index do |letter, idx|
      if letter == 'A'
        line = "#{letter}".center(longest_line)
      else
        line = "#{letter}#{' ' * ((idx * 2) - 1)}#{letter}".center(longest_line)
      end

      line + "\n"
    end

    bottom = top[0, top.size - 1].reverse

    (top + bottom).join
  end
end
