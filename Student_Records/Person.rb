class Person
  # Определяем геттеры и сеттеры для каждого поля
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Метод класса для проверки телефонного номера
  def self.check_phone_number(phone_number)
    # Проверяем, что телефонный номер начинается с "+"
    phone_number.start_with?("+")
  end

  # Модифицируем конструктор для проверки телефонного номера
  def initialize(attributes = {})
    unless self.class.check_phone_number(attributes[:phone])
      puts "Телефонный номер должен начинаться с '+'"
    end
    self.id = attributes[:id]
    self.last_name = attributes[:last_name]
    self.first_name = attributes[:first_name]
    self.middle_name = attributes[:middle_name]
    self.phone = attributes[:phone]
    self.telegram = attributes[:telegram]
    self.email = attributes[:email]
    self.github = attributes[:github]
  end

  # Модифицируем сеттер для телефонного номера для проверки корректности
  def phone=(value)
    unless self.class.check_phone_number(value)
      puts "Телефонный номер должен начинаться с '+'"
    end
    @phone = value
  end
end