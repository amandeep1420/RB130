=begin

P
  - write a program that can calculate the Hamming distance between
    two DNA strands
  - create class "DNA"
    - note: instantiate with one argument (string) and assign to @sequence
    - note: no input validation required....
    - note: need hamming_distance instance method that takes string 
            as input and determines hamming distance
E
  - see book
D
  - strings
A
  - create DNA class
    - create initialize method
      - initialize @sequence ivar to argument
      
  - create hamming_sequence instance method
    - initialize distance local variable to 0
    - determine final index to be checked
      - check @sequence and string passed in as argument; length to be 
        checked is the length of the shorter string
        - place both in array, transform into size, find min
        - subtract one to account for zero-based index
    - start checking 
      - from 0..max index
        - distance += 1 if @sequence[index] does not equal other_sequence[index]
    - return distance
C
=end

class DNA
  attr_reader :sequence
  
  def initialize(sequence)
    @sequence = sequence
  end
  
  def hamming_distance(other_sequence)
    max_index = ([sequence, other_sequence].map(&:size).min) - 1
    distance  = 0
    
    (0..max_index).each do |index| 
      distance += 1 if sequence[index] != other_sequence[index]
    end
    
    distance
  end
end