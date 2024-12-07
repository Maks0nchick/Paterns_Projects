class StudentShort < Person
  def initialize_from_student(student)
    raise ArgumentError, "Ожидается объект класса Student" unless student.is_a?(Student)

    super(
      id: student.id,
      surname_initials: student.surname_initials,
      github: student.github,
      contact: student.contact
    )
  end

  def initialize(id, info_str)
    raise ArgumentError, "ID должен быть числом" unless id.is_a?(Integer)
    raise ArgumentError, "Строка информации не может быть пустой" if info_str.strip.empty?

    parts = parse_info(info_str)

    super(
      id: id,
      surname_initials: parts[:surname_initials],
      github: parts[:github],
      contact: parts[:contact]
    )
  end

  private

  # Парсинг строки
  def parse_info(info_str)
    parts = info_str.split(';').map(&:strip)
    raise ArgumentError, "Некорректный формат строки" if parts.size != 3

    {
      surname_initials: parts[0],
      github: parts[1],
      contact: parts[2]
    }
  end
end
