class Student_short < Person
  attr_reader :id

  # Конструктор с ID и строкой
  def initialize(id, info_str = nil)
    @id = id
    if info_str
      # Разбираем строку с информацией и создаем объект Person
      data = info_str.split(';')
      last_name, first_name, middle_name, github, contact = data
      first_name = first_name.strip.split(' ').first
      middle_name = middle_name.strip.split(' ').first

      # Вызов конструктора суперкласса Person
      super(last_name.strip, first_name, middle_name, *parse_contact(contact.strip), github.strip)
    end
  end

  # Метод для получения краткой информации о Student_short
  def getInfo
    "#{id}; #{surname_with_initials}; #{github_info}; #{contact_info}"
  end

  private

  # Метод для парсинга контактной информации (телефон, telegram, почта)
  def parse_contact(contact_str)
    case contact_str
    when /Телефон: (.+)/
      return [$1, nil, nil]
    when /Телеграм: (.+)/
      return [nil, $1, nil]
    when /Почта: (.+)/
      return [nil, nil, $1]
    else
      return [nil, nil, nil]
    end
  end
end
