=begin

=== PROBLEM === 

create a custom Set class that behaves like a Set in Ruby

Rules:
- set: a collection of unordered values where there are no duplicates

=== BRAINSTORM ===

use a hash where keys are the elements
values of the keys are 'true' (as in they exist)

=end

class CustomSet
  attr_accessor :collection

  def initialize(input=[])
    @collection = {}
    array = input.is_a?(Array) ? input : [input]
    array.each { |e| add(e) }
  end

  def add(input)
    if input.is_a?(Array)
      input.each { |item| self.collection[item] = true }
    else
      self.collection[input] = true
    end

    self
  end

  def empty?
    collection.empty?
  end

  def contains?(element)
    collection.include?(element)
  end

  def subset?(other_set)
    collection.all? do |item, _|
      other_set.contains?(item)
    end
  end

  def disjoint?(other_set)
    collection.none? do |item, _|
      other_set.contains?(item)
    end
  end

  def eql?(other_set)
    return false unless collection.size == other_set.collection.size

    collection.all? do |item, _|
      other_set.contains?(item)
    end
  end

  def intersection(other_set)
    result = CustomSet.new

    collection.each do |item, _|
      result.add(item) if other_set.contains?(item)
    end

    result
  end

  def ==(other_set)
    self.eql?(other_set)
  end

  def difference(other_set)
    result = CustomSet.new

    collection.each do |item, _|
      result.add(item) unless other_set.contains?(item)
    end

    result
  end

  def union(other_set)
    result = CustomSet.new

    collection.each { |item, _| result.add(item) }
    other_set.collection.each { |item, _| result.add(item) }

    result
  end
end
