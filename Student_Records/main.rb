require_relative 'student'

# Создание объектов студентов
student1 = Student.new(firstname: "Иван", lastname: "Иванов", surname: "Иванович", id: "001", phone: "+79991234567", telegram: "ivan_ivanov", email: "ivan@example.com", git: "https://github.com/ivan")
student2 = Student.new(firstname: "Петр", lastname: "Петров", surname: "Петрович", id: "002", telegram: "@petrov", email: "petr@example.com")
student3 = Student.new(firstname: "Семен", lastname: "Сидоров", surname: "Семенович")

# Вывод информации о студентах
puts student1
puts "------------------"
puts student2
puts "------------------"
puts student3
