class Person
  attr_reader :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  def self.check_phone_number(phone_number)
    phone_number.start_with?("+")
  end

  def initialize(attributes)
    unless attributes[:phone].nil? || self.class.check_phone_number(attributes[:phone])
      raise ArgumentError, "Телефонный номер должен начинаться с '+'"
    end
    @attributes = attributes
    @id = @attributes[:id]
    @last_name = @attributes[:last_name]
    @first_name = @attributes[:first_name]
    @middle_name = @attributes[:middle_name]
    @phone = @attributes[:phone]
    @telegram = @attributes[:telegram]
    @email = @attributes[:email]
    @github = @attributes[:github]
  end

  def to_s
    "Человек #{@id}: #{@last_name} #{@first_name} #{@middle_name}, телефон: #{@phone || 'не указан'}, телеграм: #{@telegram || 'не указан'}, email: #{@email || 'не указан'}, github: #{@github || 'не указан'}"
  end
end