print 'Введите коэффециент a: '
a = gets.chomp.to_f

print 'Введите коэффециент b: '
b = gets.chomp.to_f

print 'Введите коэффециент c: '
c = gets.chomp.to_f

D = b**2 - 4 * a * c


if D == 0
  x1 = (-b) / (2 * a)
  puts "Дискриминант: #{D}, корень равен #{x1}"
elsif D > 0
  C = Math.sqrt(D)
  x1 = (-b + C / (2 * a)
  x2 = (-b - C / (2 * a)
  puts "Дискриминант: #{D}, корень x1 равен #{x1}, корень x2 равен #{x2}"
else
  puts "Дискриминант: #{D}, корней нет"
end
