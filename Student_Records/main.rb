require './person.rb'
require './student.rb'
require './student_file_IO.rb'
require './student_short.rb'

def main
  begin
    # Создаем объект Person
    person = Person.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', id: 1, git: "github.com/Cowperwood/", contact: "@Bruh123")
    puts "Человек: #{person.getInfo}"

    # Создаем объект Student с полными данными
    student1 = Student.new(
      id: 5, surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон',
      phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance",
      email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/"
    )
    puts "\nСтудент 1: #{student1}"

    # Создаем объект Student с минимальными данными
    student2 = Student.new(
      id: 10, surname: 'Белокобыльский', firstname: 'Богдан', lastname: 'Витальевич',
      git: "github.com/bagdad1970/", email: 'Bogdan@mail.ru'
    )
    puts "\nСтудент 2: #{student2}"

    # Создаем объект Student_Short из уже существующего объекта Student
    student_short1 = Student_Short.create_from_student(student1)
    puts "\nКраткая информация о студенте 1: #{student_short1}"

    # Создаем объект Student_Short из строки
    student_short2 = Student_Short.create_from_string(id: 2, data: "Каупервуд Ф.А. github.com/Cowperwood/ CowperwoordF@gmail.com")
    puts "\nКраткая информация о студенте 2: #{student_short2}"

    # Пример использования массива студентов и записи в файл
    student_array = [student1, student2]  # Создаем массив студентов
    puts "\nМассив студентов:"
    p student_array

    # Сохраняем студентов в файл
    Student.write_to_txt('./student.txt', student_array)

    # Чтение студентов из файла
    student_array_txt = Student.read_from_txt('./student.txt')
    puts "\nДанные студентов из файла:"
    puts student_array_txt

  rescue => err
    puts "Произошла ошибка: #{err.message}"
  end
end

# Запуск основной программы
main
