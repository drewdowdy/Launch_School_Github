#Use select method to display siblings' names into an array

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
siblings = family.select{|k,v| k == :sisters || k == :brothers}
p siblings.to_a
