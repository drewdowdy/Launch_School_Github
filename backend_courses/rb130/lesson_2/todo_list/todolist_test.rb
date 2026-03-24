require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    result = @list.shift
    
    assert_equal(@todo1, result) # check if the correct element is returned
    assert_equal([@todo2, @todo3], @list.to_a) # check if the list changed after #shift invocation
  end

  def test_pop
    result = @list.pop

    assert_equal(@todo3, result)
    assert_equal([@todo1, @todo2], @list.to_a) 
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    # assert_equal(TypeError, @list.add('string')) <-- use #assert_raises(Error){block} instead
    assert_raises(TypeError) { @list.add(3) }
    assert_raises(TypeError) { @list.add('string') }
    assert_raises(TypeError) { @list.add({todo1:'Wash car'}) }
  end

  def test_shovel
    new_todo = Todo.new('Wash the car')

    @list << new_todo
    @todos << new_todo

    assert_equal(@list.to_a, @todos)
  end

  def test_add
    new_todo = Todo.new('Wash the car')
    
    @list.add(new_todo)
    @todos.push(new_todo)

    assert_equal(@list.to_a, @todos)
  end

  def test_item_at
    assert_equal(@list.item_at(0), @todo1)
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    
    @list.mark_done_at(0)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!

    result = @list.to_a.all? { |todo| todo.done? }
    
    assert_equal(true, result)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    result = @list.remove_at(0)

    assert_equal(@todo1, result)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!

    assert_equal(output, @list.to_s)
  end

  def test_each
    items = []

    @list.each { |todo| items << todo }

    assert_equal(items, @list.to_a)
  end

  def test_each_2
    result = @list.each { |todo| nil }

    assert_equal(@list, result)
  end

  def test_select
    result = @list.select { |todo| todo.title == 'Buy milk' }
    new_list = TodoList.new(@list.title)
    new_list << @todo1

    assert_equal(result.to_s, new_list.to_s)
  end
end
