def one?(collection)
  items = []
  collection.each do |item| 
    items << item if yield(item)
    return false if items.size > 1
  end
  items.size == 1
end

def one?(collection)
  collection.each_with_object([]) do |item, items|
    items << item if yield(item)
    return false if items.size > 1
  end.size == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false