def coprime_divisor(n)
  digits = n.to_s.chars.map(&:to_i) 
  divisors = (1..n).select { |i| n % i == 0 } 

  best_divisor = nil
  max_coprimes_count = 0

  divisors.each do |divisor|
    coprimes_count = digits.count { |digit| divisor.gcd(digit) == 1 }

    # Если найден делитель, взаимно простой с большим количеством цифр, обновляем переменные
    if coprimes_count > max_coprimes_count
      max_coprimes_count = coprimes_count
      best_divisor = divisor
    end
  end

  # Проверяем, найден ли делитель, взаимно простой с цифрами числа
  if best_divisor.nil? || max_coprimes_count == 0
    puts "Нет делителей, которые взаимно просты с цифрами числа #{n}"
  else
    puts "Делитель числа #{n}, являющийся взаимно простым с наибольшим количеством цифр числа: #{best_divisor}"
  end
end


n = 30
coprime_divisor(n)
