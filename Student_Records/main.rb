begin
  # Создание студента с корректными данными
  student1 = Student.new({ firstname: "Алексей", lastname: "Алексеев", surname: "Алексеевич" }, { id: "001", git: "alexey_git", phone: "+79061234567", email: "alexey@example.com" })

  # Валидация
  student1.validate

  puts student1

  # Создание студента с некорректными данными
  student_invalid = Student.new({ firstname: "Семен", lastname: "Сидоров", surname: "Семенович" }, { id: "002", git: "sidorov_git", phone: "12345" }) # Некорректный номер

  student_invalid.validate # Это вызовет ошибку валидации телефонного номера
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end
