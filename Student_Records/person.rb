# student.rb

class Person
  
  # Используем attr_accessor для полей, которые могут быть изменены после создания объекта
  attr_accessor :id, :github
  # Используем attr_reader для обязательных полей, доступных только для чтения
  attr_reader :middle_name, :first_name, :last_name, :phone

  # Конструктор с обязательными именованными параметрами и необязательными параметрами со значениями по умолчанию
  def initialize(middle_name:, first_name:, last_name:, github:, phone:)
    self.middle_name = middle_name
    self.first_name = first_name
    self.last_name = last_name
    self.id = id
    self.github = github
    self.phone = phone  # Используем setter для проверки телефона
  end

  # Метод класса для проверки допустимости телефонного номера
  def self.valid_phone?(phone)
    # Проверяем, что телефон состоит из 10 цифр или начинается с "+" и имеет 11 цифр
    !!phone.match(/\A(\+?\d{1,3})?\d{10}\z/)
  end

  # Сеттер для phone с проверкой валидности
  def phone=(phone)
    if Person.valid_phone?(phone)
      @phone = phone
    else
      raise "Недопустимый номер телефона: #{phone}"
    end
  end

  # Определяем сеттеры для обязательных параметров, чтобы использовать self в конструкторе
  def middle_name=(middle_name)
    @middle_name = middle_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  # Метод to_s для вывода информации об объекте
  def to_s
    info = "ID: #{id || 'не указан'}\nФИО: #{middle_name} #{first_name} #{last_name}\n"
    info += "GitHub: #{github || 'не указан'}\n"
    info += "Контакт: #{phone || 'не указан'}"
    info
  end
end
