print 'как вас зовут? '
name = gets.chomp.capitalize!

print 'какой рост? '
heigth = gets.chomp.to_i

if (heigth - 110) * 1.15 < 0
  puts "Ваш вес #{name} уже оптимальный"
else 
  puts " Ваш вес #{(heigth - 110) * 1.15} идеальный"
end