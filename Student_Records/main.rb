# main.rb
require_relative 'student'

student1 = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", middle_name: "Иванович", phone: "+7-918-999-69-96", telegram: "@ivanov", email: "ivanov@mail.com", github: "github.com/ivanov")
student2 = Student.new(id: 2, last_name: "Петров", first_name: "Петр", middle_name: "Петрович")

puts student1
puts student2
