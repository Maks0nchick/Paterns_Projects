# Базовый класс, содержащий общую логику для студентов
class Person
  attr_accessor :id
  attr_reader :last_name, :first_name, :middle_name, :email, :phone, :telegram, :github

  def self.valid_phone?(phone)
    phone.match?(/\A\+?\d{10,15}\z/)
  end

  def self.valid_name?(name)
    name.match?(/\A[\u0410-\u044Fa-zA-Z-]+\z/)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || telegram.match?(/\A@[A-Za-z0-9_]+\z/)
  end

  def self.valid_email?(email)
    email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.valid_github?(github)
    github.nil? || github.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[A-Za-z0-9_-]+\/?\z/)
  end

  def initialize(args = {})
    @id = args[:id]
    self.last_name = args[:last_name]
    self.first_name = args[:first_name]
    self.middle_name = args[:middle_name]
    self.contacts = args
  end

  def last_name=(value)
    raise ArgumentError, "Некорректная фамилия: #{value}" unless self.class.valid_name?(value)
    @last_name = value
  end

  def first_name=(value)
    raise ArgumentError, "Некорректное имя: #{value}" unless self.class.valid_name?(value)
    @first_name = value
  end

  def middle_name=(value)
    raise ArgumentError, "Некорректное отчество: #{value}" unless value.nil? || self.class.valid_name?(value)
    @middle_name = value
  end

  def contacts=(args = {})
    @phone = args[:phone]
    raise "Некорректный номер телефона" if @phone && !self.class.valid_phone?(@phone)

    @telegram = args[:telegram]
    raise "Некорректный телеграм аккаунт" if @telegram && !self.class.valid_telegram?(@telegram)

    @email = args[:email]
    raise "Некорректная почта" if @email && !self.class.valid_email?(@email)

    @github = args[:github]
    raise "Некорректный GitHub URL" if @github && !self.class.valid_github?(@github)
  end

  def get_contact
    if @phone&.strip&.length&.positive?
      "Телефон: #{@phone}"
    elsif @telegram&.strip&.length&.positive?
      "Телеграм: #{@telegram}"
    elsif @email&.strip&.length&.positive?
      "Почта: #{@email}"
    else
      "Контакты отсутствуют"
    end
  end

  def to_s
    "ID: #{@id || 'не указан'}\nФИО: #{@last_name} #{@first_name} #{@middle_name || ''}\nТелефон: #{@phone || 'не указан'}\nТелеграм: #{@telegram || 'не указан'}\nПочта: #{@email || 'не указана'}\nGitHub: #{@github || 'не указан'}"
  end
end