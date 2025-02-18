class MyCollection
    include Enumerable
  
    def initialize(array)
      @array = array
    end
  
    def each(&block)
      @array.each(&block)
    end
  
    # Реализация max
    def my_max
      return "Нет, массива!" if @array.empty? 
  
      max_element = @array.first  
      @array.each do |element|
        if element > max_element  
          max_element = element   
        end
      end
      max_element
    end
  
    # Для сравнения, my_max_by, как в предыдущем примере
    def my_max_by

        if @array.empty?
            puts "ОШИБКА: нет массива!"
            exit
        end
  
      max_element = @array.first
      max_value = yield(max_element)
  
      @array.each do |element|
        current_value = yield(element)
        if current_value > max_value
          max_element = element
          max_value = current_value
        end
      end
      max_element
    end
  end





# Main

# Пример с обычным массивом
collection = MyCollection.new([1,2,3,4,5])
result_max = collection.my_max
puts "my_max: #{result_max}" 

# Пример с пустым массивом
empty_collection = MyCollection.new([])
result_empty = empty_collection.my_max
puts "my_max: #{result_empty}"

# Пример с my_max_by
collection = MyCollection.new([5,4,3,2,1])
result_max_by = collection.my_max_by { |x| x }
puts "max_element : #{result_max_by}"
