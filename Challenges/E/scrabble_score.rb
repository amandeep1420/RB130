=begin

P
  - write a program that, given a word, computes the Scrabble score for that word.
  - input: instance of Scrabble class instantiated with one arg, a string
  - 'output': score (an instance method)
  ~
  - class info:
    - Scrabble class
      - #initialize(a string)
        - string serves as "identity" of instance/object
      - #score
        - returns integer representing score of "identity"
    - scoring system: see book
      - create constant for scoring system
  ~
    - note: base score is always zero
    - note: should be case agnostic when calculating score
    - note: any other character not specified in scoring schema should not add 
            to score
E
  - see book
D
  - hash w/ arrays for keys in scoring schema
A
  - create Scrabble class
    - initialize method: instance variable '@word' initialized to argument
    
    - constant for scoring system
      - hash w/ arrays for each key and integers for values
    - score method
    
      - how do we account for escaped characters per the test suite...
        ....probably need regex....
      - trying splitting with /\s/ as arg
      - transform resultant array, upcasing each character
      - initialize 'score' local variable to 0
      - for each character in resultant array
        - iterate over each key in hash
          - if character is in key, add value to score variable
      - return score variable


C
=end

class Scrabble
  SCORING_SYSTEM = 
  {%w(A E I O U L N R S T) => 1, 
   %w(D G)                 => 2,
   %w(B C M P)             => 3,
   %w(F H V W Y)           => 4,
   %w(K)                   => 5,
   %w(J X)                 => 8,
   %w(Q Z)                 => 10,
  }
  
  def Scrabble.score(string)
    scrabble_object = Scrabble.new(string)
    scrabble_object.score
  end
    
  
  def initialize(string)
    @word = string
  end
  
  def score
    begin
      generate_characters_array unless @characters
      score = 0
      
      @characters.each do |character|
        SCORING_SYSTEM.each do |array, value|
          score += value if array.include?(character)
        end
      end
      
      score
    rescue NoMethodError
      0
    end
  end
  
  private
  
  def generate_characters_array
    characters = @word.split(/\s/&&(''))
    upcased_characters = characters.map(&:upcase)
    @characters = upcased_characters
  end
end
  
Scrabble.new(" \t\n").score

Scrabble.new('street').score