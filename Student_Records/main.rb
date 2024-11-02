require_relative 'student'

# Создание объектов студентов
student1 = Student.new("Иван", "Иванов", "Иванович", "001", "+79991234567", "ivan_ivanov", "ivan@example.com", "https://github.com/ivan")
student2 = Student.new("Петр", "Петров", "Петрович", "002", nil, "@petrov", "petr@example.com")
student3 = Student.new("Семен", "Сидоров", "Семенович")

# Вывод информации о студентах
puts student1
puts "------------------"
puts student2
puts "------------------"
puts student3
