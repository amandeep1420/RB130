def select(array)
  counter   = 0
  new_array = []

  while counter < array.size
    current_element = array[counter]
    new_array << current_element if yield(current_element)                          # yield to the block, passing in the current element to the block
    counter += 1
  end

  new_array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| nil }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true