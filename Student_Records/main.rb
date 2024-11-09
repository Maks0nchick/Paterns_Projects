# main.rb
require_relative 'student'

begin
  # Создаём объект с корректным номером телефона
  person1 = Person.new(middle_name: "Иванович", first_name: "Иван", last_name: "Иванов", github: "github.com/ivanov", phone: "+12345678901")
  puts person1  # => ID: не указан, ФИО: Иванович Иван Иванов, GitHub: github.com/ivanov, Контакт: +12345678901
rescue => e
  puts e.message  # Если телефон неправильный, отобразится ошибка
end

begin
  # Создаём объект с некорректным номером телефона
  person2 = Person.new(middle_name: "Петрович", first_name: "Петр", last_name: "Петров", github: "github.com/petrov", phone: "12345")
  puts person2  # Ошибка, номер телефона невалидный
rescue => e
  puts e.message  # => Недопустимый номер телефона: 12345
end
