print 'сторона а= '
a = gets.chomp.to_f

print 'сторона b= '
b = gets.chomp.to_f

print 'сторона с= '
c = gets.chomp.to_f

a, b, hypotenuse = [a, b, c].sort

if (a == b && b == hypotenuse)
  puts ' равнобедренный и равносторонний'
elsif a == hypotenuse || a == b || b == hypotenuse
  puts 'равнобедренный'
elsif hypotenuse**2 == a**2 + b**2
  puts 'Треугольник прямоугольный'
else
  puts 'треугольник не существует'
end