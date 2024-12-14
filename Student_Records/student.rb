# Класс Student, наследующий от BaseStudent
class Student < Person
  attr_reader :last_name, :first_name, :middle_name, :email, :phone, :telegram

  def initialize(id:, github: nil, last_name:, first_name:, middle_name: nil, email: nil, phone: nil, telegram: nil)
    super(id: id, github: github)
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.email = email
    self.phone = phone
    self.telegram = telegram
  end

  # Валидаторы для полей
  def self.valid_name?(name)
    name.match?(/\A[\u0410-\u044Fa-zA-Z-]+\z/)
  end

  def self.valid_email?(email)
    email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.valid_phone?(phone)
    phone.nil? || phone.match?(/\A\+?\d{10,15}\z/)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || telegram.match?(/\A@[A-Za-z0-9_]+\z/)
  end

  # Сеттеры с проверкой
  def last_name=(value)
    raise ArgumentError, "Некорректная фамилия" unless self.class.valid_name?(value)

    @last_name = value
  end

  def first_name=(value)
    raise ArgumentError, "Некорректное имя" unless self.class.valid_name?(value)

    @first_name = value
  end

  def middle_name=(value)
    raise ArgumentError, "Некорректное отчество" unless value.nil? || self.class.valid_name?(value)

    @middle_name = value
  end

  def email=(value)
    raise ArgumentError, "Некорректный email" unless self.class.valid_email?(value)

    @email = value
  end

  def phone=(value)
    raise ArgumentError, "Некорректный номер телефона" unless self.class.valid_phone?(value)

    @phone = value
  end

  def telegram=(value)
    raise ArgumentError, "Некорректный Telegram" unless self.class.valid_telegram?(value)

    @telegram = value
  end

  # Проверка наличия контактов
  def has_contact?
    [@phone, @telegram, @email].any? { |contact| contact && !contact.empty? }
  end

  # Полная валидация
  def validate?
    has_github? && has_contact?
  end

  def get_short_name
    middle_initial = @middle_name ? "#{@middle_name[0]}." : ""
    "#{@last_name} #{@first_name[0]}.#{middle_initial}"
  end

  def to_s
    "ID: #{@id}, ФИО: #{get_short_name}, GitHub: #{@github || 'не указан'}, Контакты: #{contact_info}"
  end

  private

  def contact_info
    contacts = []
    contacts << "Телефон: #{@phone}" if @phone
    contacts << "Telegram: #{@telegram}" if @telegram
    contacts << "Почта: #{@email}" if @email
    contacts.empty? ? "Нет контактов" : contacts.join(", ")
  end
end