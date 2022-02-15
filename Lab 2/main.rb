class Department
  def initialize (name, phone, *duties)
    @duties = duties
    @name = name
    if /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
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
    end
end


dep_j = Department.new("Department of justice", "8(123)1248525","Control of the activities of the notary")
dep_e = Department.new("Department of energy", "8(123)4523432","implementation of state policy in the field of the fuel and energy complex")
dep_d = Department.new("Department of defense", "8(123)1111111","command of the armed forces","controls the financial, economic and economic activities of the Armed Forces")
puts "*** Список объектов ***"
out(dep_j,dep_e,dep_d)
puts "*** Добавление ***"
dep_j.setDuty("Control of court activities")
out(dep_j)
puts "Обязанность №1: " + dep_j.getDuty(1)
puts "*** Обновление ***"
dep_j.updateDuty(1,"Improving the legal literacy of the population")
out(dep_j)
puts "*** Удаление ***"
dep_j.deleteDuty(1)
out(dep_j)