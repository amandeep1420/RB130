# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)
    @todos << todo
  end
  
  alias_method :<<, :add
  
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
  
  def item_at(position)
    @todos[position]
  end
  
  def mark_done_at(position)
    item_at(position).done!
  end
  
  def mark_undone_at(position)
    item_at(position).undone!
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
  
  def remove_at(position)
    @todos.delete_at(position)
  end
  
  def to_s
    puts " ---- Today's Todos ---- "
    @todos.each { |todo| puts todo }
  end
  
  def to_a
    @todos.clone
  end
  
  def each
    counter = 0
    
    while counter < @todos.size
      yield(item_at(counter))
      counter += 1
    end
    
    self
  end
  
  def select
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if yield(todo) }
    new_list
  end
  
  def find_by_title(name)
    each { |todo| return todo if todo.title == name }
    nil
  end
  
  def all_done
    select { |todo| todo.done? }
  end
  
  def all_not_done
    select { |todo| !todo.done? }
  end
  
  def mark_done(name)
    each do |todo|
      if todo.title == name
        todo.done!
        break
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

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect