# Класс StudentShort наследует Person
class StudentShort < Person
  attr_reader :initials

  # Конструктор 1: Принимает объект класса Student
  def initialize(student)
    super(id: student.id, github: student.github, contact: student.get_contact)
    @initials = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name.nil? ? '' : student.middle_name[0] + '.'}"
  end

  # Конструктор 2: Принимает ID и строку, содержащую информацию
  def self.from_string(id, initials, github, contact)
    new_obj = self.allocate
    new_obj.send(:initialize, id: id, github: github, contact: contact)
    new_obj.instance_variable_set(:@initials, initials)
    new_obj
  end

  # Переопределяем to_s для StudentShort
  def to_s
    "ID: #{@id}; ФИО: #{@initials}; GitHub: #{@github}; Контакты: #{@contact}"
  end
end