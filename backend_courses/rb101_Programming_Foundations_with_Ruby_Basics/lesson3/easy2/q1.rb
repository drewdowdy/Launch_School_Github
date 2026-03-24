ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

# BONUS
p ages.key?("Spot")
p ages.member?("Spot")
p ages.include?("Spot")