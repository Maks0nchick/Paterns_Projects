class StudentShort
  # Создаем геттеры для полей (без сеттеров, чтобы поля нельзя было редактировать)
  attr_reader :id, :surname_initials, :github, :contact

  # Конструктор №1: принимает объект класса Student
  def initialize_from_student(student)
    raise ArgumentError, "Ожидается объект класса Student" unless student.is_a?(Student)

    @id = student.id
    @surname_initials = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name ? student.middle_name[0] + '.' : ''}"
    @github = student.github
    @contact = determine_contact(student)
  end

  # Конструктор №2: принимает ID и строку
  def initialize(id, info_str)
    raise ArgumentError, "ID должен быть числом" unless id.is_a?(Integer)
    raise ArgumentError, "Строка информации не может быть пустой" if info_str.strip.empty?

    @id = id
    parse_info(info_str)
  end

  # Метод для вывода краткой информации об объекте
  def to_s
    "ID: #{@id}, Фамилия и инициалы: #{@surname_initials}, GitHub: #{@github}, Контакт: #{@contact}"
  end

  private

  # Парсер строки информации для конструктора №2
  def parse_info(info_str)
    # Предполагаем, что строка имеет формат: "ФамилияИнициалы; GitHub; Контакт"
    parts = info_str.split(';').map(&:strip)
    raise ArgumentError, "Некорректный формат строки" if parts.size != 3

    @surname_initials = parts[0]
    @github = parts[1]
    @contact = parts[2]
  end

  # Определение контакта для конструктора из Student
  def determine_contact(student)
    if student.phone && !student.phone.empty?
      "Телефон: #{student.phone}"
    elsif student.telegram && !student.telegram.empty?
      "Телеграм: #{student.telegram}"
    elsif student.email && !student.email.empty?
      "Почта: #{student.email}"
    else
      "Контакт не указан"
    end
  end
end
