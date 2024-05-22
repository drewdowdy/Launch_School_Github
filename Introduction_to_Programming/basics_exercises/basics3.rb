#Exercise 3; use a hash to store a list of movie titles with the year they came out

movies = {
    "Toy Story 2" => 1999,
    "Inception" => 2010,
    "Interstellar" => 2014,
    "Spirited Away" => 2001,
    "Parasite" => 2019
}

movies.each do |movie, year|
    puts "#{movie} = #{year} --> comes from hash"
end