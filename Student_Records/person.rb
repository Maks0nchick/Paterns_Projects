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

  # Метод для проверки валидности имени и фамилии
  def self.valid_name?(name)
    # Проверяем, что имя или фамилия состоит только из букв и пробела
    !!name.match(/\A[A-Za-zА-Яа-яЁё\s-]+\z/)
  end

  # Метод для проверки валидности GitHub
  def self.valid_github?(github)
    # Проверяем, что ссылка на GitHub имеет формат https://github.com/username
    !!github.match(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+\z/)
  end

  # Сеттер для middle_name с проверкой валидности
  def middle_name=(middle_name)
    if Person.valid_name?(middle_name)
      @middle_name = middle_name
    else
      raise "Недопустимое имя: #{middle_name}"
    end
  end

  # Сеттер для first_name с проверкой валидности
  def first_name=(first_name)
    if Person.valid_name?(first_name)
      @first_name = first_name
    else
      raise "Недопустимое имя: #{first_name}"
    end
  end

  # Сеттер для last_name с проверкой валидности
  def last_name=(last_name)
    if Person.valid_name?(last_name)
      @last_name = last_name
    else
      raise "Недопустимая фамилия: #{last_name}"
    end
  end

  # Сеттер для github с проверкой валидности
  def github=(github)
    if Person.valid_github?(github)
      @github = github
    else
      raise "Недопустимая ссылка на GitHub: #{github}"
    end
  end

  # Сеттер для phone с проверкой валидности
  def phone=(phone)
    if Person.valid_phone?(phone)
      @phone = phone
    else
      raise "Недопустимый номер телефона: #{phone}"
    end
  end

  # Метод to_s для вывода информации об объекте
  def to_s
    info = "ID: #{id || 'не указан'}\nФИО: #{middle_name} #{first_name} #{last_name}\n"
    info += "GitHub: #{github || 'не указан'}\n"
    info += "Контакт: #{phone || 'не указан'}"
    info
  end
end
