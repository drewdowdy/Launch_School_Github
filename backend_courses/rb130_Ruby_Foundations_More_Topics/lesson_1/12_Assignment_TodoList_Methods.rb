class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError.new('Can only add Todo objects') unless item.class == Todo
    @todos << item
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end
  
  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text = "---- #{@title} ----\n"
    @todos.clone.map(&:to_s).each { |todo_txt| text += "#{todo_txt}\n" }
    text
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(@title)
    each do |todo|
      result.add(todo) if yield(todo)
    end
    result
  end

  def find_by_title(title)
    each { |todo| return todo if todo.title == title }
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    each do |todo|
      if todo.title == title
        todo.done!
        return
      end
    end
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_done_at(1)

# find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.

puts list.find_by_title('Buy milk')
puts ''

# all_done	returns new TodoList object containing only the done items

puts list.all_done
puts ''

# all_not_done	returns new TodoList object containing only the not done items

puts list.all_not_done
puts ''

# mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.

list.mark_done('Go to gym')
puts list
puts ''

# mark_all_done	mark every todo as done

list.mark_all_done
puts list
puts ''

# mark_all_undone	mark every todo as not done

list.mark_all_undone
puts list
