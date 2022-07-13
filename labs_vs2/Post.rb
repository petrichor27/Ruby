current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Decorators.rb"
#4/1
class Post
  def initialize(otdel,name,oklad,vak)
    @otdel = otdel
    @name = name
    @oklad = oklad
    @vak = vak
    #3/2/1
    @salary = Oklad_sal.new(@oklad)
  end

  attr_accessor :otdel
  attr_accessor :name
  attr_accessor :oklad
  attr_reader :vak

  #3/2/1
  def set_salary(rub_nadb: 0,percent_nadb: 0,fine: 0,premium: 0) #salary=
    if @vak == 1
      @salary = Rub_nadb_decorator.new(@salary,rub_nadb)
      @salary = Percent_nadb_decorator.new(@salary,percent_nadb)
      @salary = Fine_decorator.new(@salary,fine)
      @salary = Premium_decorator.new(@salary,premium)
    else raise ArgumentError.new("Должность свободна, некому делать надбавки!")
    end
  end

  def salary
    @salary.get_salary
  end


  #4/1
  def vak=(vak)
    if Post.check_vak?(vak)
      @vak = vak
    else raise ArgumentError.new("Vak должна быть 0 или 1!")
    end
  end

  def Post.check_vak?(vak)
    vak == (0 || 1)
  end

  def word_vak
    if @vak == 1
      "Занята"
    else "Свободна"
    end
  end

  def to_s
    "\nОтдел: #{otdel};\nНазвание: #{name};\nОклад: #{oklad};\nДолжность: #{word_vak};\nИтоговая зарплата: #{salary}"
  end

  #5/6:
  def to_yaml
    YAML.dump(self)
  end

  def Post.from_yaml(file)
    store = YAML::Store.new file
    posts = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        posts+= line
      end
    end
    store.load(posts)
  end
end