class Student_Short < Person
  def initialize(id:, name:, git:, contact:)
    initials = name.split[1].split('.').map(&:capitalize)
    surname, firstname, lastname = name.split[0], initials[0], initials[1]

    if id.nil?
      raise ArgumentError.new("Отсутствует id студента: #{surname} #{firstname}.#{lastname}")
    end

    super(surname: surname, firstname: firstname, lastname: lastname, id: id, git: git, contact: contact)
  end

  def self.create_from_string(id:, data:)
    name_and_contact = data.split
    name = name_and_contact[0..1].join(' ')
    contact = name_and_contact[-1]
    self.new(id: id, name: name, git: name_and_contact[2], contact: contact)
  end

  def to_s
    "#{@id} #{self.get_name} #{@git} #{@contact}"
  end
end
