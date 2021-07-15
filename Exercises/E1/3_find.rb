# solution w/ block

def missing(array)
  (array.first..array.last).reject { |num| array.include?(num) }
end

# solution w/ no block

def missing(array)
  missing_nums = []
  current_num = array[0]
  
  until current_num > array.last
    missing_nums << current_num unless array.include?(current_num)
    current_num += 1
  end
  
  missing_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []