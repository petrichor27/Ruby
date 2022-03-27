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
    @index -=1
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

  #1.5
  def Department.check_phone?(phone)
    /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
  end

  def duties_for_txt
    "\"" + @duties.join("\", \"") + "\""
  end

  def self.find_duties(duties)
    reg_duty = /"[\w| |,|.|']+"/
    d = []
    a = reg_duty.match(duties).to_s
    until a == "" do
      d.append(a[1...a.length - 1])
      duties.sub!(a, "")
      a = reg_duty.match(duties).to_s
    end
    d
  end
end

def ask_which_duty(dep)
  puts "Какую обязанность выбрать?"
  puts dep.duties
  d = gets.chomp
  dep.choose_duty(d.to_i)
end

#2.2


def read_from_txt(file)
  reg_name = /^"[\w| |,|.]+/
  reg_phone = /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  reg_duties = /\(["[\w| |,|.|']+"]*\)$/
  deps = []
  File.open(file,"r") do |f|
    while (line = f.gets)
      name = reg_name.match(line).to_s
      name[0]=''
      phone = reg_phone.match(line).to_s
      duties = reg_duties.match(line).to_s
      d = Department.find_duties(duties)
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

