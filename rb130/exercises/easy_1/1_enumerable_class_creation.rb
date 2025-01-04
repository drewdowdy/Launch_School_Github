class Tree
  # include the `Enumerable` module to get collection methods
  include Enumerable

  def initialize
    @array = [3, 1, 2]
  end

  # define an `#each` method that yields each element in the collection
  def each
    @array.each do |element| 
      yield(element)
    end

    @array
  end
end

tree = Tree.new

tree.each do |e|
  print e
end
puts ''

new_tree = tree.map do |e|
  e + 1
end

p new_tree
p tree.sort
