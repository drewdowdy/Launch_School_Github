# Using a Hash Map
def decipher(encrypted_name)
  shifted_letters = ('N'..'Z').to_a + ('A'..'M').to_a + ('n'..'z').to_a + ('a'..'m').to_a
  normal_letters = ('A'..'Z').to_a + ('a'..'z').to_a
  letter_hsh = shifted_letters.zip(normal_letters).to_h
  letter_hsh[' '] = ' '

  deciphered = encrypted_name.chars.map do |letter|
    letter_hsh[letter]
  end

  puts deciphered.join
end

puts 'No. 1'
decipher('Nqn Ybirynpr') # => Ada Lovelace
decipher('Tenpr Ubccre') # => Grace Hopper
decipher('Nqryr Tbyqfgvar') # => Adele Goldstine
decipher('Nyna Ghevat') # => Alan Turing
decipher('Puneyrf Onoontr') # => Charles Babbage
decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv') # => Abdullah Muhammad bin Musa alKhwarizmi
decipher('Wbua Ngnanfbss') # => John Atanasoff
decipher('Ybvf Unvog') # => Lois Haibt
decipher('Pynhqr Funaaba') # => Claude Shannon
decipher('Fgrir Wbof') # => Steve Jobs
decipher('Ovyy Tngrf') # => Bill Gates
decipher('Gvz Orearef-Yrr') # => Tim BernersLee
decipher('Fgrir Jbmavnx') # => Steve Wozniak
decipher('Xbaenq Mhfr') # => Konrad Zuse
decipher('Fve Nagbal Ubner') # => Sir Antony Hoare
decipher('Zneiva Zvafxl') # => Marvin Minsky
decipher('Lhxvuveb Zngfhzbgb') # => Yukihiro Matsumoto
decipher('Unllvz Fybavzfxv') # => Hayyim Slonimski
decipher('Tregehqr Oynapu') # => Gertrude Blanch

# 'Rotate' the letters
def is_letter?(char)
  ('a'..'z').include?(char.downcase)
end

def rot_13(letter)
  if ('a'..'m').include?(letter.downcase)
    (letter.ord + 13).chr
  elsif ('n'..'z').include?(letter.downcase)
    (letter.ord - 13).chr
  end
end

def decipher_two(encrypted_name)
  result = encrypted_name.chars.map do |char|
    is_letter?(char) ? rot_13(char) : char
  end

  puts result.join
end

puts 'No. 2'
decipher_two('Nqn Ybirynpr') # => Ada Lovelace
decipher_two('Tenpr Ubccre') # => Grace Hopper
decipher_two('Nqryr Tbyqfgvar') # => Adele Goldstine
decipher_two('Nyna Ghevat') # => Alan Turing
decipher_two('Puneyrf Onoontr') # => Charles Babbage
decipher_two('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv') # => Abdullah Muhammad bin Musa alKhwarizmi
decipher_two('Wbua Ngnanfbss') # => John Atanasoff
decipher_two('Ybvf Unvog') # => Lois Haibt
decipher_two('Pynhqr Funaaba') # => Claude Shannon
decipher_two('Fgrir Wbof') # => Steve Jobs
decipher_two('Ovyy Tngrf') # => Bill Gates
decipher_two('Gvz Orearef-Yrr') # => Tim BernersLee
decipher_two('Fgrir Jbmavnx') # => Steve Wozniak
decipher_two('Xbaenq Mhfr') # => Konrad Zuse
decipher_two('Fve Nagbal Ubner') # => Sir Antony Hoare
decipher_two('Zneiva Zvafxl') # => Marvin Minsky
decipher_two('Lhxvuveb Zngfhzbgb') # => Yukihiro Matsumoto
decipher_two('Unllvz Fybavzfxv') # => Hayyim Slonimski
decipher_two('Tregehqr Oynapu') # => Gertrude Blanch

# Using Procs / Blocks

rot_13_key = Proc.new do |char|
  downcase = char.downcase
  if ('a'..'m').include?(downcase)
    (char.ord + 13).chr
  elsif ('n'..'z').include?(downcase)
    (char.ord - 13).chr
  else
    char
  end
end

def decipher_three(encrypted_name, &key)
  result = encrypted_name.chars

  result.map! do |char|
    yield(char)
    # key.call(char) <-- also works
  end

  puts result.join
end

puts 'No. 3'
decipher_three('Nqn Ybirynpr', &rot_13_key) # => Ada Lovelace
decipher_three('Tenpr Ubccre', &rot_13_key) # => Grace Hopper
decipher_three('Nqryr Tbyqfgvar', &rot_13_key) # => Adele Goldstine
decipher_three('Nyna Ghevat', &rot_13_key) # => Alan Turing
decipher_three('Puneyrf Onoontr', &rot_13_key) # => Charles Babbage
decipher_three('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv', &rot_13_key) # => Abdullah Muhammad bin Musa alKhwarizmi
decipher_three('Wbua Ngnanfbss', &rot_13_key) # => John Atanasoff
decipher_three('Ybvf Unvog', &rot_13_key) # => Lois Haibt
decipher_three('Pynhqr Funaaba', &rot_13_key) # => Claude Shannon
decipher_three('Fgrir Wbof', &rot_13_key) # => Steve Jobs
decipher_three('Ovyy Tngrf', &rot_13_key) # => Bill Gates
decipher_three('Gvz Orearef-Yrr', &rot_13_key) # => Tim BernersLee
decipher_three('Fgrir Jbmavnx', &rot_13_key) # => Steve Wozniak
decipher_three('Xbaenq Mhfr', &rot_13_key) # => Konrad Zuse
decipher_three('Fve Nagbal Ubner', &rot_13_key) # => Sir Antony Hoare
decipher_three('Zneiva Zvafxl', &rot_13_key) # => Marvin Minsky
decipher_three('Lhxvuveb Zngfhzbgb', &rot_13_key) # => Yukihiro Matsumoto
decipher_three('Unllvz Fybavzfxv', &rot_13_key) # => Hayyim Slonimski
decipher_three('Tregehqr Oynapu', &rot_13_key) # => Gertrude Blanch
