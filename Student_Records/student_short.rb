class StudentShort
  attr_reader :id, :surname_initials, :git, :contact
  private_class_method :new

  # Основной конструктор
  def initialize(id:, surname_initials:, git:, contact:)
    @id = id
    @surname_initials = surname_initials
    @git = git
    @contact = contact
    validate_presence_of_git_and_contact # Проверка, что git и контакт не пустые
  end

  # Создание объекта из другого объекта (например, Student)
  def self.from_student(student)
    new(id: student.id, surname_initials: student.initials, git: student.git, contact: student.contact)
  end

  # Создание объекта из строки
  def self.from_string(id, info_string)
    info = info_string.split(", ")
    surname_initials = info[0]
    git = info[1]
    contact = info[2]
    new(id: id, surname_initials: surname_initials, git: git, contact: contact)
  end

  # Метод для получения краткой информации о студенте
  def get_info
    "#{surname_initials}; Git: #{git}; Контакт: #{contact}"
  end

  # Метод для форматированного вывода всей информации
  def to_s
    "ID: #{id}, Фамилия И.О.: #{surname_initials}, Git: #{git}, Контактная информация: #{contact}"
  end

  private

  # Метод для проверки обязательных полей (git и contact)
  def validate_presence_of_git_and_contact
    raise ArgumentError, 'Git и контактная информация обязательны' if git.nil? || git.empty? || contact.nil? || contact.empty?
  end
end
