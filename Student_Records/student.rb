class Student
  attr_reader :id, :last_name, :first_name, :middle_name, :github, :contact

  def initialize(id:, last_name:, first_name:, middle_name:, github:, contact:)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @github = github
    @contact = contact
  end

  def get_info
    "#{last_name} #{initials}; GitHub: #{github}; Контакт: #{contact[:type]} (#{contact[:value]})"
  end

  def last_name_initials
    "#{last_name} #{initials}"
  end

  def github_contact
    github
  end

  def main_contact
    "#{contact[:type]}: #{contact[:value]}"
  end

  private

  def initials
    "#{first_name[0]}.#{middle_name[0]}."
  end
end
