class StudentShort < Person
  attr_reader :last_name_and_initials, :contact

  def initialize(id:, last_name_and_initials:, contact:, github: nil)
    super(id: id, github: github)
    @last_name_and_initials = last_name_and_initials
    @contact = contact
  end

  def self.from_student(student)
    contact = student.phone || student.telegram || student.email || 'не указан'
    new(id: student.id, last_name_and_initials: student.last_name_and_initials, contact: contact, github: student.github)
  end

  def to_s
    super + ", ФИО: #{last_name_and_initials}, Контакт: #{contact}"
  end
end