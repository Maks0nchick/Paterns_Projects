# student.rb
#attr_reader создает только геттер для переменной экземпляра.
#attr_writer создает только сеттер для переменной экземпляра.
#attr_accessor создает и геттер, и сеттер для переменной экземпляра.
class Student
  # Определяем геттеры и сеттеры для каждого поля
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  def initialize(id, last_name, first_name, middle_name = nil, phone = nil, telegram = nil, email = nil, github = nil)
    self.id = id
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.github = github
  end

  # Метод для красивого вывода информации об объекте
  def to_s
    "ID: #{self.id}, ФИО: #{self.last_name} #{self.first_name} #{self.middle_name}, Телефон: #{self.phone}, Телеграм: #{self.telegram}, Почта: #{self.email}, Гит: #{self.github}"
  end
end
