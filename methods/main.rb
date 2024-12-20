require_relative 'array_processing'

def read_array_from_file(filename)
  # Чтение массива из файла
  File.read(filename).split.map(&:to_i)
end

def main
  puts "Задача 1.20: Найти все пропущенные числа в массиве"

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
  missing_numbers = find_missing_numbers(array)
  puts "Пропущенные числа: #{missing_numbers}"
end

main
