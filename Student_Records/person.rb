# person.rb

class Person
  attr_reader :surname, :firstname, :lastname, :github, :phone, :telegram, :email

  def initialize(surname:, firstname:, lastname:, id: nil, github: nil, phone: nil, telegram: nil, email: nil)
    @surname = surname
    @firstname = firstname
    @lastname = lastname
    @id = id
    @github = github
    @phone = phone
    @telegram = telegram
    @email = email
  end

  # Метод для получения фамилии с инициалами
  def full_name_with_initials
    "#{surname} #{firstname[0]}.#{lastname[0]}."
  end

  # Метод для получения информации о GitHub
  def github_info
    github || 'GitHub не указан'
  end

  # Метод для получения одного из доступных контактов
  def contact_info
    if phone
      "Телефон: #{phone}"
    elsif telegram
      "Telegram: #{telegram}"
    elsif email
      "Email: #{email}"
    else
      "Контакт не указан"
    end
  end

  # Метод getInfo для получения краткой информации о студенте
  def getInfo
    "#{full_name_with_initials}; GitHub: #{github_info}; Связь: #{contact_info}"
  end
end
