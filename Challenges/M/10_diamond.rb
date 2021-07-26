=begin

P
  - given a letter, print a diamond using the rules defined by the prompt
  ~
  Classes:
    Diamond
      - methods
        - make_diamond(class method): takes a string with one letter
                                      as an argument and produces desired output
E
  - see book
D
  - array for letter storage
A
  - create Diamond class
    - create make_diamond method
      - for ('A'..letter)
        - convert to array, save in variable
      - line_length = array.size + array.size - 1
      - two helper methods: top of diamond, bottom of diamond
        - top_of_diamond(line_length, letters):
          - midpoint = (line_length / 2) + 1
          - left_index, right_index = midpoint
          
          - for each letter:
            - line = ' ' * line_length
            - line[left_index], line[right_index] = letter, letter
            - puts line
            - left -= 1, right += 1
          - end
        - bottom_of_diamond(line_length - 2, letters excluding last letter)
          - reverse letters and save
          - left_index = 1
          - right_index = letters.size - 1
          
          - for each letter
            - line = ' ' * line_length
            - line[left_index], line[right_index] = letter, letter
            - puts line
            - left += 1, right -= 1
          end
        
  
  
C
=end

class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    line_length = (letters.size * 2) - 1
    string = ''
    string += top_of_diamond(line_length, letters)
    string += bottom_of_diamond(line_length, letters[0..-2])
    string
  end
  
  class << self
    def top_of_diamond(line_length, letters)
      string = ''
      midpoint = line_length / 2
      left_index = midpoint
      right_index = midpoint
      
      letters.each do |letter|
        line = ' ' * line_length
        line[left_index], line[right_index] = letter, letter
        string += "#{line}\n"
        left_index -= 1
        right_index += 1
      end
      
      string
    end
    
    def bottom_of_diamond(line_length, letters)
      string = ''
      letters = letters.reverse
      left_index = 1
      right_index = -2
      
      letters.each do |letter|
        line = ' ' * line_length
        line[left_index], line[right_index] = letter, letter
        string += "#{line}\n"
        left_index += 1
        right_index -= 1
      end
      
      string
    end
  end
end

puts Diamond.make_diamond('G')