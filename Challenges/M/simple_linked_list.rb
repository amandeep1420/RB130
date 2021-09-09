=begin

P
  - write a simple linked list implementation
  ~
  Classes:
    - Element
      - methods (class)
        - new (initialize): creates new array stored as instance variable
                            within object containing objects passed in as
                            arguments
          - @array: contains arguments
          - @datum: first argument from @array
          - @next_index: 1
      - methods (instance)
        - attr_readers: datum, next_index
        - datum: returns the first object in @array?
        - tail?: returns true if @array.last evaluates to true
        - next: initializes local variable to @array[@next_index], increments
                @next_index, and returns local variable that was initialized
   - SimpleLinkedList
      - methods (class)
        - new (initialize):
          - @list = []
      - methods (instance)
        - attr_readers: list
        - size: @list.size
        - empty?: @list.empty?
E
D
A
C
=end

class Element
  attr_reader :datum, :next_index
  
  def initialize(*elements)
    @array = []
    elements.each { |element| @array << element }
    @datum = @array.first
    @next_index  = 1
  end
    
  def tail?
    @array.last
  end
  
  def increment_next_index
    @next_index += 1
  end
  
  def next
    next_element = @array[@next_index]
    increment_next_index
    next_element
  end
end

class SimpleLinkedList
  attr_reader :list
  
  def initialize
    @list = []
  end
  
  def size
    list.size
  end
  
  def empty?
    list.empty?
  end
  
  def push(object)
    @list.unshift(Element.new(object))
  end
  
  def peek
    item = @list.first
    item.nil? ? item : item.datum
  end
  
  def head
    @list.first
  end
end