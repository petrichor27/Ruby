class Department
  def initialize (name, phone)
  @name = name
    if /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
      @phone = phone
    else raise ArgumentError.new("Это не номер телефона!")
    end
  end

  attr_accessor :name
  attr_accessor :phone
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
    arr.each { |el| puts "Name: #{el.name}  Phone: #{el.phone}" }
end


dep_j = Department.new("Department of justice", "8(123)1248525")
dep_e = Department.new("Department of energy", "8(123)4523432")
dep_d = Department.new("Department of defense", "8(123)1111111")
out(dep_j,dep_e,dep_d)
