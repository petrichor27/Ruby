current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Salary.rb"

#4.1
class Post
  def initialize(name,oklad,vak,*jobs)
    @name = name
    @oklad = oklad
    @salary = Oklad_sal.new(@oklad)
    @vakantnost = vak
    @jobs_list
  end

  attr_accessor :name
  attr_accessor :oklad
  attr_reader :vakantnost

  def add_empl_to_post(jobs)
    #lab3 n4/4
  end

  def set_salary(rub_nadb: 0,percent_nadb: 0,fine: 0,premium: 0) #salary=
    if @vakantnost == 1
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
    "\nОтдел: #{otdel};\nНазвание: #{name};\nОклад: #{oklad};\nДолжность: #{word_vak};\nИтоговая зарплата: #{salary}"
  end

  def to_yaml
    YAML.dump(self)
  end

  #2.7
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

def yaml_to_file(file,yaml)
  File.open(file,"w") do |f|
    f.puts yaml
  end
end
