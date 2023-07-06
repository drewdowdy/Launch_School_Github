# Hash values can be arrays

h = {name: ["Bob", "Bill"]}
puts h[:name]

# You can have an array of hashes

a = [ {hair_color: "brown"}, {eye_color: "green"} ]
puts a[0]
puts a[1]