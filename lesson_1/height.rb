print "как вас зовут? "
name = gets.chomp.capitalize!

print "какой рост? "
heigth = gets.chomp

if (heigth.to_i - 110)*1.15 <0
  puts "Ваш вес #{name} уже оптимальный"
else 
	puts " Ваш вес #{(heigth.to_i - 110)*1.15} идеальный"
end