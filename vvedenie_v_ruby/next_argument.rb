# Приветствие и выбор языка программирования
username = ARGV[0]
puts "Привет, #{username}!"
print "Какой язык программирования тебе нравится? "
language = $stdin.gets.chomp.downcase

if language == "ruby"
  puts "О, #{username}, ты подлиза!"
else
  case language
  when "python"
    puts "Python — это отличный выбор, но скоро ты полюбишь Ruby!"
  when "javascript"
    puts "JavaScript — круто, особенно для фронтенда, но Ruby ждёт тебя!"
  when "java"
    puts "Java — надёжный, но Ruby может быть намного проще и элегантнее!"
  when "c++"
    puts "C++ — мощный инструмент, но Ruby куда более дружелюбен!"
  else
    puts "Интересный выбор! Но поверь, скоро ты полюбишь Ruby!"
  end
end

# Просим пользователя ввести команду для Ruby
print "Введите команду для выполнения на языке Ruby: "
ruby_command = $stdin.gets.chomp

# Выполнение команды на Ruby с помощью eval
begin
  result = eval(ruby_command)
  puts "Результат выполнения команды Ruby: #{result}"
rescue Exception => e
  puts "Ошибка при выполнении команды Ruby: #{e.message}"
end

# Просим пользователя ввести команду операционной системы
print "Введите команду операционной системы: "
os_command = $stdin.gets.chomp

# Выполнение команды операционной системы с помощью system
puts "Результат выполнения команды ОС:"
system(os_command)
