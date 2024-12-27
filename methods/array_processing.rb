# Метод для ввода массива
def input_array
  puts "Введите массив чисел (целых или вещественных, через пробел):"
  gets.chomp.split.map { |n| n.include?('.') ? n.to_f : n.to_i }
end

# Задача 1.8: Найти два минимальных элемента с их индексами
def find_two_min_indices(arr)
  arr.each_with_index.min(2) { |a, b| a[0] <=> b[0] }.map { |pair| pair[1] }
end

# Задача 1.20: Найти пропущенные числа
def find_missing_numbers(arr)
  full_range = (arr.min..arr.max).to_a
  full_range - arr
end

# Задача 1.32: Подсчитать локальные максимумы
def count_local_maxima(arr)
  arr.each_cons(3).count { |left, center, right| center > left && center > right }
end

# Задача 1.44: Проверить чередование целых и вещественных чисел
def check_alternating_integers_and_floats(arr)
  (0...arr.length - 1).each do |i|
    current = arr[i]
    next_num = arr[i + 1]
    return false if current.is_a?(Integer) && next_num.is_a?(Integer) ||
                    current.is_a?(Float) && next_num.is_a?(Float)
  end
  true
end

# Задача 1.56: Среднее ненатуральных чисел больше среднего натуральных
def prime?(n)
  return false if n <= 1
  (2..Math.sqrt(n)).each { |i| return false if n % i == 0 }
  true
end

def average_of_non_primes_greater_than_prime_avg(arr)
  primes = arr.select { |num| prime?(num) }
  non_primes = arr.reject { |num| prime?(num) }
  return 0 if primes.empty?
  prime_avg = primes.sum / primes.size.to_f
  filtered_non_primes = non_primes.select { |num| num > prime_avg }
  return 0 if filtered_non_primes.empty?
  filtered_non_primes.sum / filtered_non_primes.size.to_f
end

# Основной цикл программы
loop do
  puts "\nВыберите метод (1-6):"
  puts "1. Найти индексы двух минимальных элементов"
  puts "2. Найти пропущенные числа"
  puts "3. Подсчитать локальные максимумы"
  puts "4. Проверить чередование целых и вещественных чисел"
  puts "5. Среднее ненатуральных чисел больше среднего натуральных"
  puts "6. Завершить программу"

  choice = gets.to_i

  case choice
  when 1
    arr = input_array
    puts "Индексы двух минимальных элементов: #{find_two_min_indices(arr)}"
  when 2
    arr = input_array
    puts "Пропущенные числа: #{find_missing_numbers(arr)}"
  when 3
    arr = input_array
    puts "Количество локальных максимумов: #{count_local_maxima(arr)}"
  when 4
    arr = input_array
    puts "Чередуются ли целые и вещественные числа: #{check_alternating_integers_and_floats(arr)}"
  when 5
    arr = input_array
    puts "Среднее ненатуральных чисел больше среднего натуральных: #{average_of_non_primes_greater_than_prime_avg(arr)}"
  when 6
    puts "Программа завершена. До свидания!"
    break
  else
    puts "Неверный выбор. Попробуйте снова."
  end
end
