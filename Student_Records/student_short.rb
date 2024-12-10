class StudentShort
  # Поля только для чтения
  attr_reader :id, :initials, :github, :contact

  # Конструктор 1: Принимает объект класса Student
  def initialize(student)
    @id = student.id
    @initials = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name.nil? ? '' : student.middle_name[0] + '.'}"
    @github = student.github
    @contact = format_contact(student)
  end

  # Конструктор 2: Принимает ID и строку, содержащую информацию
  def initialize_from_string(id, initials, github, contact)
    # Устанавливаем id
    @id = id
    @initials = initials
    @github = github
    @contact = contact
  end

  # Метод для форматирования контактов
  def format_contact(student)
    contact_info = []
    contact_info << "Телефон: #{student.phone}" if student.phone
    contact_info << "Telegram: #{student.telegram}" if student.telegram
    contact_info << "Email: #{student.email}" if student.email
    contact_info.join(' ; ')
  end

  # Метод для вывода информации об объекте
  def to_s
    "ID: #{@id}, ФИО: #{@initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end
end
