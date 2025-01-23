class ArrayProcessor
  attr_reader :arr

  def initialize(arr)
    @arr = arr.freeze
  end

  # Метод для ввода массива
  def self.input_array
    puts "Введите массив чисел (целых или вещественных, через пробел):"
    gets.chomp.split.map { |n| n.include?('.') ? n.to_f : n.to_i }
  end

  # Задача 1.8: Найти два минимальных элемента с их индексами
  def find_two_min_indices
    return [] if @arr.size < 2
    min1, min2 = @arr.sort.take(2)
    [@arr.index(min1), @arr.rindex(min2)]
  end

  # Задача 1.20: Найти пропущенные числа
  def find_missing_numbers
    (@arr.min..@arr.max).to_a - @arr
  end

  # Задача 1.32: Подсчитать локальные максимумы
  def count_local_maxima
    def maxima_recursive(index)
      return 0 if index >= @arr.size - 1
      count = (@arr[index - 1] < @arr[index] && @arr[index] > @arr[index + 1]) ? 1 : 0
      count + maxima_recursive(index + 1)
    end

    maxima_recursive(1) # Начинаем с индекса 1 (второй элемент)
  end

  # Задача 1.44: Проверить чередование целых и вещественных чисел
  def check_alternating_integers_and_floats
    def alternating_recursive(index)
      return true if index >= @arr.size - 1
      current = @arr[index]
      next_num = @arr[index + 1]
      return false if current.is_a?(Integer) && next_num.is_a?(Integer) ||
                      current.is_a?(Float) && next_num.is_a?(Float)
      alternating_recursive(index + 1)
    end

    alternating_recursive(0)
  end

  # Задача 1.56: Среднее ненатуральных чисел больше среднего натуральных
  def self.prime?(n)
    return false if n <= 1
    !(2..Math.sqrt(n).to_i).any? { |i| n % i == 0 }
  end

  def average_of_non_primes_greater_than_prime_avg
    primes, non_primes = @arr.partition { |num| self.class.prime?(num) }
    return 0 if primes.empty?
    prime_avg = primes.reduce(:+) / primes.size.to_f
    filtered_non_primes = non_primes.select { |num| num > prime_avg }
    return 0 if filtered_non_primes.empty?
    filtered_non_primes.reduce(:+) / filtered_non_primes.size.to_f
  end
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
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    puts "Индексы двух минимальных элементов: #{processor.find_two_min_indices}"
  when 2
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    puts "Пропущенные числа: #{processor.find_missing_numbers}"
  when 3
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    puts "Количество локальных максимумов: #{processor.count_local_maxima}"
  when 4
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    puts "Чередуются ли целые и вещественные числа: #{processor.check_alternating_integers_and_floats}"
  when 5
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    puts "Среднее ненатуральных чисел больше среднего натуральных: #{processor.average_of_non_primes_greater_than_prime_avg}"
  when 6
    puts "Программа завершена. До свидания!"
    break
  else
    puts "Неверный выбор. Попробуйте снова."
  end
end
