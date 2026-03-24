class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

  def status # reduce the number of times `light` is used
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# What's a better method name?

bedroom_light = Light.new('800 lumens', 'soft white')

bedroom_light.light_status 
bedroom_light.status # <- this is less repetitive

# => "I have a brightness level of 800 lumens and a color of soft white"
