require_relative 'array_processing'

def read_array_from_file(filename)
  # Чтение массива из файла и преобразование в числа
  File.read(filename).split.map(&:to_i)
end

def main
  puts "Задача 1.56: Среднее арифметическое непростых элементов, которые больше, чем среднее арифметическое простых"

  # Проверяем существование файла
  filename = "array.txt"
  unless File.exist?(filename)
    puts "Файл #{filename} не найден."
    return
  end

  # Читаем массив из файла
  array = read_array_from_file(filename)
  puts "Массив из файла: #{array}"

  # Вызываем метод для подсчета среднего арифметического непростых чисел
  result = average_of_non_primes_greater_than_prime_avg(array)
  puts "Среднее арифметическое непростых чисел, которые больше среднего арифметического простых: #{result}"
end

main
