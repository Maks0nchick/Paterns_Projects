def main
  # Создание объекта Person
  person = Person.new(id: 1, github: "https://github.com/example", contact: "example@example.com")
  puts "=== Объект Person ==="
  puts person.to_s
  puts

  # Создание объекта Student
  student = Student.new(
    id: 2,
    github: "https://github.com/studentexample",
    last_name: "Иванов",
    first_name: "Иван",
    middle_name: "Иванович",
    phone: "+79161234567",
    telegram: "@ivan_student",
    email: "ivan@example.com"
  )
  puts "=== Объект Student ==="
  puts student.to_s
  puts
  puts "Краткая информация о студенте: #{student.get_short_name}"
  puts "Полная информация о студенте: #{student.getInfo}"
  puts

  # Создание объекта StudentShort из объекта Student
  student_short = StudentShort.new(student)
  puts "=== Объект StudentShort (созданный из Student) ==="
  puts student_short.to_s
  puts

  # Создание объекта StudentShort из строки
  student_short_from_string = StudentShort.from_string(
    3,
    "Петров П.И.",
    "https://github.com/petrov",
    "Телефон: +79876543210 ; Email: petrov@example.com"
  )
  puts "=== Объект StudentShort (созданный из строки) ==="
  puts student_short_from_string.to_s
end

main
