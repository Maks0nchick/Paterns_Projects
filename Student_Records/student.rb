# student.rb

class Student
  # Используем attr_accessor для автоматической генерации геттеров и сеттеров
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Конструктор с именованными аргументами, для необязательных полей задаём значение по умолчанию (nil)
  def initialize(id:, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, github: nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  # Метод to_s для вывода информации об объекте
  def to_s
    info = "ID: #{@id}\nФИО: #{@last_name} #{@first_name} #{@middle_name}\n"
    info += "Телефон: #{@phone || 'не указан'}\n"
    info += "Телеграм: #{@telegram || 'не указан'}\n"
    info += "Почта: #{@email || 'не указана'}\n"
    info += "GitHub: #{@github || 'не указан'}"
    info
  end
end
