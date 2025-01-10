=begin

=== PROBLEM ===

make a text analyser that counts the number of paragraphs, lines, and words of a given input

Rules:
- can only update the #process method and the implementation of the blocks
- READ the text in #process
- paragraph: blocks of text separated by an empty line
- line: a line that ends with a newline characher ('\n')
- word: a group of letters separated by single spaces

=== BRAINSTORM ===

- input is in the block?
- does the block need to specify which item it's looking for? (paragraph, line, word?)

=end

class TextAnalyzer
  def process
    file_name = yield
    paragraph_num = 1
    line_num = 0
    word_num = 0

    File.foreach(file_name) do |line|
      line_num += 1
      paragraph_num += 1 if line == "\n"
      word_num += line.split.size
    end

    result = <<~TEXT
    #{paragraph_num} paragraphs
    #{line_num} lines
    #{word_num} words
    TEXT

    puts result
  end
end

text_1 = 'Launch_School_Github/rb130/exercises/medium_1/2_texts/standard_text_input.txt'
text_2 = 'Launch_School_Github/rb130/exercises/medium_1/2_texts/declaration_of_independence.txt'
text_3 = 'Launch_School_Github/rb130/exercises/medium_1/2_texts/gettysburg_address.txt'

analyzer = TextAnalyzer.new
analyzer.process { text_1 }
# 3 paragraphs
# 15 lines
# 126 words

analyzer.process { text_2 }
# 32 paragraphs
# 63 lines
# 1330 words

analyzer.process { text_3 }
# 3 paragraphs
# 5 lines
# 267 words

# === REAL SANDWICH CODE ===

class SandwichTextAnalyzer
  def process(file_name)
    file = File.open(file_name, 'r')
    yield(file.read)
    file.close
  end
end

puts ''

analyzer = SandwichTextAnalyzer.new
analyzer.process(text_1) { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process(text_1) { |text| puts "#{text.split("\n").size} lines" }
analyzer.process(text_1) { |text| puts "#{text.split.size} words" }

puts ''

analyzer.process(text_2) { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process(text_2) { |text| puts "#{text.split("\n").size} lines" }
analyzer.process(text_2) { |text| puts "#{text.split.size} words" }

puts ''

analyzer.process(text_3) { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process(text_3) { |text| puts "#{text.split("\n").size} lines" }
analyzer.process(text_3) { |text| puts "#{text.split.size} words" }

