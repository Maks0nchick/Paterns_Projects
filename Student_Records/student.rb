# student.rb
#attr_reader создает только геттер для переменной экземпляра.
#attr_writer создает только сеттер для переменной экземпляра.
#attr_accessor создает и геттер, и сеттер для переменной экземпляра.
class Student
  # Определяем геттеры и сеттеры для каждого поля
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github
  
    def initialize(attributes = {})
      @id = attributes[:id]
      @last_name = attributes[:last_name]
      @first_name = attributes[:first_name]
      @middle_name = attributes[:middle_name]
      @phone = attributes[:phone]
      @telegram = attributes[:telegram]
      @email = attributes[:email]
      @github = attributes[:github]
    end

  # Метод для красивого вывода информации об объекте
  def to_s
    "ID: #{self.id}, ФИО: #{self.last_name} #{self.first_name} #{self.middle_name}, Телефон: #{self.phone}, Телеграм: #{self.telegram}, Почта: #{self.email}, Гит: #{self.github}"
  end
end
