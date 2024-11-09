# person.rb
class Person
  attr_reader :id, :git, :contact

  def initialize(id:, git: nil, contact: nil)
    @id = id
    self.git = git
    self.contact = contact
  end

  def git=(git)
    if git.nil? || self.class.is_git_valid?(git)
      @git = git
    else
      raise ArgumentError, "Неверный формат git: #{@git}"
    end
  end

  def contact=(contact)
    contact_data = contact.to_s.split[0]
    if contact.nil? || self.class.is_valid_contact?(contact_data)
      @contact = contact_data
    else
      raise ArgumentError, "Неверный формат контакта: #{@contact}"
    end
  end

  # Валидации
  def self.is_git_valid?(git)
    git =~ /^github\.com\/[A-Za-z0-9._-]+\/?$/
  end

  def self.is_valid_contact?(contact)
    is_phone_number?(contact) || is_email?(contact) || is_telegram?(contact)
  end

  def self.is_phone_number?(phone)
    phone =~ /^\+?\d{1,3}\s?\(?\d{3}\)?\s?\d{3}-?\d{2}-?\d{2}$/
  end

  def self.is_email?(email)
    email =~ /^[A-Za-z0-9._-]+@[A-Za-z0-9._-]+mail\.[A-Za-z]+$/
  end

  def self.is_telegram?(telegram)
    telegram =~ /^@[A-Za-z0-9_]{4,20}$/
  end
end
