current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Post.rb"
require "#{current_path}/Salary.rb"
require "#{current_path}/Employee.rb"

class Job
  def initialize(post:,employee:,start_date:,dismissal_date:,stavka:)
    @empl = employee
    @post = post
    @stavka = stavka
    @start_date = start_date
    @dismissal_date = dismissal_date

  end
end
