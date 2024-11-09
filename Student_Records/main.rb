# main.rb
require_relative 'student'
begin
  person = Person.new(middle_name: "Иванович", first_name: "Иван", last_name: "Иванов", github: "https://github.com/ivanov", phone: "+1234567890")
  puts person.to_s  # Успешно создаст объект с корректными данными
rescue => e
  puts e.message    # Выведет ошибку, если одно из полей не соответствует валидации
end

begin
  person_invalid = Person.new(middle_name: "Иванович", first_name: "Иван", last_name: "Иванов", github: "https://github.com/ivanov!", phone: "+1234567890")
  puts person_invalid.to_s
rescue => e
  puts e.message    # Выведет ошибку: "Недопустимая ссылка на GitHub"
end
