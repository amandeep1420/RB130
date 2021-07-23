=begin

P
  - write a program that takes a word and a list of possible anagrams and
    selects the correct sublist that contains the anagrams of the word
  - create Anagram class
    - initialize method that takes a string as argument
    - match method that returns array of anagrams from list passed in as arg
  ~~~
    - note: same word is not anagram
    - note: case sensitive
    - note: no mutation
    - note: 
E
  - see book
D
  - arrays
A
  - create Anagram class
    - create initialize method
  - create detector method that takes list as arg
    - initialize variable to empty array for anagram storage
    - initialize variable to array of letters from @word, sorted
    - for each word in list
      - push word to array
C
=end

class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(list)
    anagrams = []
    letters = @word.downcase.chars.sort
    list.each do |word| 
      fixed_word = word.downcase.chars.sort
      anagrams << word if fixed_word == letters && word.downcase != @word
    end
    anagrams
  end
end

    
    