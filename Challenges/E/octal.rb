=begin

P
  - given an octal input string, your program should produce a decimal output;
    treat invalid input as octal 0
    - must implement conversion ourselves; cannot use built-in/library methods
  ~
  Classes:
    - Octal
      - methods:
        - initialize: should take a string representing an integer as an argument
        - to_decimal: should return an integer resulting from the conversion of 
                      the string argument to an octal representation
          - note: invalid input during initialization should result in 0 being returned
  ~
    - note: no specificaiton made regarding mutation
    - note: no class methods
    - note: ~
E
  - see book
D
  - arrays likely
A
  - create Octal class
    - create initialize method per above
      - create helper method to validate input: "convert_to_integer"
        - if string.to_integer.to_string == string
          - return string.to_i
        - else
          - return 0
      - ....going to include code within initialize method as helpers are not possible
        without modules
    - create to_decimal method
      - note:the rules...reversing index will work here, need to figure out process
      
      - split @value into digits and reverse to maintain order => not reversing until after processing is completed
      - #map + #with_index
        - for each digit:
          - multiply digit by (8**(index - 1))
      - wait...we don't even need to maintain order...bruh
      - sum up the returned array
        
      
    
    
    
C
=end

class Octal
  def initialize(string)
    fixed_string = string =~ /[^0-7]/ ? 0 : string.to_i
    @value = fixed_string
  end
  
  # def to_decimal
  #   digits = @value.digits
    
  #   digits.map.with_index { |digit, index| digit * (8**index) }.sum
  # end
  
  def to_decimal
    @value.digits.each_with_index.reduce(0) do |decimal, (number, idx)|
      decimal + number * (8 ** idx)
    end
  end
end