class Student < Person
  attr_accessor :phone, :telegram, :email

  def initialize(required_options = {}, optional_options = {}) #проверка наличия обязательных полей и применять значения устанавливая nil
    # Инициализация полей Person
    super(required_options[:firstname], required_options[:lastname], required_options[:surname], optional_options[:id], optional_options[:git])

    # Установка номера телефона с проверкой
    set_phone(optional_options.fetch(:phone, nil))
    
    # Установка других контактных данных
    @telegram = optional_options.fetch(:telegram, nil)
    @email = optional_options.fetch(:email, nil)
  end

  # Метод класса для проверки корректности телефонного номера
  def self.valid_phone_number?(phone)
    phone_regex = /^\+?\d{10,15}$/
    phone =~ phone_regex
  end

  # Метод для установки номера телефона с проверкой
  def set_phone(phone)
    raise ArgumentError, "Некорректный номер телефона: #{phone}" unless self.class.valid_phone_number?(phone)

    @phone = phone
  end

  # Метод для форматированного вывода информации об объекте
  def to_s
    person_info = super # Вызов to_s у родительского класса
    person_info += "Телефон: #{@phone}\n" if @phone
    person_info += "Telegram: #{@telegram}\n" if @telegram
    person_info += "Почта: #{@email}\n" if @email
    person_info
  end
end
