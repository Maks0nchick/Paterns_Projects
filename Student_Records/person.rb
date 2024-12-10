# Суперкласс Person
class Person
  attr_accessor :id, :github
  attr_reader :contact

  def initialize(id: nil, github: nil, contact: nil)
    @id = id
    self.github = github
    self.contact = contact
  end

  # Валидация GitHub URL
  def self.valid_github?(github)
    github.nil? || github.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[A-Za-z0-9_-]+\/?\z/)
  end

  def github=(value)
    raise ArgumentError, "Некорректный GitHub URL: #{value}" unless Person.valid_github?(value)
    @github = value
  end

  # Установка контактов
  def contact=(contact)
    @contact = contact
  end

  # Метод для получения информации о контактах
  def get_contact
    @contact || "Контакты отсутствуют"
  end

  # Метод для вывода информации об объекте
  def to_s
    "ID: #{@id || 'не указан'}; GitHub: #{@github || 'не указан'}; Контакты: #{get_contact}"
  end
end
