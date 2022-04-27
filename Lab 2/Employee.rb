current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Decorators.rb"
require "#{current_path}/Post.rb"

class Employee
  def initialize(surname:,name:,middlename:,birthday:,passport_data:,phone:,address:,email:)
    @surname=surname
    @name=name
    @middlename=middlename
    @birthday=birthday
    @passport_data=passport_data
    @phone=phone
    @address=address
    @email=email
  end
  attr_accessor :surname
  attr_accessor :name
  attr_accessor :middlename
  attr_accessor :birthday
  attr_accessor :passport_data
  attr_accessor :phone
  attr_accessor :address
  attr_accessor :email

end


