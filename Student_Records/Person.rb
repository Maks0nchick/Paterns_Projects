class Person
  attr_reader :id, :last_name_initials, :github, :contact

  def initialize(id:, last_name_initials:, github:, contact:)
    @id = id
    @last_name_initials = last_name_initials
    @github = github
    @contact = contact
  end

  def get_info
    "#{last_name_initials}; GitHub: #{github}; Контакт: #{contact[:type]} (#{contact[:value]})"
  end
end

class Student < Person
  def initialize(id:, last_name:, first_name:, middle_name:, github:, contact:)
    last_name_initials = "#{last_name} #{first_name[0]}.#{middle_name[0]}."
    super(id: id, last_name_initials: last_name_initials, github: github, contact: contact)
  end
end

class StudentShort < Person
  def self.from_data(id, data_string)
    last_name_initials, github, contact_type, contact_value = data_string.split("; ")
    contact = { type: contact_type.split(":").first, value: contact_type.split(":").last }
    new(id: id, last_name_initials: last_name_initials, github: github, contact: contact)
  end
end
