require_relative 'student'

begin
  # Создание объектов студентов
  student1 = Student.new(firstname: "Иван", lastname: "Иванов", surname: "Иванович", phone: "+79991234567", email: "ivan@example.com")
  student2 = Student.new(firstname: "Петр", lastname: "Петров", surname: "Петрович", telegram: "@petrov")
  student3 = Student.new(firstname: "Семен", lastname: "Сидоров", surname: "Семенович")

  # Вывод информации о студентах
  puts student1
  puts "------------------"
  puts student2
  puts "------------------"
  puts student3

  # Пример создания без обязательных полей, выбросит ошибку
  student_invalid = Student.new(lastname: "Петров", telegram: "@petrov")
rescue ArgumentError => e
  puts "Ошибка создания студента: #{e.message}"
end
