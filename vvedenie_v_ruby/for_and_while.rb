# Метод 1: Найти минимальный элемент с помощью цикла for
def find_minimum_for(arr)
  min_value = arr[0]  # Предполагаем, что первый элемент - минимальный
  for i in 1...arr.size  # Проходим по остальным элементам массива
    if arr[i] < min_value
      min_value = arr[i]  # Обновляем минимальное значение
    end
  end
  min_value  # Возвращаем минимальное значение
end

# Метод 2: Найти индекс первого положительного элемента с помощью цикла for
def find_first_positive_index_for(arr)
  for i in 0...arr.size
    if arr[i] > 0
      return i  # Возвращаем индекс первого положительного элемента
    end
  end
  nil  # Если положительных элементов нет, возвращаем nil
end

# Метод 1: Найти минимальный элемент с помощью цикла while
def find_minimum_while(arr)
  min_value = arr[0]  # Предполагаем, что первый элемент - минимальный
  i = 1  # Начинаем с индекса 1
  while i < arr.size
    if arr[i] < min_value
      min_value = arr[i]  # Обновляем минимальное значение
    end
    i += 1  # Переходим к следующему элементу
  end
  min_value  # Возвращаем минимальное значение
end

# Метод 2: Найти индекс первого положительного элемента с помощью цикла while
def find_first_positive_index_while(arr)
  i = 0  # Начинаем с первого элемента
  while i < arr.size
    if arr[i] > 0
      return i  # Возвращаем индекс первого положительного элемента
    end
    i += 1  # Переходим к следующему элементу
  end
  nil  # Если положительных элементов нет, возвращаем nil
end

arr = [-7, -5, -3, 0, 4, 10]

# Поиск минимального элемента с использованием for
puts "Минимальный элемент (for): #{find_minimum_for(arr)}"

# Поиск индекса первого положительного элемента с использованием for
first_positive_for = find_first_positive_index_for(arr)
puts "Индекс первого положительного элемента (for): #{first_positive_for.nil? ? 'Нет положительных элементов' : first_positive_for}"

# Поиск минимального элемента с использованием while
puts "Минимальный элемент (while): #{find_minimum_while(arr)}"

# Поиск индекса первого положительного элемента с использованием while
first_positive_while = find_first_positive_index_while(arr)
puts "Индекс первого положительного элемента (while): #{first_positive_while.nil? ? 'Нет положительных элементов' : first_positive_while}"
