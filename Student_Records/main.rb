# main.rb
require_relative 'student'

# Создание объектов класса Student
student1 = Student.new(1, "Иванов", "Иван", "Иванович", "1234567890", "@ivanov", "ivanov@mail.com", "github.com/ivanov")
student2 = Student.new(2, "Петров", "Петр", "Петрович", "2345678901", "@petrov", "petrov@mail.com", "github.com/petrov")
student3 = Student.new(3, "Сидоров", "Сидор", "Сидорович", "3456789012", "@sidorov", "sidorov@mail.com", "github.com/sidorov")

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts "-" * 30
puts student2
puts "-" * 30
puts student3
