print "сторона а"
a = gets.chomp.to_i

print "сторона b"
b = gets.chomp.to_i

print "сторона с"
c = gets.chomp.to_i

if (a == b && b == c) 
	puts " равнобедренный и равносторонний"

elsif (a == c && a == b)
  puts "равнобедренный"

elsif c**2 == a**2 + b**2	
	puts "прямоугольный"

else
	puts "треугольник не существует"	
end