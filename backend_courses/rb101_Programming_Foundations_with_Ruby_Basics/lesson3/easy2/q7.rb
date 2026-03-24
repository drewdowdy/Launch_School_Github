flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

p flintstones.concat(%w(Dino Hoppy))
  # Array#concat(other_arrays) adds to array all elements from each Array in other_arrays; returns self

p flintstones.push('Dino', 'Hoppy')
  # Array#push(objects) appends each argument in objects to self; returns self
