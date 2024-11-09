# main.rb
require_relative 'person'
begin
  person = Person.new(
    middle_name: "Ivanov", 
    first_name: "Ivan", 
    last_name: "Ivanovich", 
    github: "ivanov-github", 
    phone: "+79161234567", 
    telegram: "@ivanov", 
    email: "ivanov@mail.com"
  )

  puts person.to_s  # Вывод информации о человеке

  # Попробуем установить некорректный контакт
  person.contact = "invalid_contact"  # Это вызовет исключение
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"  # Обработка ошибки
end
