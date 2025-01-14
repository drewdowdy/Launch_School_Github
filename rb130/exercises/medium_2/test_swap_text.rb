require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'swap_text.rb'

class SwapTextTest < Minitest::Test
  def setup
    @file = File.open('/Users/drewdowdy/Launch_School_Github/rb130/exercises/medium_2/sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_swap_text
    expexted = <<~OUTPUT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    OUTPUT

    result = @text.swap('a', 'e')

    assert_equal(expexted, result)
  end

  def test_word_count
    expected = 72
    result = @text.word_count

    assert_equal(expected, result)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
