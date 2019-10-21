print 'Please, enter your name: '
name = gets.chomp.capitalize

print 'Please, enter your height: '
altitude = gets.chomp.to_i

if (altitude - 110) >= 0
  print"Your fighting weight, #{name} : #{altitude - 110}"n
else
  print 'Your weight optimal'
end
