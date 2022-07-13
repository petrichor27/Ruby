current_path = File.dirname(__FILE__)
require "#{current_path}/table.rb"
require "#{current_path}/view.rb"

class Main_Controller
  def initialize
    @view = Main_View.new
    @model = Model_table.new
  end

  def out
    @view.out(@model.to_s)
  end

  def add_row a
    @model.add(a)
  end

  def delete_row
    @model.index = @view.index
    @model.delete
  end

  def change_row a
    @model.index = @view.index
    @model.update a
  end
end