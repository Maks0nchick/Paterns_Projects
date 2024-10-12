# main.rb
require_relative 'student'

student1 = Student.new(1, "Иванов", "Иван", "Иванович", "+7-918-999-69-96", "@ivanov", "ivanov@mail.com", "github.com/ivanov")
student2 = Student.new(2, "Петров", "Петр", "Петрович")

puts student1
puts student2
