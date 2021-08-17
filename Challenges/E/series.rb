=begin

P
  - write a program that will take a string of digits and return all the 
    possible consecutive number series of a specified length in that string
  ~
  Classes
    - Series
      - methods(class)
        - ::new(string of digits as argument)
          - initialize @digits to result of splitting string and converting
            each string into an integer
      - methods(instance)
        - slices(takes integer as argument to represent length of series)
          - should return a nested array containing all possible 
            consecutive series 
          - should raise ArgumentError if argument is greater than size
            of @digits
  ~
  Notes
    - all test cases use valid strings
    - no need to account for invalid characters
    - no specification made regarding mutation
    - ...
E
  - see book
D
  - array
A
  - Create Series class
    - create initialize method
      - @digits = input string.split('').map { |digit| digit.to_i }
    - create #series method
      - raise ArgumentError if inputted integer > @digits.size
    
C
=end

class Series
  attr_reader :digits
  def initialize(string)
    @digits = string.split('').map(&:to_i)
  end
  
  def slices(size)
    raise ArgumentError if size > @digits.size
    @digits.each_cons(size).to_a
  end
end

p Series.new('1234').digits