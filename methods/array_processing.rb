# Метод для проверки, чередуются ли целые и вещественные числа в массиве
def check_alternating_integers_and_floats(arr)
  # Проходим по всему массиву, начиная с первого элемента
  (0...arr.length - 1).each do |i|
    current = arr[i]
    next_num = arr[i + 1]

    # Проверка типа текущего и следующего числа
    if current.is_a?(Integer) && next_num.is_a?(Integer) || current.is_a?(Float) && next_num.is_a?(Float)
      return false
    end
  end

  # Если пройден весь массив и не найдено ошибок чередования, возвращаем true
  true
end
