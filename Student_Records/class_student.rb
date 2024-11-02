class Student
  attr_accessor :id, :lastname, :firstname, :surname, :phone, :telegram, :email, :git

  # Конструктор класса, принимающий параметры через два хэша
  def initialize(required_options = {}, optional_options = {}) #проверка наличия обязательных полей и применять значения устанавливая nil
    # Проверка обязательных полей
    required_fields = [:firstname, :lastname, :surname]
    missing_fields = required_fields.select { |field| required_options[field].nil? }
    
    unless missing_fields.empty?
      raise ArgumentError, "Отсутствуют обязательные поля: #{missing_fields.join(', ')}"
    end

    # Установка обязательных полей
    @firstname = required_options[:firstname]
    @lastname = required_options[:lastname]
    @surname = required_options[:surname]

    # Установка необязательных полей с использованием хэша optional_options
    @id = optional_options.fetch(:id, nil)
    @phone = optional_options.fetch(:phone, nil)
    @telegram = optional_options.fetch(:telegram, nil)
    @email = optional_options.fetch(:email, nil)
    @git = optional_options.fetch(:git, nil)
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
