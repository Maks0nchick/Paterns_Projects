username = ARGV[0]
puts "Привет, #{username}!"

print "Какой язык программирования тебе нравится? "
language = $stdin.gets.chomp.downcase  # Приводим ответ к нижнему регистру для проверки

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
