require_relative 'person.rb'

class Student_Short < Person
  attr_reader :surname_initials, :git, :contact

  # Конструктор, который принимает строку имени и другие параметры
  def initialize(id:, name:, git:, contact:)
    # Разделяем имя на фамилию, имя и отчество
    surname, initials = name.split(" ", 2)
    firstname, lastname = initials.split('.', 2).map(&:capitalize)

    # Проверка наличия id
    raise ArgumentError, "Отсутствует id студента: #{surname} #{firstname}.#{lastname}." if id.nil?

    # Передаем в конструктор суперкласса
    super(surname: surname, firstname: firstname, lastname: lastname, id: id, git: git, contact: contact)
  end

  private_class_method :new

  # Метод для создания экземпляра из строки
  def self.create_from_string(id:, data:)
    # Используем метод parse_string_params для разбиения строки
    params = self.parse_string_params(data)
    
    # Обрабатываем параметры
    name = params[0..1].join(' ')  # Фамилия и инициалы
    git = params[2]                # Git
    contact = params[3..].join(' ')  # Контактная информация

    # Создаем новый объект
    self.new(id: id, name: name, git: git, contact: contact)
  end

  # Создание объекта на основе существующего студента
  def self.create_from_student(student_obj)
    name = student_obj.get_name
    git = student_obj.git
    contact = student_obj.contact

    self.new(id: student_obj.id, name: name, git: git, contact: contact)
  end

  # Метод для парсинга строки данных
  def self.parse_string_params(str_params)
    # Разделяем строку на части по пробелам
    str_params.split
  end

  # Метод для вывода информации о студенте
  def to_s
    "#{@id} #{self.get_name} #{@git} #{@contact}"
  end
end
