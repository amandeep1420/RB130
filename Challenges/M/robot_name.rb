=begin

P
  - create a Robot class that generates a random name whenever an instance is 
    instantiated; the name should follow the format AB123 (two cap letters, 
    three numbers). instances of the class should be able to reset the name;
    implement some kind of collision avoidance system.
  ~
  classes:
    Robot
      - instance methods:
        - initialize(no params)
          - should generate a name for the robot object and assign to @name
          - should add generated name to class variable for future reference
        - name
          - getter to return value of @name
        - reset
          - should generate a new name, making sure it's not the same as a 
            previously used name
  ~
    - note: n/a
E
  - see book
D
  - strings and such, arrays and such
A
  - create a Robot class
    - attr_reader :name
    - @@used_names = []
    - initialize method
      - @name = generate_name
      - @@used_names << @name
        - generate_name helper method:
          - string = ''
          - loop 
            - push random letter to string 2 times
            - push random numebr to string 2 times
            - break if @@used_names doesn't include string
          - push string to @@used_names
          - return string
    - reset method
      - @name = generate_name

  
C
=end


class Robot
  attr_reader :name
  
  @@used_names = []
  
  def initialize
    @name = generate_name
  end
  
  def reset
    @name = generate_name
  end
  
  private
  
  def generate_name # this method mutates something and returns something meaningful - needs to be refactored
    new_name = ''
    loop do
      2.times { new_name << ('A'..'Z').to_a.sample }
      3.times { new_name << ('0'..'9').to_a.sample }
      break if !@@used_names.include?(new_name)
    end
    @@used_names << new_name
    new_name
  end
end