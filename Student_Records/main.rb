# main.rb

require_relative 'student'

# Создание объектов класса Student с передачей параметров через хэш
student1 = Student.new({ id: 1, last_name: "Иванов", first_name: "Иван", middle_name: "Иванович", phone: "1234567890", telegram: "@ivanov", email: "ivanov@mail.com", github: "github.com/ivanov" })
student2 = Student.new({ id: 2, last_name: "Петров", first_name: "Петр", middle_name: "Петрович", phone: "0987654321" })
student3 = Student.new({ id: 3, last_name: "Сидоров", first_name: "Сидор", middle_name: "Сидорович", email: "sidorov@mail.com" })

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts student1
puts "-" * 30
puts student2
puts "-" * 30
puts student3
