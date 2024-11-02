require_relative 'student'
require_relative 'person'

begin
  # Создание объектов Person
  person1 = Person.new("Иван", "Иванов", "Иванович", "001", "ivanov_git")
  puts person1
  puts "------------------"

  # Создание объектов студентов с правильными номерами телефонов
  student1 = Student.new({ firstname: "Петр", lastname: "Петров", surname: "Петрович" }, { id: "002", phone: "+79161234567", email: "petr@example.com", git: "petrov_git" })
  
  student2 = Student.new({ firstname: "Семен", lastname: "Сидоров", surname: "Семенович" }, { id: "003", phone: "+79991234567", telegram: "@sidorov" })

  # Вывод информации о студентах
  puts student1
  puts "------------------"
  puts student2
  puts "------------------"

  # Пример создания с некорректным номером телефона, выбросит ошибку
  student_invalid = Student.new({ firstname: "Алексей", lastname: "Алексеев", surname: "Алексеевич" }, { id: "004", phone: "12345" }) # Некорректный номер
rescue ArgumentError => e
  puts "Ошибка создания студента: #{e.message}"
end
