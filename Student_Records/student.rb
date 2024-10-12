# student.rb
class Student
  # Определяем геттеры и сеттеры для каждого поля
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Конструктор
  def initialize(id, last_name, first_name, middle_name = nil, phone = nil, telegram = nil, email = nil, github = nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  # Метод для красивого вывода информации об объекте
  def to_s
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@middle_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@github}"
  end
end
