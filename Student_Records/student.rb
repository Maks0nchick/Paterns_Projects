# student.rb
#attr_reader создает только геттер для переменной экземпляра.
#attr_writer создает только сеттер для переменной экземпляра.
#attr_accessor создает и геттер, и сеттер для переменной экземпляра.
class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  def initialize(id, last_name, first_name, middle_name, phone = nil, telegram = nil, email = nil, github = nil)
    self.id = id
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.github = github
  end

  def to_s
    "Студент #{id}: #{last_name} #{first_name} #{middle_name}, телефон: #{phone || 'не указан'}, телеграм: #{telegram || 'не указан'}, email: #{email || 'не указан'}, github: #{github || 'не указан'}"
  end
end