class Department
  def initialize (name, phone)
  @name, @phone = name, phone
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

