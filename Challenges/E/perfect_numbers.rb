=begin

P
  - write a program that can tell whether a number is perfect, abundant, or deficient
  ~
  - classes: PerfectNumber
    - methods:
      - no initialize method
      - one class method, ::classify - should allow us to pass in an integer and 
                                       return the classification of the integer 
                                       as a lowercased string
                                     - should raise a StandardError if the argument
                                       passed in is not a positive integer
  ~
    - note: no specification made regarding mutation
    - note: not initializing objects
    - note: error should be raised with no message
E
  - see book
D
  - n/a
A
  - define PerfectNumber class
  - define classify method
    - define helper method to determine validity of input: "valid_number?"
      - input.to_s.to_i == input && input.positive?
    - raise StandardError unless input is valid as checked by helper method
    
    - from (1..integer)
      - if integer % a given number == 0, #select the given number
    - initialize variable "total" to sum of returned array
    - case "total"
      - when total == integer then "perfect"
      - when total > integer then "abundant"
      - else                      "deficient"
    
  
C
=end

class PerfectNumber
  def self.classify(integer)
    raise StandardError unless self.valid_number?(integer)
    
    total = (1...integer).select { |num| integer % num == 0 }.sum
    
    case 
    when total == integer then 'perfect'
    when total > integer  then 'abundant'
    else                       'deficient'
    end
  end
  
  class << self
    private
    
    def self.valid_number?(object)
      object.to_s.to_i == object && object.positive?
    end
  end
end
  
