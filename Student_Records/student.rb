# Класс Student наследует Person
class Student < Person
  attr_reader :last_name, :first_name, :middle_name

  def initialize(args = { id: nil, github: nil, last_name:, first_name:, middle_name: nil, phone: nil, telegram: nil, email: nil })
    super(id: args[:id], github: args[:github])
    self.last_name = args[:last_name]
    self.first_name = args[:first_name]
    self.middle_name = args[:middle_name]
    self.set_contacts(phone: args[:phone], telegram: args[:telegram], email: args[:email])
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
    raise ArgumentError, "Некорректное отчество: #{value}" unless value.nil? || Student.valid_name?(value)
    @middle_name = value
  end

  # Метод для установки контактов с валидацией
  def set_contacts(phone: nil, telegram: nil, email: nil)
    @contact = []
    @contact << "Телефон: #{phone}" if phone && Student.valid_phone?(phone)
    @contact << "Telegram: #{telegram}" if telegram && Student.valid_telegram?(telegram)
    @contact << "Email: #{email}" if email && Student.valid_email?(email)
    @contact = @contact.join(' ; ')
  end

  # Валидация данных
  def self.valid_phone?(phone)
    phone.match?(/\A\+?\d{10,15}\z/)
  end

  def self.valid_name?(name)
    name.match?(/\A[А-Яа-яЁёA-Za-z-]+\z/)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || telegram.match?(/\A@[A-Za-z0-9_]+\z/)
  end

  def self.valid_email?(email)
    email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  # Методы для получения краткой информации
  def get_short_name
    "#{@last_name} #{first_name[0]}.#{middle_name.nil? ? '' : middle_name[0] + '.'}"
  end

  def getInfo
    "#{get_short_name}; GitHub: #{@github || 'не указан'}; Связь: #{get_contact}"
  end
end