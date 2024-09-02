class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.size}-+"
  end

  def empty_line
    "| #{' ' * @message.size} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# => +--------------------------------------------+
# => |                                            |
# => | To boldly go where no one has gone before. |
# => |                                            |
# => +--------------------------------------------+

banner = Banner.new('')
puts banner
# => +--+
# => |  |
# => |  |
# => |  |
# => +--+

## Further Exploration
# modify `#new` so that it can optionally take a width parameter. Banner text should be centered. Max width of terminal window is 86 characters.

class Banner
  def initialize(message, width = message.size)
    @message = message
    @width = width
  end

  def to_s
    if !valid_width?
      "Error: Input width is out of bounds. Choose a number from #{minimum_width} to 80."
    else
      if smaller_than_biggest_word? 
        "Error: Input width is smaller than biggest word. Choose a number from #{minimum_width} to 80."
      else
        [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
      end
    end
  end

  private

  MAX = 80

  def minimum_width
    @message.empty? ? 0 : @message.split(/\b/).max_by(&:size).size
  end

  def valid_width?
    (1..MAX).include?(@width)
  end

  def smaller_than_biggest_word?
    @width < minimum_width
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    if @message.empty? || @width.zero?
      "|  |"
    elsif @width < @message.size
      wrap_text
    else
      "| #{@message.center(@width)} |"
    end
  end

  def wrap_text
    words = @message.split(/\b/)
    result = []
    
    until words.empty?
      line = []
      while !words.empty? && (line.join.size + words.first.size <= @width)
        line << words.shift
      end
      result << "| #{line.join.strip.center(@width)} |"
    end
  
    result
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
# => +----------------------------------------------------+
# => |                                                    |
# => |     To boldly go where no one has gone before.     |
# => |                                                    |
# => +----------------------------------------------------+

banner = Banner.new('To boldly go where no one has gone before.', 80)
puts banner
# => +----------------------------------------------------------------------------------+
# => |                                                                                  |
# => |                    To boldly go where no one has gone before.                    |
# => |                                                                                  |
# => +----------------------------------------------------------------------------------+

banner = Banner.new('To boldly go where no one has gone before.', 10)
puts banner
# => +------------+
# => |            |
# => | To boldly  |
# => |  go where  |
# => | no one has |
# => |    gone    |
# => |  before.   |
# => |            |
# => +------------+

banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner
# => Error: Input width is out of bounds. Choose a number from 6 to 80.

banner = Banner.new('To boldly go where no one has gone before.', 0)
puts banner
# => Error: Input width is out of bounds. Choose a number from 6 to 80.

banner = Banner.new('To boldly go where no one has gone before.', 3)
puts banner
# => Error: Input width is smaller than biggest word. Choose a number from 6 to 80.

banner = Banner.new('Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.', 20)
puts banner
# => +----------------------+
# => |                      |
# => | Four score and seven |
# => |    years ago our     |
# => |   fathers brought    |
# => |    forth on this     |
# => |   continent, a new   |
# => | nation, conceived in |
# => |     Liberty, and     |
# => |   dedicated to the   |
# => | proposition that all |
# => |   men are created    |
# => |        equal.        |
# => |                      |
# => +----------------------+

banner = Banner.new('Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.', 7)
puts banner
# => Error: Input width is smaller than biggest word. Choose a number from 11 to 80.
