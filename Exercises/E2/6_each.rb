def each_with_index(array)
  index = 0
  loop do
    begin
      current_element = array.fetch(index)
      yield(current_element, index)
      index += 1
    rescue IndexError
      break
    end
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]