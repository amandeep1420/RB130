def reduce(array)
  counter = 1
  accumulator = array[0]
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  
  accumulator
end


p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']