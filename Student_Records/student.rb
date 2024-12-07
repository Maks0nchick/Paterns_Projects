class Student < Person
  attr_reader :last_name, :first_name, :middle_name, :email, :phone, :telegram

  def initialize(args = { id: nil, last_name:, first_name:, middle_name: nil, email: nil, phone: nil, telegram: nil, github: nil })
    super(
      id: args[:id],
      surname_initials: generate_surname_initials(args[:last_name], args[:first_name], args[:middle_name]),
      github: args[:github],
      contact: determine_contact(args)
    )

    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @middle_name = args[:middle_name]
    @email = args[:email]
    @phone = args[:phone]
    @telegram = args[:telegram]
  end

  private

  # Генерация фамилии и инициалов
  def generate_surname_initials(last_name, first_name, middle_name)
    initials = "#{first_name[0]}.#{middle_name.nil? ? '' : middle_name[0] + '.'}"
    "#{last_name} #{initials}"
  end

  # Определение основного контакта
  def determine_contact(args)
    return "Телефон: #{args[:phone]}" if args[:phone] && !args[:phone].empty?
    return "Телеграм: #{args[:telegram]}" if args[:telegram] && !args[:telegram].empty?
    return "Почта: #{args[:email]}" if args[:email] && !args[:email].empty?
    "Контакт не указан"
  end
end
