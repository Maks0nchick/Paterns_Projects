class ArrayProcessor  
  attr_reader :array

  def initialize(array)
    @array = array
  end

  # Метод для ввода массива с клавиатуры
  def self.input_array
    puts "Введите элементы массива через запятую:"
    gets.chomp.split(",").map { |el| 
      el.strip.include?('.') ? el.strip.to_f : el.strip.to_i
    }
  end

  # Метод для поиска индексов двух минимальных элементов
  def find_two_min_indices
    min1, min2 = @array.min(2)
    [@array.index(min1), @array.rindex(min2)]
  end

  # Метод для поиска пропущенных чисел
  def find_missing_numbers
    min_val = @array.min.to_i
    max_val = @array.max.to_i
    (min_val..max_val).to_a - @array
  end

  # Метод для проверки чередования целых и вещественных чисел
  def check_alternating_integers_and_floats
    return false if @array.size < 2 # Проверка на размер массива
    (0...@array.size - 1).all? { |i| @array[i].is_a?(Integer) != @array[i + 1].is_a?(Integer)}
  end


  # Подсчитать локальные максимумы
  def count_local_maxima
    (1...@array.size - 1).count { |i| @array[i] > @array[i - 1] && @array[i] > @array[i + 1] }
  end


  def average_of_non_primes_greater_than_prime_avg
    # Разделяем массив на натуральные и ненатуральные числа
    natural_numbers = @array.select { |el| el.is_a?(Integer) && el > 0 }
    non_natural_numbers = @array.reject { |el| el.is_a?(Integer) && el > 0 }
    
    # Проверяем, есть ли элементы для вычисления среднего
    return false if natural_numbers.empty? || non_natural_numbers.empty?
    
    # Вычисляем среднее для обоих типов чисел
    sred_natural = natural_numbers.sum / natural_numbers.size.to_f
    sred_non_natural = non_natural_numbers.sum / non_natural_numbers.size.to_f
    
    # Возвращаем результат
    sred_non_natural > sred_natural
  end
  
  private
end

# Основной цикл программы

loop do # Бесконечный цикл, прерывается с помощью break
  # Меню
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
    puts "Чередование целых и вещественных чисел: #{result}"
  when 5
    arr = ArrayProcessor.input_array
    processor = ArrayProcessor.new(arr)
    result = processor.average_of_non_primes_greater_than_prime_avg
    puts "Среднее ненатуральных чисел больше среднего натуральных: #{processor.average_of_non_primes_greater_than_prime_avg}"
  when 6
    puts "Программа завершена. До свидания!"
    break
  else
    puts "Неверный выбор. Попробуйте снова."
  end
end
