print "значение а = "
a = gets.chomp.to_i

print "значение b = "
b = gets.chomp.to_i

print "значение c = "
c = gets.chomp.to_i

d = b**2 - 4*a*c

if d > 0
  i = Math.sqrt(d)
else
	puts "невозможно вычислить отрицательный корень"
end

if d > 0 
	puts " d = #{d}  x_1= #{(-b + i) / (2 * a)}; x_2 = #{(-b - i) / (2 * a)}"

elsif d == 0
  puts "d = #{d} x_1=x_2= #{-b / (2*a)}"

else
  puts "Корней нет!"

end    	