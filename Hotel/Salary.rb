current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"


class Salary
  def get_salary
  end
end

class Oklad_sal < Salary
  def initialize(sal)
    @fixed = sal
  end
  attr_accessor :fixed
  def get_salary
    @fixed
  end
end

class Decorator < Salary
  def initialize(sal,add)
    @sal = sal
    @add = add
    @fixed = sal.fixed
  end
  attr_accessor :fixed
  def get_salary
    @sal.get_salary
  end
end
#надбавка в руб
class Rub_nadb_decorator < Decorator
  def get_salary
    @sal.get_salary + @add
  end
end
#надбавка в % от оклада
class Percent_nadb_decorator < Decorator
  def get_salary
    @sal.get_salary + @fixed * @add / 100
  end
end
#штраф в руб
class Fine_decorator < Decorator
  def get_salary
    @sal.get_salary - @add
  end
end
#премия в % от общей суммы
class Premium_decorator < Decorator
  def get_salary
    @sal.get_salary + @sal.get_salary * @add / 100
  end
end
