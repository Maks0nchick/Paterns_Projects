# main.rb
require_relative 'student'
begin
  person = Person.new(
    middle_name: "Иванович",
    first_name: "Иван",
    last_name: "Иванов",
    github: "https://github.com/ivanov",
    phone: "+12345678909",
    telegram: "ivanov_telegram",
    email: nil
  )
  person.validate  # Проверка на наличие GitHub и контакта
  puts person.to_s  # Выведет информацию о человеке
rescue => e
  puts e.message    # Выведет ошибку, если валидация не проходит
end

begin
  person_invalid = Person.new(
    middle_name: "Иванович",
    first_name: "Иван",
    last_name: "Иванов",
    github: "",
    phone: nil,
    telegram: nil,
    email: nil
  )
  person_invalid.validate  # Здесь будет выброшено исключение, так как нет GitHub и контакта
  puts person_invalid.to_s
rescue => e
  puts e.message    # => "GitHub должен быть указан"
end
