# frozen_string_literal: true

# class Animal
class Animal
  attr_reader :name, :age

  def name=(value)
    raise "Name can't be blank!" if value.empty? || value.nil?

    @name = value
  end

  def age=(value)
    raise "An age of #{value} isn't valid!" if value.zero? || value.negative?

    @age = value
  end

  def talk
    puts "#{@name} says Bark!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end

  def report_age
    puts "#{@name} is #{@age} years old."
  end
end

# children class Dog
class Dog < Animal
  # overriding method to_s from Object class
  def to_s
    "#{@name} the dog, #{@age} yers old."
  end
end

# children class Cat
class Cat < Animal
  # overriding parent method
  def talk
    puts "#{@name} says Nyan!"
  end
end

# children class Bird
class Bird < Animal
  # overriding parent method
  def talk
    puts "#{@name} says Chirik-chirik!"
  end
end

# children class Armadillo
class Armadillo < Animal
  # overriding parent method
  def move(destination)
    puts "#{@name} unrolls!"
    super
    # equals: super(destination)
  end
end

cat = Cat.new
cat.name = 'Whiskers'

bird = Bird.new
bird.name = 'Polly'

cat.talk
bird.talk

armadillo = Armadillo.new
armadillo.name = 'Dillon'
armadillo.move('burrow')

lucy = Dog.new
lucy.name = 'Lucy'
lucy.age = 4

rex = Dog.new
rex.name = 'Rex'
rex.age = 2

puts lucy, rex

puts
puts '*' * 25
