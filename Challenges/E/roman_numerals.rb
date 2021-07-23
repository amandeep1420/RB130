### unfinished

=begin

P
  - write some code that converst modern decimal numbers into their Roman
    numeral equivalents
  - create a RomanNumeral class with the following public methods:
    - initialize: one argument (integer)
    - to_roman: returns a string representation of a number as a roman numeral
    ~~~
    - note: I == 1
    - note: V == 5
    - note: X == 10
    - note: L == 50
    - note: C == 100
    - note: D == 500
    - note: M == 1000
    - note: skip digits with a value of zero
    - note: no input validation for argument passed in during instantiation
    - note: no specification made regarding mutation
    - note: 
E
  - see book
D
  - arrays...
A
  - create RomanNumeral class with initialize method
  - create to_roman public method
    - convert integer to array of numbers; array should hold a number for each
      tenths place that, when added, equal the integer stored in @number
      - find divisor; 10**(size of @number as string - 1)
  
C
=end

class RomanNumeral
  attr_reader :numbers
  
  def initialize(number)
    @numbers = convert_to_array_of_numbers(number)
  end
  
  def to_roman
    
  end
  
  private
  
  def convert_to_array_of_numbers(number)
    divisor = 10**(input.to_s.size.to_i - 1)
    all_numbers = []
    current_number = number
    
    loop do
      all_numbers << ((current_number / divisor) * divisor)
      current_number = (number % divisor)
      break if (divisor / 10) == 0
      divisor = (divisor / 10)
    end
    
    numbers
  end
  