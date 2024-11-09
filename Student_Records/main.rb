# main.rb

require_relative 'student'  # Подключаем файл student.rb, где находится класс Person

begin
  # Создаем объект с заполненными всеми полями
  student1 = Person.new(middle_name: "Иванов", first_name: "Иван", last_name: "Иванович", id: 1, github: "github.com/ivanov", phone: "+1234567890")
  puts student1  # Вывод всей информации о студенте
rescue => e
  puts e.message
end

begin
  # Создаем объект, указывая только обязательные поля
  student2 = Person.new(middle_name: "Петров", first_name: "Петр", last_name: "Петрович")
  puts student2  # Поля id, github, и phone будут отображены как 'не указан'
rescue => e
  puts e.message
end

begin
  # Создаем объект с частью необязательных полей
  student3 = Person.new(middle_name: "Сидоров", first_name: "Сидор", last_name: "Сидорович", phone: "1234567890")
  puts student3  # Поля id и github будут отображены как 'не указан'
rescue => e
  puts e.message
end
