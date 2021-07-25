def tester(block)
  block.call
end

# tester { puts 'cat' }

meow = Proc.new { puts 'dog' } 

tester(meow)