class Student < Person
  attr_reader :last_name, :first_name, :middle_name, :phone, :telegram, :email

  def initialize(id:, github: nil, last_name:, first_name:, middle_name: nil, phone: nil, telegram: nil, email: nil)
    super(id: id, github: github)
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @mail = email
  end

  def validate?
    validate_contacts? && validate_github?
  end

  def validate_contacts?
    [@phone, @telegram, @mail].any? { |contact| !contact.nil? && !contact.empty? }
  end

  def validate_github?
    !@github.nil? && !@github.empty?
  end

  def get_info
    "#{last_name_and_initials}, GitHub: #{github || 'не указан'}, Контакт: #{one_of_contacts}"
  end

  def last_name_and_initials
    "#{last_name} #{first_name[0]}.#{middle_name ? middle_name[0] + '.' : ''}"
  end

  def one_of_contacts
    @phone || @telegram || @mail || 'не указан'
  end

  def to_s
    super + ", ФИО: #{last_name_and_initials}, Контакты: #{one_of_contacts}"
  end
end