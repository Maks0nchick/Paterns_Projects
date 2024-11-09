# student.rb
require_relative 'person'

class Student < Person
  attr_reader :surname, :firstname, :lastname, :phone_number, :telegram, :email

  def initialize(surname:, firstname:, lastname:, id:, git: nil, phone_number: nil, telegram: nil, email: nil)
    super(id: id, git: git)
    @surname, @firstname, @lastname = surname, firstname, lastname
    set_contacts(phone_number: phone_number, telegram: telegram, email: email)
  end

  # Методы установки контактов
  def set_contacts(phone_number: nil, telegram: nil, email: nil)
    self.phone_number = phone_number
    self.telegram = telegram
    self.email = email
    self.contact = format_contact
  end

  private

  # Формат контактов
  def format_contact
    [@phone_number, @telegram, @email].compact.join(' ')
  end

  # Валидация номера телефона
  def phone_number=(phone_number)
    @phone_number = phone_number if phone_number.nil? || self.class.is_phone_number?(phone_number)
  end

  def email=(email)
    @email = email if email.nil? || self.class.is_email?(email)
  end

  def telegram=(telegram)
    @telegram = telegram if telegram.nil? || self.class.is_telegram?(telegram)
  end

  public

  # Методы для вывода информации
  def full_name
    "#{@surname} #{@firstname} #{@lastname}"
  end

  def get_info
    "#{full_name}; Git: #{git}; Контакт: #{contact}"
  end

  def to_s
    "ID: #{id}, ФИО: #{full_name}, Git: #{git}, Контакт: #{contact}"
  end
end
