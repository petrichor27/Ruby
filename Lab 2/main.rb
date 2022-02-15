class Department
  def initialize (name, phone, *duties)
    @duties = duties
    @name = name
    if Department.checkPhone?(phone)
      @phone = phone
    else raise ArgumentError.new("Это не номер телефона!")
    end
  end

  attr_accessor :name
  attr_accessor :phone

  def setDuty(val)
    @duties.append(val)
  end

  def chooseDuty()
    puts "Какую обязанность выбрать?"
    gets.chop
  end

  def deleteDuty(index)
    @duties.delete(@duties[index])
  end

  def getDuty(index)
    @duties[index]
  end

  def updateDuty(index, new)
    @duties[index] = new
  end

  def printDuties
    @duties.each { |d| puts "#{@duties.index(d)}. #{d}" }
  end

  def Department.checkPhone?(phone)
    /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
  end

  def dutyToStr()
    str = ""
    @duties.each { |d| str += "\"" + d.to_s + "\", " }
    str[0...str.length-2]
  end
=begin
  def getName
    @name
  end

  def getPhone
    @phone
  end

  def setName(val)
    @name = val
  end

  def setPhone(val)
    @phone = val
  end

  def name=(val)
    @name = val
  end

  def phone=(val)
    @phone = val
  end
=end
end


def out(*arr)
    arr.each do |el|
      puts "Name: #{el.name}  Phone: #{el.phone}\nDuties:"
      el.printDuties
      puts ""
    end
end

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
      (0..d.length-1).each { |x| dep.setDuty(d[x]) }
      deps.append(dep)
    end
  end
  deps
end

def printDeps(deps)
  deps.each { |x| out(x) }
end

def write_to_txt(file, deps)
  File.open(file,"w") do |f|
    deps.each do |x|
      f.puts "\"#{x.name}\", #{x.phone}, (#{x.dutyToStr})"
    end
  end
end

=begin
dep_j = Department.new("Department of justice", "8(123)1248525","Control of the activities of the notary")
dep_e = Department.new("Department of energy", "8(123)4523432","implementation of state policy in the field of the fuel and energy complex")
dep_d = Department.new("Department of defense", "8(123)1111111","command of the armed forces","controls the financial, economic and economic activities of the Armed Forces")

puts "\n*** Список объектов ***"
out(dep_j,dep_e,dep_d)
puts "\n*** Добавление ***"
dep_j.setDuty("Control of court activities")
out(dep_j)
puts "\nОбязанность №1: " + dep_j.getDuty(1)
puts "\n*** Обновление ***"
dep_j.updateDuty(1,"Improving the legal literacy of the population")
out(dep_j)
puts "\n*** Удаление ***"
dep_j.deleteDuty(1)
out(dep_j)
=end

# dep_s = Department.new("Department of state", "8(123)1223")
deps = read_from_txt("Department1.txt")
puts "Из файла:"
printDeps(deps)
deps.append(Department.new("Department of state", "8(123)1223777"))
puts "С новым объектом:"
printDeps(deps)
write_to_txt("Department1.txt",deps)