class Student

  # Конструктор класса
  def initialize(firstname, lastname, surname, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @lastname = lastname
    @firstname = firstname
    @surname = surname
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # Геттеры получить
  def get_id
    @id
  end

  def get_surname
    @surname
  end

  def get_firstname
    @firstname
  end

  def get_lastname
    @lastname
  end

  def get_phone
    @phone
  end

  def get_telegram
    @telegram
  end

  def get_email
    @email
  end

  def get_git
    @git
  end

  # Сеттеры задать
  def set_id(id)
    @id = id
  end

  def set_surname(surname)
    @surname = surname
  end

  def set_firstname(name)
    @firstname = firstname
  end

  def set_lastname(lastname)
    @lastname = lastname
  end

  def set_phone(phone)
    @phone = phone
  end

  def set_telegram(telegram)
    @telegram = telegram
  end

  def set_email(email)
    @email = email
  end

  def set_git(git)
    @git = git
  end
end
