class Person
  attr_reader :id, :surname_initials, :github, :contact

  def initialize(id:, surname_initials:, github:, contact:)
    @id = id
    @surname_initials = surname_initials
    @github = github
    @contact = contact
  end

  # Метод для вывода информации о человеке
  def to_s
    "ID: #{@id}, Фамилия и инициалы: #{@surname_initials}, GitHub: #{@github}, Контакт: #{@contact}"
  end

  # Проверка наличия контакта (общая для всех)
  def validate_contact
    !@contact.nil? && !@contact.empty?
  end
end
