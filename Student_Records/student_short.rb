# Класс StudentShort, наследующий от BaseStudent
class StudentShort < BaseStudent
  attr_reader :initials, :contact

  def initialize(id:, github: nil, initials:, contact:)
    super(id: id, github: github)
    @initials = initials
    @contact = contact
  end

  def self.create_from_student(student)
    raise ArgumentError, "Некорректный объект Student" unless student.is_a?(Student)

    new(
      id: student.id,
      github: student.github,
      initials: student.get_short_name,
      contact: student.send(:contact_info)
    )
  end

  def to_s
    "ID: #{@id}, ФИО: #{@initials}, GitHub: #{@github || 'не указан'}, Контакты: #{@contact}"
  end
end