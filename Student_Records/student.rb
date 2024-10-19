# student.rb
#attr_reader создает только геттер для переменной экземпляра.
#attr_writer создает только сеттер для переменной экземпляра.
#attr_accessor создает и геттер, и сеттер для переменной экземпляра.
class Student
  # Определяем геттеры и сеттеры для каждого поля
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github
  
    def initialize(attributes = {})#хэщ
      self.id = attributes[:id]#ключ
      self.last_name = attributes[:last_name]
      self.first_name = attributes[:first_name]
      self.middle_name = attributes[:middle_name]
      self.phone = attributes[:phone]
      self.telegram = attributes[:telegram]
      self.email = attributes[:email]
      self.github = attributes[:github]
    end
end
