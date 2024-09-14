def sum_of_digits(n)
  digits = n.to_s.chars.map(&:to_i)
  # n.to_s -- преобразуем число n в строку (например, 123 - "123")
  # chars -- разбиваем строку на массив символов (например, "123" - ['1', '2', '3'])
  # map(&:to_i) -- преобразуем каждый символ обратно в цифру (например, ['1', '2', '3'] - [1, 2, 3])

  divisible_by_three_digits = digits.select { |d| d % 3 == 0 }

  sum = divisible_by_three_digits.sum

  return sum
end

n = 123456789
puts "Сумма цифр числа #{n}, делящихся на 3: #{sum_of_digits(n)}"