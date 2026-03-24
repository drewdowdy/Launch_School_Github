=begin

=== PROBLEM ===

write a program that can give any verse of the beer song OR the whole song

Rules:


n bottles of beer on the wall, n of bottles of beer.
Take one down, pass it around, (n - 1) bottles of beer on the wall.

when n is 0:

No more bottle of beer on the wall, no more bottles of beer.
Go to the store and buy some more, (n + 99) bottles of beer on the wall.

=end

class BeerSong
  def self.verse(num)
    how_many = num.zero? ? 'no more' : num.to_s
    bottle = self.pluralize_bottle(num)
    take = num.zero? ? 'Go to the store and buy some more' : "Take #{num == 1 ? 'it' : 'one'} down and pass it around"
    now_how_many = num.zero? ? '99' : (num - 1).zero? ? 'no more' : (num - 1).to_s
    new_bottle = self.pluralize_bottle(num - 1)

    <<~VERSE
    #{how_many.capitalize} #{bottle} of beer on the wall, #{how_many} #{bottle} of beer.
    #{take}, #{now_how_many} #{new_bottle} of beer on the wall.
    VERSE
  end

  def self.verses(upper_limit, lower_limit)
    lyrics = []

    upper_limit.downto(lower_limit) do |num|
      lyrics << BeerSong.verse(num)
    end

    lyrics.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end


  def self.pluralize_bottle(num)
    num == 1 ? 'bottle' : 'bottles'
  end
end
