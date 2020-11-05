basket = {}
prices = []

loop do 
  puts "Введите 'стоп' в названии товара для завершения"
  puts "Введите название товара:"
  product = gets.chomp
  break if product == "стоп" 
  
  puts "Введите цену товара:"
  price = gets.chomp.to_f
  
  puts "Введите количество товара:"
  volume = gets.chomp.to_f
  
  basket.store(product, [price, volume]) 
  a = price * volume
  prices << a
  puts "Стоимость #{ product } = #{ a }"
end
puts basket
puts "Стоимость всех товаров в корзине - #{ prices.sum }"