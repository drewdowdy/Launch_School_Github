# Written in 2024

lang = nil
year = nil

loop do
  loop do 
    puts '>> See in English or Japanese? (e/j)'
    lang = gets.chomp
    break if lang == 'e' || lang == 'j'
    puts ">> Please type 'e' for English or 'j' for Japanese"
  end

  loop do 
    puts '>> What year do you want to convert?'
    year = gets.chomp
    break if year.to_i.to_s == year
    puts '>> Please enter a valid year.'
  end

  year = year.to_i

  case year
  when 1868...1911
    puts "Meiji #{(year - 1868) + 1}" if lang == 'e'
    puts "明治#{(year - 1868) + 1}年" if lang == 'j'
  when 1912
    puts 'Meiji 45 (before Jul 30) Taisho 1 (from Jul 30)' if lang == 'e'
    puts '明治45年 (7月30日前) 大正元年 (7月30日から)' if lang == 'j'
  when 1913...1925
    puts "Taisho #{(year - 1913) + 2}" if lang == 'e'
    puts "大正#{(year - 1913) + 2}年" if lang == 'j'
  when 1926
    puts 'Taisho 15 (before Dec 25) Showa 1 (from Dec 25)' if lang == 'e'
    puts '大正15年 (12月25日前) 昭和元年 (12月25日から)' if lang == 'j'
  when 1927...1988
    puts "Showa #{(year - 1927) + 2}" if lang == 'e'
    puts "昭和#{(year - 1927) + 2}年" if lang == 'j' 
  when 1989
    puts 'Showa 64 (before Jan 8) Heisei 1 (from Jan 8)' if lang == 'e'
    puts '昭和64年 (1月8日前) 平成元年 (1月8日から)' if lang == 'j'
  when 1990...2018
    puts "Heisei #{(year - 1990) + 2}" if lang == 'e'
    puts "平成#{(year - 1990) + 2}年" if lang == 'j'
  when 2019
    puts 'Heisei 31 (before May 1) Reiwa 1 (from May 1)' if lang == 'e'
    puts '平成31年 (5月1日前) 令和元年 ()' if lang == 'j'
  when 2020...2024
    puts "Reiwa #{(year - 2020) + 2}" if lang == 'e'
    puts "令和#{(year - 2020) + 2}年" if lang == 'j'
  when 2024...Float::INFINITY
    puts 'Era is unknown after 2024' if lang == 'e'
    puts '2024年の後の元号は不明です。' if lang == 'j'
  else
    puts 'This year is before the modern Japanese era system.' if lang == 'e'
    puts 'この年は近代元号導入前の年です。' if lang == 'j'
  end

  puts ">> Do you want to convert another year? (y/n)"
  again = gets.chomp
  break if again.downcase == 'n'
end

puts 'Thanks for using this program! Goodbye!'

# Alternative

TRANSITIONS = {
  1912: 'Meiji 45 (before Jul 30) Taisho 1 (from Jul 30)',
  1926: 'Taisho 15 (before Dec 25) Showa 1 (from Dec 25)',
  1989: 'Showa 64 (before Jan 8) Heisei 1 (from Jan 8)',
  2019: 'Heisei 31 (before May 1) Reiwa 1 (from May 1)'
}

ERAS = [
  ['Meiji', 1868, 1912],
  ['Taisho', 1912, 1926],
  ['Showa', 1926, 1989],
  ['Heisei', 1989, 2019],
  ['Reiwa', 2019, 2024]
]

def convert_to_era(year)
  return 'This year is before the modern Japanese era system.' if year < 1868
  return 'Era is unknown after 2024.' if year >= 2024
  return TRANSITIONS[year] if TRANSITIONS[year]
  
  name, start_year, _ = ERAS.find { |_, start, end_year| year >= start && year < end_year }
  "#{name} #{year - start_year + 1}"
end

convert_to_era(1500) == "This year is before the modern Japanese era system."
convert_to_era(1900) == "Meiji 33"
convert_to_era(1922) == "Taisho 11"
convert_to_era(1975) == "Showa 50"
convert_to_era(1989) == "Showa 64 (before Jan 8) Heisei 1 (from Jan 8)"
convert_to_era(1994) == "Heisei 6"
convert_to_era(2005) == "Heisei 17"
convert_to_era(2020) == "Reiwa 2"
convert_to_era(4043) == "Era is unknown after 2024."

