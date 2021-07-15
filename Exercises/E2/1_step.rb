def step(starting_value, ending_value, step_value)
  until starting_value > ending_value
    yield(starting_value)
    starting_value += step_value
  end
  # should return some integer based on inputs? only takes integers...
end

step(1, 10, 3) { |value| puts "value = #{value}" }