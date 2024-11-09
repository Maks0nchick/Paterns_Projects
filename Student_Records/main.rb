# Создание из строки
student_short = StudentShort.from_string(1, "Иванов И.И., https://github.com/ivanov, +71234567890")
puts student_short.get_info
# Иванов И.И.; Git: https://github.com/ivanov; Контакт: +71234567890
puts student_short.to_s
# ID: 1, Фамилия И.О.: Иванов И.И., Git: https://github.com/ivanov, Контактная информация: +71234567890
