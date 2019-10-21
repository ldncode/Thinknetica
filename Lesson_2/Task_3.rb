arr = [0, 1]
value = 100

loop do
  number = arr[-1] + arr[-2]
  break if number > value

  arr.push (number)
end

print arr
