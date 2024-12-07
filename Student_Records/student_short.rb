class StudentShort
  attr_reader :id, :last_name_and_initials, :github, :contact

  # Основной конструктор
  def initialize(id:, last_name_and_initials:, github:, contact:)
    @id = id
    @last_name_and_initials = last_name_and_initials
    @github = github
    @contact = contact
  end

  # Конструктор для создания из объекта Student
  def self.from_student(student)
    raise ArgumentError, "Аргумент должен быть объектом класса Student" unless student.is_a?(Student)

    # Извлечение данных из объекта Student
    id = student.id
    last_name_and_initials = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name ? student.middle_name[0] + '.' : ''}"
    github = student.github
    contact = student.get_contact # Используем метод get_contact из Student

    # Создание объекта StudentShort
    new(id: id, last_name_and_initials: last_name_and_initials, github: github, contact: contact)
  end

  # Конструктор для создания из ID и строки
  def self.from_string(id, info_string)
    # Разделяем строку по ";"
    parts = info_string.split(";").map(&:strip)
    raise ArgumentError, "Неверный формат строки" unless parts.size == 3

    last_name_and_initials, github, contact = parts

    # Проверка валидности GitHub URL
    raise ArgumentError, "Некорректный GitHub URL" unless Student.valid_github?(github)

    # Создаем объект StudentShort
    new(id: id, last_name_and_initials: last_name_and_initials, github: github, contact: contact)
  end

  # Метод для вывода информации об объекте
  def to_s
    "ID: #{@id}; ФИО: #{@last_name_and_initials}; GitHub: #{@github}; Контакт: #{@contact}"
  end
end
