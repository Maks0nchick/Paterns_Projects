# main.rb

require_relative 'person'

# Создаем объект Person с тестовыми данными
student = Person.new(surname: "Иванов", firstname: "Иван", lastname: "Иванович", github: "ivanovGit", phone: "+123456789")

# Вывод краткой информации с использованием метода getInfo
puts student.getInfo
