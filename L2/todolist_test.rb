require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

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
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_all_done
    assert_equal(false, @list.done?)
  end
  
  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('cat') }
  end
  
  def test_shovel
    # todo = Todo.new("test")
    # @list << todo
    # assert_equal(todo, @list.last)
    
    todo = Todo.new("test")
    @list << todo
    @todos << todo
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    todo = Todo.new("test")
    @list.add(todo)
    @todos << todo
    assert_equal(@todos, @list.to_a)
  end
    
  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end
    
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    
    @todo1.done = true
    @todo2.done = true
    @todo3.done = true
    
    @list.mark_undone_at(1)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done_bang
    @todo1.done = true
    @todo2.done = true
    @todo3.done = true
    
    @list.done!
    
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    
    removed = @list.remove_at(0)
    assert_equal(@todo1, removed)
    refute_equal(@todo1, @list.first)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
    
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_with_todo_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    @list.mark_done_at(1)
    
    assert_equal(output, @list.to_s)
  end
    
  def test_to_s_with_all_todos_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    
    assert_equal(output, @list.to_s)
  end
    
  def test_each_iteration
    todos = []
    @list.each { |todo| todos << todo }
    
    assert_equal(todos, @list.to_a)
  end
  
  def test_each_return_value
    result = @list.each { |_| }
    
    assert_same(result, @list)
  end
  
  def test_each_returns_original_list
    assert_equal(@list, @list.each { |_| nil })
  end
  
  def test_select_my_version_that_was_not_very_good
    result = @list.to_a.select { |todo| todo.done? }
    
    assert_equal(result, [])
    refute_same(result, @list)
  end
  
  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
  
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
  
  # def test_random
  #   assert(@list.item_at(100) == IndexError)
  # end
end