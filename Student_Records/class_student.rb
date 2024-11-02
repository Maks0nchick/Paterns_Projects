class Student
  attr_accessor :id, :lastname, :firstname, :surname, :phone, :telegram, :email, :git

  # Конструктор класса, принимающий параметры через хеш options
  def initialize(**options)
    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  # Метод для форматированного вывода информации об объекте
  def to_s
    info = "Информация о студенте:\n"
    info += "ID: #{@id}\n" if @id
    info += "Фамилия: #{@lastname}\n" if @lastname
    info += "Имя: #{@firstname}\n" if @firstname
    info += "Отчество: #{@surname}\n" if @surname
    info += "Телефон: #{@phone}\n" if @phone
    info += "Telegram: #{@telegram}\n" if @telegram
    info += "Почта: #{@email}\n" if @email
    info += "Git: #{@git}\n" if @git
    info
  end
end
