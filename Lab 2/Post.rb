#4.1
class Post
  def initialize(otdel,name,oklad,vak)
    @otdel = otdel
    @name = name
    @oklad = oklad
    @vakantnost = vak
  end

  attr_accessor :otdel
  attr_accessor :name
  attr_accessor :oklad
  attr_reader :vakantnost

  def vakantnost=(vak)
    if Post.check_vak?(vak)
      @vakantnost = vak
    else raise ArgumentError.new("Vakantnost должна быть 0 или 1!")
    end
  end

  def Post.check_vak?(vak)
    vak == (0 || 1)
  end

  def word_vak
    if @vakantnost == 1
      "Занята"
    else "Свободна"
    end
  end

  def to_s
    "\nОтдел: #{otdel};\nНазвание: #{name};\nОклад: #{oklad};\nДолжность: #{word_vak}"
  end

end
