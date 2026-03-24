class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
p oracle.predict_the_future

# This will result in a string object being returned. It is the concatination of "You will " and a random element from the returned array of the `#choices` method.
