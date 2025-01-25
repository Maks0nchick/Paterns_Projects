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
    sorted_indices = @array.zip((0...@array.size)).sort_by { |val, _idx| val }.map { |_, idx| idx }
    sorted_indices.first(2)
  end

  # Задача 1.20: Найти пропущенные числа
  def find_missing_numbers
    min, max = @array.min, @array.max
    full_range = (min..max).to_a
    full_range - @array
  end

  # Задача 1.44: Проверить чередование целых и вещественных чисел
  def check_alternating_integers_and_floats
    @array.each_cons(2).all? do |a, b|
      (a.is_a?(Integer) && b.is_a?(Float)) || (a.is_a?(Float) && b.is_a?(Integer))
    end
  end

  # Задача 1.32: Подсчитать локальные максимумы
  def count_local_maxima
    return 0 if @array.size < 3 # Локальный максимум возможен только в массиве с >= 3 элементами

    @array.each_cons(3).count do |prev, curr, nxt|
      curr > prev && curr > nxt
    end
  end

  # Задача 1.56: Среднее ненатуральных чисел больше среднего натуральных
  def average_of_non_primes_greater_than_prime_avg
    naturals = @array.select { |num| num.is_a?(Integer) && num > 1 && prime?(num) }
    non_naturals = @array.reject { |num| naturals.include?(num) }
    return false if naturals.empty? || non_naturals.empty?

    naturals_avg = naturals.sum.to_f / naturals.size
    non_naturals_avg = non_naturals.sum.to_f / non_naturals.size
    non_naturals_avg > naturals_avg
  end

  private

  # Проверка на простое число
  def prime?(n)
    return false if n < 2
    (2..Math.sqrt(n).to_i).none? { |i| (n % i).zero? }
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
