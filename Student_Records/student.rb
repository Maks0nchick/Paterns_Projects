 # Используем attr_accessor для автоматической генерации геттеров и сеттеров
 attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

 # Конструктор принимает один аргумент - хэш параметров
 def initialize(args = {id:, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, github: nil})
   @id = args[:id]
   @last_name = args[:last_name]
   @first_name = args[:first_name]
   @middle_name = args[:middle_name]
   @phone = args[:phone]
   @telegram = args[:telegram]
   @email = args[:email]
   @github = args[:github]
  end
  # Метод to_s для вывода информации об объекте
  def to_s
    info = "ID: #{@id}\nФИО: #{@last_name} #{@first_name} #{@middle_name}\n"
    info = "ID: #{@id || 'не указан'}\nФИО: #{@last_name} #{@first_name} #{@middle_name}\n"
    info += "Телефон: #{@phone || 'не указан'}\n"
    info += "Телеграм: #{@telegram || 'не указан'}\n"
    info += "Почта: #{@email || 'не указана'}\n"