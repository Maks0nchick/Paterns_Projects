# Класс StudentShort, работающий с краткой информацией
class StudentShort < Person
  attr_reader :initials, :contact

  def self.create_from_student(student)
    new(
      id: student.id,
      initials: student.get_short_name,
      github: student.github,
      contact: student.get_contact
    )
  end

  def initialize(id:, initials:, github:, contact:)
    @id = id
    @initials = initials
    @github = github
    @contact = contact
  end

  def to_s
    "ID: #{@id}, ФИО: #{@initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end
end 