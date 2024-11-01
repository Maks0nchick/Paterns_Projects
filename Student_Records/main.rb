student = Student.new(
  id: 1,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  github: "github.com/ivanov",
  contact: { type: "телефон", value: "+123456789" }
)

puts student.get_info # => "Иванов И.И.; GitHub: github.com/ivanov; Контакт: телефон (+123456789)"

student_short = StudentShort.new(student)
puts student_short.get_info # => "Иванов И.И.; GitHub: github.com/ivanov; Контакт: телефон (+123456789)"
