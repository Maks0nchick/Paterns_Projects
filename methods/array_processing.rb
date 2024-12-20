# Метод для подсчёта локальных максимумов
def count_local_maxima(arr)
  # Проверяем соседей каждого элемента (кроме первого и последнего)
  arr.each_cons(3).count do |left, center, right|
    center > left && center > right
  end
end
