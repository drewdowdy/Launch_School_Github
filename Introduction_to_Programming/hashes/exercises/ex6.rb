# What's the difference between the two hashes?
x = "hey, what's up?"

my_hash = {x: "not much"}
    # This creates an unchanging symbol
my_hash2 = {x => "nm u?"}
    # This uses a variable that could change later

p my_hash[:x]
p my_hash2[x]