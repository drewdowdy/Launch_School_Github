class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# This will return a string object that is the concatination of "You will " and one random element from the returned array from the `#choices` instance method in the `RoadTrip` class. Even though there its a `#choices` instance method in the superclass `Oracle`, Ruby resolves the method name starting in the `RoadTrip` class since it's the class of the calling object.
