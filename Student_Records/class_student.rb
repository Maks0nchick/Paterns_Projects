class Student
  attr_accessor :id, :lastname, :firstname, :surname, :phone, :telegram, :email, :git

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

  # Метод для форматированного вывода информации об объекте
  def to_s
    info = "Информация о студенте:\n"
    info += "ID: #{@id}\n" if @id
    info += "Фамилия: #{@lastname}\n"
    info += "Имя: #{@firstname}\n"
    info += "Отчество: #{@surname}\n"
    info += "Телефон: #{@phone}\n" if @phone
    info += "Telegram: #{@telegram}\n" if @telegram
    info += "Почта: #{@email}\n" if @email
    info += "Git: #{@git}\n" if @git
    info
  end
end
