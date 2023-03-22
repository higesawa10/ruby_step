array = [1, 2, 3, 4].select do |i|
  i % 2 == 0
end

p array