# student.rb

class Person
  
  # Используем attr_accessor для полей, которые могут быть изменены после создания объекта
  attr_accessor :id
    # Используем attr_reader для обязательных полей, доступных только для чтения
  attr_reader :middle_name, :first_name, :last_name, :GitHub, :phone

  # Конструктор с обязательными именованными параметрами и необязательными параметрами со значениями по умолчанию
  def initialize(middle_name:, first_name:, last_name:, GitHub:, phone:)
    self.middle_name = middle_name
    self.first_name = first_name
    self.last_name = last_name
    self.id = id
    self.GitHub = GitHub
    self.phone = phone
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
    info += "GitHub: #{GitHub || 'не указан'}\n"
    info += "Контакт: #{phone || 'не указан'}"
    info
  end
end
