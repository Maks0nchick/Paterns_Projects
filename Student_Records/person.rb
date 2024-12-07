class Person
  attr_reader :id, :github

  def initialize(id:, github: nil)
    @id = id
    @github = github
  end

  def to_s
    "ID: #{id}, GitHub: #{github || 'не указан'}"
  end
end