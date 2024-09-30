require 'pry'

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    # tasks = tasks.select do |task|
    # binding.pry
    high_priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    # display(tasks)
    display(high_priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

=begin

Error: On `line 35`, we have initialized a local variable `tasks` but have not yet assigned it to anything. So when we invoke `tasks.slect`, it is using the value of the not yet assisned local variable `tasks` and not the instance variable `@tasks`.

Fix: rename the `tasks` variable to something different and clearer to avoid referencing itself before its value can be assigned.

Note:
  to be clearer and avoid ambiguity, it's best to include `self` when using a setter method to be clear that we're reassigning an instance variable and not a local variable.

=end

puts '', 'Width Specifiers:'

# `d` is for digits
p sprintf('%20d', 100)  # => "       100"
p sprintf('%-20d', 100) # => "100       "

# `s` is for strings
p sprintf('%20s', "Hello there")  # => "         Hello there"
p sprintf('%-20s', "Hello there") # => "Hello there         "

# `s` essentially calls `item.to_s`, so we can use Integers too
p sprintf('%20s', 100)   # => "                 100"
