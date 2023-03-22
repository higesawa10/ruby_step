# sleepメソッドを持つAnimalクラスを定義
class Animal
  def initialize(type)
    @type = type
  end
  
  def sleep
    p "#{@type} is sleeping"
  end
end

class Dog < Animal
  def shake_tail
    p "#{@type} is shaking the tali."
  end
end

dog = Dog.new('Dog')
dog.sleep
dog.shake_tail