# Базовый класс Person
class Person
  attr_reader :last_name, :first_name, :middle_name, :phone, :telegram, :mail, :github

  def initialize(last_name, first_name, middle_name, phone = nil, telegram = nil, mail = nil, github = nil)
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @mail = mail
    @github = github
  end

  # Метод для фамилии и инициалов
  def surname_with_initials
    "#{@last_name} #{@first_name[0]}.#{@middle_name[0]}."
  end

  # Метод для получения одного из контактов
  def contact_info
    if @phone
      "Телефон: #{@phone}"
    elsif @telegram
      "Телеграм: #{@telegram}"
    elsif @mail
      "Почта: #{@mail}"
    else
      "Контакт не указан"
    end
  end

  # Метод для получения GitHub
  def github_info
    @github || "GitHub не указан"
  end
end

# Класс Student наследует от Person
class Student < Person
  # Метод для краткой информации о студенте
  def getInfo
    "#{surname_with_initials}; #{github_info}; #{contact_info}"
  end
end
