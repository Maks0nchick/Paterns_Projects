class ArrayProcessor
  attr_reader :array

  def initialize(array)
    @array = array
  end

  # Метод для ввода массива с клавиатуры
  def self.input_array
    puts "Введите элементы массива через запятую:"
    gets.chomp.split(",").map { |el| el.strip.to_f }
  end

  # Задача 1.8: Найти два минимальных элемента с их индексами
  def find_two_min_indices
    min1, min2 = @array.min(2)
    [@array.index(min1), @array.rindex(min2)]
  end

  # Задача 1.20: Найти пропущенные числа
  def find_missing_numbers
    ([@array.min, @array.max].min..[@array.min, @array.max].max).to_a - @array
  end

  # Задача 1.44: Проверить чередование целых и вещественных чисел
  def check_alternating_integers_and_floats
    (0...@array.size - 1).all? { |i| @array[i].is_a?(Integer) != @array[i + 1].is_a?(Integer) }
  end

  # Задача 1.32: Подсчитать локальные максимумы
  def count_local_maxima
    (1...@array.size - 1).count { |i| @array[i] > @array[i - 1] && @array[i] > @array[i + 1] }
  end

  # Задача 1.56: Среднее ненатуральных чисел больше среднего натуральных
  def average_of_non_primes_greater_than_prime_avg
    primes, non_primes = @array.partition { |n| prime?(n) }
    return false if primes.empty? || non_primes.empty?

    (non_primes.sum.to_f / non_primes.size) > (primes.sum.to_f / primes.size)
  end

  private

  # Проверка на простое число
  def prime?(n)
    return false if n < 2
    (2..Math.sqrt(n)).none? { |i| n % i == 0 }
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
    result = processor.check_alternating_integers_and_floats
    puts result ? "Числа чередуются." : "Числа не чередуются."
  when 5
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    result = processor.average_of_non_primes_greater_than_prime_avg
    puts result ? "Среднее ненатуральных больше среднего натуральных." : "Среднее натуральных больше либо данные некорректны."
  when 6
    puts "Программа завершена. До свидания!"
    break
  else
    puts "Неверный выбор. Попробуйте снова."
  end
end
