require 'yaml'
require 'yaml/store'

#1.1
class Department
  def initialize (name, phone, *duties)
    @duties = duties
    @name = name
    @index = 0
    self.phone=phone
  end

  attr_accessor :name
  attr_reader :phone

  def phone=(phone)
    if Department.check_phone?(phone)
      @phone = phone
    else raise ArgumentError.new("Это не номер телефона!")
    end
  end

  #1.2
  def to_s
    "Name: #{name} ; Phone: #{phone}; \nDuties:\n#{duties}\n"
  end

  #1.3
  def set_duty(val)
    @duties.append(val)
  end

  def choose_duty(index)
    @index = index
  end

  def delete_duty
    @duties.delete(@duties[@index])
    @index +=1
  end

  def get_duty
    @duties[@index]
  end

  def update_duty(new)
    @duties[@index] = new
  end

  def duties
    s = ""
    @duties.each_index { |i| s += "#{i}) #{@duties[i]}\n" }
    s
  end

  def ask_which_duty
    puts "Какую обязанность выбрать?"
    puts duties
    d = gets.chomp
    choose_duty(d.to_i)
  end

  #1.5
  def Department.check_phone?(phone)
    /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
  end

  def duties_for_txt
    "\"" + @duties.join("\", \"") + "\""
  end
end

#2.2
def find_duties(duties)
  reg_duty = /"[\w| |,|.]+"/
  d = []
  a = reg_duty.match(duties).to_s
  until a == "" do
    d.append(a[1...a.length - 1])
    duties.sub!(a, "")
    a = reg_duty.match(duties).to_s
  end
  d
  end

def read_from_txt(file)
  reg_name = /^"[\w| |,|.]+/
  reg_phone = /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  reg_duties = /\(["[\w| |,|.]+"]*\)$/
  deps = []
  File.open(file,"r") do |f|
    while (line = f.gets)
      name = reg_name.match(line).to_s
      name[0]=''
      phone = reg_phone.match(line).to_s
      duties = reg_duties.match(line).to_s
      d = find_duties(duties)
      dep = Department.new(name, phone)
      (0..d.length-1).each { |x| dep.set_duty(d[x]) }
      deps.append(dep)
    end
  end
  deps
end

#2.3
def print_deps(deps)
  deps.each { |x| puts(x) }
end

#2.4
def write_to_txt(file, deps)
  File.open(file,"w") do |f|
    deps.each do |x|
      f.puts "\"#{x.name}\", #{x.phone}, (#{x.duties_for_txt})"
    end
  end
end

#2.6
def write_to_yaml(file, deps)
  File.open(file,"w") do |f|
    f.puts YAML.dump(deps)
  end
end

#2.7
def read_from_yaml(file)
  store = YAML::Store.new file
  deps = ""
  File.open(file,"r") do |f|
    while (line = f.gets)
      deps+= line
    end
  end
  store.load(deps)
end


#1.2
dep_j = Department.new("Department of justice", "8(123)1248525","Control of the activities of the notary")
dep_e = Department.new("Department of energy", "8(123)4523432","implementation of state policy in the field of the fuel and energy complex")
dep_d = Department.new("Department of defense", "8(123)1111111","command of the armed forces","controls the financial, economic and economic activities of the Armed Forces")
dep_s = Department.new("Department of state", "8(123)3445652","Serves as the President's principal adviser on U.S. foreign policy", "Conducts negotiations relating to U.S. foreign affairs")

# puts "\n*** Список объектов ***"
# puts dep_j,dep_e,dep_d,dep_s

#1.4
=begin
puts "\n*** Добавление ***"
dep_j.set_duty("Control of court activities")
puts dep_j

puts "\nОбязанность №1: "
dep_j.choose_duty(1)
puts dep_j.get_duty

puts "\n*** Обновление ***"
dep_j.choose_duty(1)
dep_j.update_duty("Improving the legal literacy of the population")
puts dep_j

puts "\n*** Удаление ***"
dep_d.ask_which_duty
dep_d.delete_duty
puts dep_d
=end

#1.5
#dep_j.phone= "sdgsdgdsg"

#2.5
=begin
deps = read_from_txt("Department.txt")
puts "Из файла:"
printDeps(deps)
deps.append(Department.new("Department of something", "8(123)1223777","smth"))
puts "С новым объектом:"
printDeps(deps)
write_to_txt("Department.txt",deps)
=end

#2.8
=begin
deps = read_from_yaml "yaml_text.yaml"
puts "Из файла:", deps
deps.append(dep_s)
puts "С новым объектом:", deps
write_to_yaml("yaml_text.yaml", deps)
=end

#3.1
class Department_list
  def initialize(*list)
    @dep_list = Array.new
    #2
    list.each { |i| add_note(i) }
    @index = 0
  end
  #2
  def add_note(dep)
    @dep_list.append(dep)
  end
  def choose_note(index)
    @index = index
  end
  def change_note(new_dep)
    @dep_list[@index] = new_dep
  end
  def get_note
    @dep_list[@index]
  end
  def delete_note
    @dep_list.delete_at(@index)
  end
  def to_s
    s = "\n"
    @dep_list.each_index { |i| s += "#{i})))  "+@dep_list[i].to_s }
    s
  end
end



=begin
a = Department_list.new(dep_j,dep_s)
a.add_note(dep_d)
a.add_note(dep_e)
puts "Все:", a
a.choose_note(2)
a.change_note(dep_j)
puts "Измененная:", a.get_note
a.choose_note(0)
a.delete_note
puts "После удаления:", a
=end
