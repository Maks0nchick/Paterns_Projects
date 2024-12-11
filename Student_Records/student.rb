class Student < Person
  def validate_github
    @github && @github.strip.length.positive?
  end

  def validate_contact
    [@phone, @telegram, @email].any? { |contact| contact && contact.strip.length.positive? }
  end

  def validate
    validate_github && validate_contact
  end

  def get_short_name
    "#{@last_name} #{@first_name[0]}.#{@middle_name ? @middle_name[0] + '.' : ''}"
  end

  def getInfo
    "#{get_short_name}; GitHub: #{@github || 'не указан'}; Связь: #{get_contact}"
  end
end
