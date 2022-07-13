#2/1, 2/2, 2/4, 2/5 - вроде как не нужны уже. Если он скажет показать, я сделаю
#для работы с yaml я создавала вручную файл file.yaml

require 'yaml'
require 'yaml/store'
#1/1
class Department
  #1/1: def initialize (name, phone)
  # 1/3: duties - массив
  # 5/1: +post_list
  def initialize (name, phone,post_list = Post_list.new,duties=[])
    self.name = name
    self.phone= phone

    #1/3:
    @duties = [] #список обязанностей
    @index_duty = 0 #номер выделенной обязанности, после удаления должен становиться на 1 меньше
    duties.each { |i| self.set_duty(i)}

    #5/1:
    @post_list = post_list
  end

  #5/2:
  attr_accessor :post_list

  def set_post(val)
    @post_list.add_note(val)
  end

  def choose_post(index)
    @post_list.choose_note(index)
  end

  def delete_post
    @post_list.delete_note
  end

  def get_post
    @post_list.get_note
  end

  def update_post(new)
    @post_list.change_note(new)
  end

  #5/3:
  def vak_posts
    @post_list.find_vak_posts
  end

  #5/4:
  def list_post
    s = ""
    @post_list.each { |p| s += @post_list.index(p).to_s + ". " + p.name + "; должность: " + p.word_vak + "\n" }
    s
  end

  #6/1
  def count_vak
    @post_list.find_vak_posts.length
  end

  #6/2
  def to_s_big
    "Name: #{name}\nPhone: #{phone}; \nDuties:\n#{duties}Posts:\n#{post_list}\n"
  end

  #1/1:
  attr_accessor :name
  #attr_accessor :phone

  #1/5:
  attr_reader :phone
  def phone=(phone)
    if Department.check_phone?(phone)
      @phone = phone
    else raise ArgumentError.new("Некорректный номер телефона!")
    end
  end

  #1/2:
  def to_s
    #"Name: #{name}, Phone: #{phone};\n"
    #1/4:
    "Name: #{name}, Phone: #{phone}\nDuties:\n#{duties}\n"
  end

  #1/3
  def set_duty(val) #добавить обязанность
    @duties.append(val)
  end

  def choose_duty(index) #выделить
    @index_duty = index
  end

  def delete_duty #удалить
    @duties.delete(@duties[@index_duty])
    if @index_duty > 0
      @index_duty -= 1
    end
  end

  def get_duty #получить текст выделенной
    @duties[@index_duty]
  end

  def update_duty(new) #заменить текст выделенной
    @duties[@index_duty] = new
  end

  def duties #вывести список
    s = ""
    @duties.each_index { |i| s += "#{i}} #{@duties[i]}\n" }
    s
  end

  #1/5
  def Department.check_phone?(phone)
    /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
  end

  #2/6
  def write_to_yaml
    YAML.dump(self)
  end


end

#2/3:
def print_mas_deps(deps)
  deps.each { |x| puts(x) }
end

#2/6
def write_to_yaml(deps,file)
  yaml = ''
  deps.each { |x| yaml += x.write_to_yaml }

  File.open(file,"w") { |f| f.puts yaml }
end

#2/7
def read_from_yaml(file)
  store = YAML::Store.new file
  deps = ""
  File.open(file,"r") do |f|
    while (line = f.gets)
      deps+= line
    end
  end

  deps_mas = []
  yaml_to_mas_deps(deps).each { |d| deps_mas.append(store.load(d)) }
  deps_mas
end

def yaml_to_mas_deps(str)
  dep=[]
  i=-1
  str.split(/\r?\n|\r/).each do |line|
    if line[0..2] == '---'
      i+=1
      dep[i]=''
    end
    dep[i] += line+"\n"
  end
  dep
end