  def find_two_min_indices(arr)
    # Найти два минимальных элемента с их индексами
    arr.each_with_index.min(2) { |a, b| a[0] <=> b[0] }.map { |pair| pair[1] }
  end
