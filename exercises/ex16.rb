contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
a = [:email, :address, :phone]

contacts.each { |name, hash| a.each { |a| hash[a] = contact_data.shift } }  

p contacts

contact_data2 = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts2 = {"Joe Smith" => {}, "Sally Johnson" => {}}
a2 = [:email, :address, :phone]

contacts2.each_with_index { |(name, hash), idx| a2.each { |a2| hash[a2] = contact_data2[idx].shift } }

p contacts2