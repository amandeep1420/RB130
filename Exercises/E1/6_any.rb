def any?(array)
  array.each { |element| return true if yield(element) == true } # == true not necessary - any? just checks for truthiness
  false
end

p any?([1, 3, 5, 6]) { |value| 5 } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false