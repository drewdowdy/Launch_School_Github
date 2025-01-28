=begin

=== PROBLEM ===

create a clock object that is independent of date

Rules:
- DONT mutate the clock when adding/subtracting minutes
- two clock objects with the same time should be equal
- DONT use any built-in time/date functionality; only arithmetic

=== DATA ===

class method invocation ::at with integer argument
(optional minute integer argument)

when #to_s is invoked on a Clock object, the hour and minute are returned as "hh:mm" format

Clock objects use 24hr time 00:00 to 23:59

=== BRAINSTORM ===

the limit to add minutes has to be 60, if more, then increment hours
hours can only go to 23 then loop back down to 0

=end

class Clock
  attr_reader :total_min

  MINUTES_IN_DAY = 1440
  MINUTES_IN_HOUR = 60

  def initialize(hr, min)
    @hours = hr
    @minutes = min
    @total_min = (@hours * MINUTES_IN_HOUR) + @minutes
  end

  def self.at(hr, min=0)
    Clock.new(hr, min)
  end

  def +(min)
    new_total = (total_min + min) % MINUTES_IN_DAY
    hours, minutes = new_total.divmod(MINUTES_IN_HOUR)
    Clock.new(hours, minutes)
  end

  def -(min)
    new_total = (total_min - min) % MINUTES_IN_DAY
    hours, minutes = new_total.divmod(MINUTES_IN_HOUR)
    Clock.new(hours, minutes)
  end

  def ==(other_clock)
    self.total_min == other_clock.total_min
  end

  def to_s
    "#{format("%02d", @hours)}:#{format("%02d", @minutes)}"
  end
end
