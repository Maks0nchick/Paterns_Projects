# Определение методов для задачи 1

# Метод для нахождения минимального элемента с использованием for
def find_min_for(array)
  min = array[0]
  for i in 1...array.length
    if array[i] < min
      min = array[i]
    end
  end
  min
end

# Метод для нахождения минимального элемента с использованием while
def find_min_while(array)
  min = array[0]
  i = 1
  while i < array.length
    if array[i] < min
      min = array[i]
    end
    i += 1
  end
  min
end

# Метод для нахождения индекса первого положительного элемента с использованием for
def find_first_positive_for(array)
  for i in 0...array.length
    return i if array[i] > 0
  end
  nil # Возвращает nil, если положительных элементов нет
end

# Метод для нахождения индекса первого положительного элемента с использованием while
def find_first_positive_while(array)
  i = 0
  while i < array.length
    return i if array[i] > 0
    i += 1
  end
  nil # Возвращает nil, если положительных элементов нет
end

# Основная программа

# Проверяем, что передано два аргумента
if ARGV.length != 2
  puts "Usage: ruby program.rb <method_name> <file_path>"
  exit
end

# Чтение аргументов командной строки
method_name = ARGV[0] # Название метода (например, min_for, first_positive_while)
file_path = ARGV[1]   # Путь к файлу с массивом

# Чтение массива из файла
begin
  array = File.read(file_path).split.map(&:to_i)
rescue Errno::ENOENT
  puts "Файл не найден: #{file_path}"
  exit
end

# Вызов метода на основе переданного аргумента
case method_name
when "min_for"
  result = find_min_for(array)
when "min_while"
  result = find_min_while(array)
when "first_positive_for"
  result = find_first_positive_for(array)
when "first_positive_while"
  result = find_first_positive_while(array)
else
  puts "Неизвестный метод: #{method_name}"
  exit
end

# Вывод результата
puts "Результат: #{result}"
