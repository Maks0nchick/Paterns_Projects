class ArrayProcessor
  attr_reader :array

  def initialize(array)
    @array = array.dup.freeze # Защищаем от изменений
  end

  def each_slice(slice_size, &block)
    i = 0 
    while i < @array.size
      slice = []
      j = 0
      while j < slice_size && (i + j) < @array.size
        slice << @array[i + j]
        j += 1
      end
      block.call(slice)
      i += slice_size
    end
    nil
  end

  # Возвращает `n` элементов с максимальным значением, полученным через блок
  def max_by(n = 1, &block)
    return to_enum(:max_by, n) unless block_given?

    max_elements = nil
    max_values = nil
    each do |element|
      value = yield(element)
      if max_value.nil? || value > max_value
          max_elements = element
          max_values = value
        end
      end
      max_elements
    end
  end

  # Сортировка по значению, полученному из блока
  def sort_by(&block)
    return to_enum(:sort_by) unless block_given?

    sorted = @array.dup
    (0...sorted.size).each do |i|
      (i + 1...sorted.size).each do |j|
        if block.call(sorted[i]) > block.call(sorted[j])
          sorted[i], sorted[j] = sorted[j], sorted[i]
        end
      end
    end
    sorted
  end

  # Фильтрация элементов по условию
  def reject(&block)
    return to_enum(:reject) unless block_given?

    result = []
    @array.each do |element|
      result << element unless block.call(element)
    end
    result
  end

  # Агрегация значений массива
  def inject(initial = nil, &block)
    accumulator = initial || @array[0]
    start_index = initial.nil? ? 1 : 0

    @array[start_index..-1].each do |element|
      accumulator = block.call(accumulator, element)
    end
    accumulator
  end

  # Повторяет массив `n` раз и передаёт элементы в блок
  def cycle(n, &block)
    return to_enum(:cycle, n) unless block_given?
    return nil if n <= 0

    i = 0
    while i < n
      j = 0
      while j < @array.size
        block.call(@array[j])
        j += 1
      end
      i += 1
    end
    nil
  end
end
