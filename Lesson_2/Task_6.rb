hash = {}

loop do
  print 'Введите название товара: '
  name_product = gets.chomp
  break if name_product == 'stop'

  print 'Введите цену за единицу товара: '
  price_product = gets.chomp.to_f
  print 'Введите количество товара: '
  quantity = gets.chomp.to_f

  hash[name_product] = { price: price_product, count: quantity }

  total_price = 0
  hash.each do |item, details|
    product_total_price = details[:price] * details[:count]
    total_price += product_total_price
    puts "#{item} (#{details[:price]} руб. за шт., #{details[:count]} шт.): #{product_total_price}"
    puts "Итого: #{total_price} руб."
  end
end
