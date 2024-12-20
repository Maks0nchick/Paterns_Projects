require_relative 'array_processing'

def read_array_from_file(filename)
  # Чтение массива из файла
  File.read(filename).split.map(&:to_i)
end

def main
  puts "Задача 1.8: Найти индексы двух наименьших элементов массива"
  
  # Проверяем существование файла
  filename = "array.txt"
  unless File.exist?(filename)
    puts "Файл #{filename} не найден."
    return
  end

  # Читаем массив из файла
  array = read_array_from_file(filename)
  puts "Массив из файла: #{array}"

  # Вызываем метод обработки массива
  result = find_two_min_indices(array)
  puts "Индексы двух наименьших элементов: #{result}"
end

main
