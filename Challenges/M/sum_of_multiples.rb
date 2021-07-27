=begin

P
  - write a program that, given a natural number and a set of one or more
    other numbers, can find the sum of all the multiples of the numbers in the 
    set that are less than the first number. if the set of numbers is not 
    given, use a default set of 3 and 5.
  ~
  Classes:
    SumOfMultiples
      - methods:
        -instance
          - initialize:
            - if argument list is presented
              -save as @set
            - else (if *args = [] )
              -@set = [3, 5]
        - class
          - to(integer)
            - find the sum of all the multiples in @set that are less than the 
              integer passed in as an arg
  ~
    - note: do not need to handle invalid input anywhere
    - note: no specifications made regarding mutation
    - note: multiples should start with 2 (do not include 1)
    - note: ...
E
  - see book
D
  - array for @set
A
  - create SumOfMultiples class
    - create initialize method
    - create ::to method
      - initialize variable to empty array for storage
      - from 2...integer passed into method
        - push number to storage if any number from set % number == 0
      - sum up storage and return sum


C
=end


class SumOfMultiples
  attr_reader :set
  
  def initialize(*args)
    @set = args == [] ? [3, 5] : args
  end
  
  def self.to(max)
    SumOfMultiples.new.to(max)
  end
  
  def to(max)
    multiples = []
    
    (2...max).each do |multiple|
      multiples << multiple if @set.any? { |number| multiple % number == 0 }
    end
    
    multiples.sum
  end
end
          
tester = SumOfMultiples.new

p tester.set


# we originally repeated the implementation for both methods
# due to time crunch - refactored after seeing a comment where 
# one method made use of the other; this should be reflexive for us
