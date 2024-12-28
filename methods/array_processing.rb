class ArrayMethods

  attr_reader :array

  def initialize(array)
    self.array = array
  end

  private def array=(array)
    @array = array
  end

  def each_slice(slice_size)
    for i in (0...array.size).step(slice_size)
      slice = array[i, slice_size]
      yield(slice) if block_given?
    end
    nil
  end
