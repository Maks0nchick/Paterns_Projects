# Базовый класс для студентов
class Person
  attr_reader :id, :github

  def initialize(id:, github: nil)
    self.id = id
    self.github = github unless github.nil?
  end

  # Валидаторы для id и GitHub
  def self.valid_id?(id)
    id.match?(/\A\d+\z/)
  end

  def self.valid_github?(github)
    github.match?(%r{\Ahttps://github\.com/[-a-zA-Z0-9@:%_\+.~#=]+/[-a-zA-Z0-9._~%]+\z})
  end

  # Сеттер для id
  def id=(id)
    raise ArgumentError, "Неправильный id" unless self.class.valid_id?(id)

    @id = id
  end

  # Проверка наличия GitHub
  def has_github?
    !@github.nil? && !@github.empty?
  end

  protected

  # Сеттер для GitHub
  def github=(github)
    raise ArgumentError, "Неправильный GitHub URL" unless self.class.valid_github?(github)

    @github = github
  end
end