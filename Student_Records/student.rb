class Student

  # Метод для фамилии и инициалов
  def surname_with_initials
    "#{@last_name} #{first_name[0]}.#{middle_name[0]}."
  end

  # Метод для получения одного из контактов
  def contact_info
    if @phone
      "Телефон: #{@phone}"
    elsif @telegram
      "Телеграм: #{@telegram}"
    elsif @mail
      "Почта: #{@mail}"
    else
      "Контакт не указан"
    end
  end

  # Метод для получения GitHub
  def github_info
    @github || "GitHub не указан"
  end

  # Метод для краткой информации о студенте
  def getInfo
    "#{surname_with_initials}; #{github_info}; #{contact_info}"
  end
end
