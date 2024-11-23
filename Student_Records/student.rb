class Student
  # Автоматическая генерация геттеров и сеттеров
  attr_accessor :id, :telegram, :github
  attr_reader :last_name, :first_name, :middle_name, :email, :phone

  # Метод класса для проверки валидности телефонного номера
  def self.valid_phone?(phone)
    phone.match?(/\A\+?\d{10,15}\z/) # Телефон должен быть от 10 до 15 цифр, с опциональным "+"
  end

  # Метод класса для проверки валидности имени или фамилии
  def self.valid_name?(name)
    name.match?(/\A[А-Яа-яЁёA-Za-z-]+\z/) # Только буквы, допускаются дефисы
  end

  # Метод класса для проверки валидности Telegram-ника
  def self.valid_telegram?(telegram)
    telegram.nil? || telegram.match?(/\A@[A-Za-z0-9_]+\z/) # Должно начинаться с @ и содержать буквы, цифры или _
  end

  # Метод класса для проверки валидности email
  def self.valid_email?(email)
    email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i) # Простая проверка email
  end

  # Метод класса для проверки валидности GitHub URL
  def self.valid_github?(github)
    github.nil? || github.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[A-Za-z0-9_-]+\/?\z/) # Стандартный формат GitHub URL
  end

  # Конструктор принимает хэш параметров
  def initialize(args = {id: nil, telegram: nil, github: nil, last_name:, first_name:, middle_name: nil, email: nil, phone: nil})
    self.id = args[:id]
    self.last_name = args[:last_name]
    self.first_name = args[:first_name]
    self.middle_name = args[:middle_name]
    self.contacts = args
    self.github = args[:github]

  end

  # Сеттеры с валидацией

  def last_name=(value)
    raise ArgumentError, "Некорректная фамилия: #{value}" unless Student.valid_name?(value)

    @last_name = value
  end

  def first_name=(value)
    raise ArgumentError, "Некорректное имя: #{value}" unless Student.valid_name?(value)

    @first_name = value
  end

  def middle_name=(value)
    raise ArgumentError, "Некорректное отчество: #{value}" unless Student.valid_name?(value)

    @middle_name = value
  end

  def github=(value)
    raise ArgumentError, "Некорректный GitHub URL: #{value}" unless Student.valid_github?(value)

    @github = value
  end

  # Метод для валидации наличия GitHub
  def validate_github
    return False if @github.nil? || @github.empty?
    return True
  end

  # Метод для валидации наличия любого контакта
  def validate_contact
    if [@phone, @telegram, @email].all?(&:nil?) || [@phone, @telegram, @email].all?(&:empty?)
      return False
    end
    return True
  end

  # Метод для проведения общей валидации
  def validate
    validate_github && validate_contact
  end

  def contacts=(args = {phone: @phone, telegram: @telegram, email: @email, github: @github})
    
    raise "Некорректный номер телефона"  if Student.valid_phone?(args[:phone]) == false
    @phone = args[:phone]

    raise "Некорректный телеграм аккаунт"  if Student.valid_telegram?(args[:telegram]) == false
    @telegram = args[:telegram]

    raise "Некорректная почта"  if Student.valid_email?(args[:email]) == false
    @mail = args[:email]

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
