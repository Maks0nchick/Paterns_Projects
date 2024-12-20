require_relative 'array_processing'

def read_array_from_file(filename)
  # Чтение массива из файла
  File.read(filename).split.map(&:to_i)
end

def main
  puts "Задача 1.32: Найти количество локальных максимумов"

  # Проверяем существование файла
  filename = "array.txt"
  unless File.exist?(filename)
    puts "Файл #{filename} не найден."
    return
  end

  # Читаем массив из файла
  array = read_array_from_file(filename)
  puts "Массив из файла: #{array}"

  # Вызываем метод для подсчёта локальных максимумов
  local_maxima_count = count_local_maxima(array)
  puts "Количество локальных максимумов: #{local_maxima_count}"
end

main
