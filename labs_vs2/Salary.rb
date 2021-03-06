current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Post.rb"

#lab 3, all 1 exercise
class Salary
  def get_salary
  end
end

class Fix_sal < Salary
  def initialize(sal)
    @fixed = sal
  end

  def get_salary
    @fixed
  end
end

class Rub_sal < Fix_sal
  def initialize(sal,nadbavka)
    super(sal)
    @add_rub = nadbavka
  end

  def get_salary
    super + @add_rub
  end
end

class Percent_sal < Fix_sal
  def initialize(sal,nadbavka)
    super(sal)
    @add_percent = nadbavka
  end

  def get_salary
    prng = Random.new
    a = prng.rand(0..1)
    if a == 1
      super * @add_percent / 100
    else super
    end
  end

end

class Rub_percent_sal < Percent_sal
  def initialize(sal,nadb_rub,nadb_perc)
    super(sal,nadb_perc)
    @add_rub = nadb_rub
  end

  def get_salary
    super + @add_rub
  end

end

class Fine_sal < Salary
  def initialize(fine)
    @fine = fine
  end

  def get_salary
    @fine
  end
end

class Fine_rub_sal < Rub_sal
  def initialize(sal,nadbavka,fine)
    super(sal,nadbavka)
    @add_fine = fine
  end

  def get_salary
    super - @add_fine
  end
end

class Fine_percent_sal < Percent_sal
  def initialize(sal,fine,nadb_perc)
    super(sal,nadb_perc)
    @add_fine = fine
  end

  def get_salary
    super - @add_fine
  end

end

class Fine_rub_percent_sal < Rub_percent_sal
  def initialize(sal, nadb_rub, nadb_perc,fine)
    super(sal,nadb_rub,nadb_perc)
    @add_fine = fine
  end

  def get_salary
    super - @add_fine
  end
end

class Premium_sal < Fix_sal
  def initialize(sal,prem)
    super(sal)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_rub_sal < Rub_sal
  def initialize(sal, nadbavka,prem)
    super(sal,nadbavka)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_percent_sal < Percent_sal
  def initialize(sal, nadb_perc, prem)
    super(sal,nadb_perc)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_rub_percent_sal < Rub_percent_sal
  def initialize(sal, nadb_rub, nadb_perc, prem)
    super(sal, nadb_rub, nadb_perc)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_fine_sal < Fine_sal
  def initialize(fine, prem)
    super(fine)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_fine_rub_sal < Fine_rub_sal
  def initialize(sal, nadb, fine, prem)
    super(sal, nadb, fine)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_fine_percent_sal < Fine_percent_sal
  def initialize(sal, nadb_perc, fine, prem)
    super(sal, fine, nadb_perc)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end

class Premium_fine_rub_percent_sal < Fine_rub_percent_sal
  def initialize(sal, nadb_rub, nadb_perc, fine, prem)
    super(sal, nadb_rub, nadb_perc, fine)
    @prem = prem
  end

  def get_salary
    super * @prem / 100
  end
end
