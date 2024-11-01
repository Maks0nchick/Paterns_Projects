class StudentShort
  attr_reader :id, :last_name_initials, :github, :contact

  # Конструктор, принимающий объект класса Student
  def initialize(student)
    @id = student.id
    @last_name_initials = student.last_name_initials
    @github = student.github_contact
    @contact = student.main_contact
  end

  # Конструктор, принимающий ID и строку информации
  def self.from_data(id, data_string)
    last_name_initials, github, contact_type, contact_value = data_string.split("; ")
    contact = { type: contact_type.split(":").first, value: contact_type.split(":").last }
    new(id: id, last_name_initials: last_name_initials, github: github, contact: contact)
  end

  private

  def initialize(id:, last_name_initials:, github:, contact:)
    @id = id
    @last_name_initials = last_name_initials
    @github = github
    @contact = contact
  end
end
