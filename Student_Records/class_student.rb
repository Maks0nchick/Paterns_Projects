class Student < Person
  attr_accessor :phone, :telegram, :email

  def initialize(required_options = {}, optional_options = {})
    super(required_options[:firstname], required_options[:lastname], required_options[:surname], optional_options[:id], optional_options[:git])

    set_phone(optional_options.fetch(:phone, nil))
    set_telegram(optional_options.fetch(:telegram, nil))
    set_email(optional_options.fetch(:email, nil))
  end

  # Валидация для телефонного номера
  def self.valid_phone_number?(phone)
    phone_regex = /^\+?\d{10,15}$/
    phone =~ phone_regex
  end

  # Установка номера телефона с проверкой
  def set_phone(phone)
    raise ArgumentError, "Некорректный номер телефона: #{phone}" unless self.class.valid_phone_number?(phone)

    @phone = phone
  end

  # Валидация для Telegram
  def self.valid_telegram?(telegram)
    telegram_regex = /^@[\w\d_]{5,}$/
    telegram =~ telegram_regex
  end

  # Установка Telegram с проверкой
  def set_telegram(telegram)
    raise ArgumentError, "Некорректный Telegram: #{telegram}" unless self.class.valid_telegram?(telegram)

    @telegram = telegram
  end

  # Валидация для email
  def self.valid_email?(email)
    email_regex = /^[\w.+-]+@[\w-]+\.[\w.-]+$/
    email =~ email_regex
  end

  # Установка email с проверкой
  def set_email(email)
    raise ArgumentError, "Некорректный email: #{email}" unless self.class.valid_email?(email)

    @email = email
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
