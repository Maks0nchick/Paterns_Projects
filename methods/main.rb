require_relative 'array_processing'

def read_array_from_file(filename)
  # Чтение массива из файла и преобразование в числа
  File.read(filename).split.map { |x| x.include?('.') ? x.to_f : x.to_i }
end

def main
  puts "Задача 1.44: Проверка, чередуются ли целые и вещественные числа в массиве"

  # Проверяем существование файла
  filename = "array.txt"
  unless File.exist?(filename)
    puts "Файл #{filename} не найден."
    return
  end

  # Читаем массив из файла
  array = read_array_from_file(filename)
  puts "Массив из файла: #{array}"

  # Вызываем метод проверки чередования целых и вещественных чисел
  result = check_alternating_integers_and_floats(array)
  if result
    puts "Числа чередуются."
  else
    puts "Числа не чередуются."
  end
end

main
