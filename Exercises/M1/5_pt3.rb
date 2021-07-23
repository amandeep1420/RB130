items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, item4|
  puts items.join(', ')
  puts item4
end

puts '---'

gather(items) do |item1, *items, item4|
  puts item1
  puts items.join(', ')
  puts item4
end

puts "---"

gather(items) do |item1, *other_items|
  puts item1
  puts other_items.join(', ')
end

puts "---"

gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end