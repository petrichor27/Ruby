current_path = File.dirname(__FILE__)
require "#{current_path}/controller.rb"

class Main_View
  def initialize
    @index = 0
  end
  attr_reader :index

  def out str
    puts str
  end

  def choose_row num
    @index = num
  end
end