def types(birds)
  yield(birds)
end

types(%w(raven finch hawk eagle)) { |_, _, *raptors| puts raptors }