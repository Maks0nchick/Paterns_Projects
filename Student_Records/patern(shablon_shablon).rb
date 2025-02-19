# Абстрактный базовый класс с шаблонным методом
class Beverage
  def prepare
    boil_water
    brew
    pour_in_cup
    add_condiments if want_condiments?
  end

  def boil_water
    puts "Кипятим воду"
  end

  def pour_in_cup
    puts "Наливаем в чашку"
  end

  # Методы, которые должны быть определены в подклассах
  def brew
    raise NotImplementedError, "Этот метод должен быть переопределён"
  end

  def add_condiments
    raise NotImplementedError, "Этот метод должен быть переопределён"
  end

  # Перехватываемый метод: можно переопределять в подклассе
  def want_condiments?
    true
  end
end

# Класс для Чая
class Tea < Beverage
  def brew
    puts "Завариваем чайный пакетик"
  end

  def add_condiments
    puts "Добавляем лимон"
  end
end

# Класс для Кофе
class Coffee < Beverage
  def brew
    puts "Завариваем молотый кофе"
  end

  def add_condiments
    puts "Добавляем молоко и сахар"
  end
end

# Использование
puts "Готовим чай:"
tea = Tea.new
tea.prepare

puts "\nГотовим кофе:"
coffee = Coffee.new
coffee.prepare
