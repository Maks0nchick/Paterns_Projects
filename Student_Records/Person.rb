class Person
  attr_reader :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  def self.check_phone_number(phone_number)
    phone_number.start_with?("+")
  end

  def self.validate_last_name(last_name)
    unless last_name.present?
      raise ArgumentError, "Фамилия должна быть заполнена"
    end
  end

  def self.validate_first_name(first_name)
    unless first_name.present?
      raise ArgumentError, "Имя должно быть заполнено"
    end
  end

  def self.validate_middle_name(middle_name)
    unless middle_name.present?
      raise ArgumentError, "Отчество должно быть заполнено"
    end
  end

  def self.validate_email(email)
    unless email.present?
      raise ArgumentError, "Email должен быть заполнен"
    end
  end

  def self.validate_github(github)
    unless github.present?
      raise ArgumentError, "Github должен быть заполнен"
    end
  end

  def self.validate_contacts(phone, telegram, email)
    unless [phone, telegram, email].any?(&:present?)
      raise ArgumentError, "Необходим хотя бы один контакт для связи"
    end
  end

  def initialize(attributes)
    self.class.validate_last_name(attributes[:last_name])
    self.class.validate_first_name(attributes[:first_name])
    self.class.validate_middle_name(attributes[:middle_name])
    self.class.validate_email(attributes[:email])
    self.class.validate_github(attributes[:github])
    unless attributes[:phone].nil? || self.class.check_phone_number(attributes[:phone])
      raise ArgumentError, "Телефонный номер должен начинаться с '+'"
    end
    self.class.validate_contacts(attributes[:phone], attributes[:telegram], attributes[:email])
    @attributes = attributes
    @id = @attributes[:id]
    @last_name = @attributes[:last_name]
    @first_name = @attributes[:first_name]
    @middle_name = @attributes[:middle_name]
    @phone = @attributes[:phone]
    @telegram = @attributes[:telegram]
    @email = @attributes[:email]
    @github = @attributes[:github]
  end

  def to_s
    "Человек #{@id}: #{@last_name} #{@first_name} #{@middle_name}, телефон: #{@phone || 'не указан'}, телеграм: #{@telegram || 'не указан'}, email: #{@email || 'не указан'}, github: #{@github || 'не указан'}"
  end

  def validate
    self.class.validate_last_name(@last_name)
    self.class.validate_first_name(@first_name)
    self.class.validate_middle_name(@middle_name)
    self.class.validate_email(@email)
    self.class.validate_github(@github)
    self.class.validate_contacts(@phone, @telegram, @email)
  end
end