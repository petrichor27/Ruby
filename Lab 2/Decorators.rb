current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Post.rb"

class Salary2
  def get_salary
  end
end

class Oklad_sal < Salary2
  def initialize(sal)
    @fixed = sal
  end
  attr_accessor :fixed
  def get_salary
    @fixed
  end
end

class Decorator < Salary2
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

class Rub_nadb_decorator < Decorator
  def get_salary
    @sal.get_salary + @add
  end
end

class Percent_nadb_decorator < Decorator
  def get_salary
    @sal.get_salary + @fixed * @add / 100
  end
end

class Fine_decorator < Decorator
  def get_salary
    @sal.get_salary - @add
  end
end

class Premium_decorator < Decorator
  def get_salary
    @sal.get_salary + @sal.get_salary * @add / 100
  end
end