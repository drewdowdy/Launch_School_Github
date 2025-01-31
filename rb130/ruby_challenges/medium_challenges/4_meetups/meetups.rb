=begin

=== PROBLEM ===

create a program that creates a Meetup object. Meetup objects can determine the exact date of a meetup based on a keyword like "first Monday"

Rules:
- new Meetup objects take a year and date
- specific dates are specified by a #day method that takes a weekday and a schedule term (ie. meetup.day("Monday", "first"))
- input terms for #day are case insensitive

=== DATA ===

input: year and month as integers
intermediate:
- #day(weekday, schedule) -> returns the exact Date object specified by the input
output: a Date object with a specific year, month, and day

=== BRAINSTORM ===

adding an integer to a Date object increments the day by that integer
increment the Date object until the day is correct and the number of passes is correct

first - fifth
- increment date by one
- increment  `count` by 1 if the day of the week is correct
- return the date if count is same as target and is the same day of the week
- return nil if no such date

teenth
- add 12 to the date
- until the day of the week is correct and the count is correct, increment the date by 1

last
- add days to the last day
- subtract until the day of the week is correct

how to determine length of a month
- Date.new(current.year, current.month, -1)

=end

require 'date'

class Meetup
  NUMBER = {
    'first'=>1,
    'second'=>2,
    'third'=>3,
    'fourth'=>4,
    'fifth'=>5
  }

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.civil(year, month, 1)
  end

  def day(weekday, schedule) 
    if NUMBER.keys.include?(schedule.downcase)
      number(weekday.downcase, schedule.downcase)
    elsif schedule == 'teenth'
      teenth(weekday.downcase)
    elsif schedule == 'last'
      last(weekday.downcase)
    end
  end

  private

  def number(weekday, schedule)
    count = 0
    target = NUMBER[schedule]
    current_date = Date.civil(@year, @month, 1)

    while current_date.month == @month
      if current_date.send("#{weekday}?")
        count += 1
        return current_date if count == target
      end
      current_date += 1
    end
    
    nil
  end

  def teenth(weekday)
    current_date = Date.civil(@year, @month, 13)

    while current_date.day < 20
      return current_date if current_date.send("#{weekday}?")
      current_date += 1
    end

    nil
  end

  def last(weekday)
    current_date = Date.civil(@year, @month, -1)

    while current_date.month == @month
      return current_date if current_date.send("#{weekday}?")
      current_date -= 1
    end

    nil
  end
end
