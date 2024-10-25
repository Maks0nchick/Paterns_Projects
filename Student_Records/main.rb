# main.rb
require_relative 'student'

student1 = Student.new(1, "Иванов", "Иван", "Иванович", "+7-918-999-69-96", "@ivanov", "ivanov@mail.com", "github.com/ivanov")
student2 = Student.new(2, "Петров", "Петр", "Петрович")

puts student1.to_s
puts student2.to_s

require_relative 'person'

person = Person.new(
  id: 1,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  phone: "+7-918-999-69-96",
  telegram: "@ivanov",
  email: "ivanov@mail.com",
  github: "github.com/ivanov"
)

person1 = Person.new(id: 1, last_name: "Иванов", first_name: "Иван", middle_name: "Иванович", phone: "+7-918-999-69-96", telegram: "@ivanov", email: "ivanov@mail.com", github: "github.com/ivanov")
puts person1.to_s

person.set_contacts(phone: "+7-918-999-69-97", telegram: "@ivanov2")
puts person.to_s

begin
  person2 = Person.new(
    id: 2,
    last_name: "Петров",
    first_name: "Петр",
    middle_name: "Петрович",
    phone: "1234567890",
    telegram: "@petrov",
    email: "petrov@mail.com",
    github: "github.com/petrov"
  )
rescue ArgumentError => e
  puts e.message
end
