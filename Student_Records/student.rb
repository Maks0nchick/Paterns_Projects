# student.rb

class Student
  # Автоматическая генерация геттеров и сеттеров
  attr_accessor :id, :last_name, :first_name, :middle_name, :telegram, :email, :github
  attr_reader :phone # Геттер для телефона отдельно, чтобы добавить проверку в сеттер

  # Метод класса для проверки валидности телефонного номера
  def Student.valid_phone?(phone)
    phone.match?(/\A\+?\d{10,15}\z/) # Телефон должен быть от 10 до 15 цифр, с опциональным "+"
  end

  # Конструктор принимает хэш параметров
  def initialize(args = {})
    @id = args[:id]
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @middle_name = args[:middle_name]
    self.phone = args[:phone] # Используем сеттер для проверки телефона
    @telegram = args[:telegram]
    @github = args[:github]
    @email = args[:email]
  end

  # Сеттер для телефона с проверкой
  def phone=(value)
    if value.nil? || Student.valid_phone?(value)
      @phone = value
    else
      raise ArgumentError, "Недопустимый формат телефонного номера: #{value}"
    end
  end

  # Метод для вывода информации об объекте
  def to_s
    info = "ID: #{@id || 'не указан'}\n"
    info += "ФИО: #{@last_name} #{@first_name} #{@middle_name}\n"
    info += "Телефон: #{@phone || 'не указан'}\n"
    info += "Телеграм: #{@telegram || 'не указан'}\n"
    info += "Почта: #{@email || 'не указана'}\n"
    info += "GitHub: #{@github || 'не указан'}"
    info
  end
end
