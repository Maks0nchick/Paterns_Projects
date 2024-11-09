# person.rb

class Person
  attr_accessor :id, :github
  attr_reader :middle_name, :first_name, :last_name, :contact

  def initialize(middle_name:, first_name:, last_name:, github:, phone: nil, telegram: nil, email: nil)
    self.middle_name = middle_name
    self.first_name = first_name
    self.last_name = last_name
    self.github = github
    self.contact = [phone, telegram, email].compact.join(' ')  # Сначала задаем контакт, если есть
  end

  # Метод для установки контакта (телефон, email или telegram)
  def contact=(contacts_string)
    # Разделяем строку контакта по пробелам
    contact = contacts_string.to_s.split[0]
    
    # Проверяем, является ли контакт допустимым
    if contact.nil? || Person.is_phone_number_valid?(contact) || Person.is_email_valid?(contact) || Person.is_telegram_valid?(contact)
      @contact = contact
    else
      raise ArgumentError.new("Неверный контакт: #{@id} #{@last_name} #{@first_name}")
    end
  end

  # Валидация телефонного номера
  def self.is_phone_number_valid?(checked_phone_number)
    phone_number_reg = /^\+?\d{1,3}\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/  # Регулярное выражение для телефонного номера
    !!(checked_phone_number =~ phone_number_reg)  # Возвращаем true, если соответствует формату
  end

  # Валидация email
  def self.is_email_valid?(checked_email)
    email_reg = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/  # Регулярное выражение для email
    !!(checked_email =~ email_reg)
  end

  # Валидация Telegram
  def self.is_telegram_valid?(checked_telegram)
    telegram_reg = /\A@[A-Za-z0-9_]{5,15}\z/  # Регулярное выражение для Telegram
    !!(checked_telegram =~ telegram_reg)
  end

  private :contact=  # Закрываем доступ к сеттеру contact из внешнего мира

  def to_s
    "ID: #{@id}\nName: #{@middle_name} #{@first_name} #{@last_name}\nGitHub: #{@github}\nContacts: #{@contact}"
  end
end
