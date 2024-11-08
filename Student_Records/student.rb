# student.rb

class Student
  # Определяем атрибуты как доступные только для чтения (геттеры)
  attr_reader :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github
  # Определяем атрибуты как доступные только для записи (сеттеры)
  attr_writer :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Конструктор класса
  def initialize(id, last_name, first_name, middle_name, phone = nil, telegram = nil, email = nil, github = nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @github = github
    @email = email
  end
end
  