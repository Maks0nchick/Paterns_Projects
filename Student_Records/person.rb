class Person
  attr_accessor :firstname, :lastname, :surname, :git, :id

  def initialize(firstname, lastname, surname, id = nil, git = nil)
    @firstname = firstname
    @lastname = lastname
    @surname = surname
    @id = id
    @git = git
  end

  def to_s
    "ФИО: #{@lastname} #{@firstname} #{@surname}\n" +
    "ID: #{@id}\n" +
    "Git: #{@git}"
  end
end
