class Student
  attr_accessor :id, :lastname, :firstname, :surname, :phone, :telegram, :email, :git

  # Конструктор класса, принимающий параметры через хеш options
  def initialize(**options)
    @firstname = options[:firstname]
    @lastname = options[:lastname]
    @surname = options[:surname]
    @id = options[:id]
    @phone = options[:phone]
    @telegram = options[:telegram]
    @email = options[:email]
    @git = options[:git]
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
