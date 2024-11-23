# student.rb

class Student
  # Конструктор с обязательными и необязательными параметрами
  def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, github: nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  # Геттеры
  def id
    @id
  end

  def surname
    @surname
  end

  def name
    @name
  end

  def patronymic
    @patronymic
  end

  def phone
    @phone
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def github
    @github
  end

  # Сеттеры
  def id=(value)
    @id = value
  end

  def surname=(value)
    @surname = value
  end

  def name=(value)
    @name = value
  end

  def patronymic=(value)
    @patronymic = value
  end

  def phone=(value)
    @phone = value
  end

  def telegram=(value)
    @telegram = value
  end

  def email=(value)
    @email = value
  end

  def github=(value)
    @github = value
  end
end
