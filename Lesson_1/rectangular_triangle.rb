print 'Введите первую сторону треугольника: '
a = gets.chomp.to_f

print 'Введите вторую сторону треугольника: '
b = gets.chomp.to_f

print 'Введите третью сторону треугольника: '
c = gets.chomp.to_f

if a == b && b == c
  puts 'Треугольник равносторонний'
elsif a == b || a == c || b == c
  puts 'Треугольник равнобедренный'
elsif a**2 == (b**2 + c**2) ||  b**2 == (a**2 + c**2) || c**2 == (a**2 + b**2)
  puts 'Треугольник прямоугольный'
else
  puts 'Треугольник разносторонний'
end  