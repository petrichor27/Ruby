current_path = File.dirname(__FILE__)
require "#{current_path}/table.rb"
require "#{current_path}/controller.rb"
m1 = Model_one_row.new(description: "aaaaaaaa",count: 10,start_date: "21.02.2022",end_date: "21.12.2022",premium: 200_000)
# puts m1
m2 = Model_one_row.new(description: "bbbbbbbbbbbb",count: 10,start_date: "11.02.2022",end_date: "11.12.2022",premium: 300_000)
# puts m2
m3 = Model_one_row.new(description: "ccccc",count: 10,start_date: "13.02.2022",end_date: "13.12.2022",premium: 400_000)
# puts m3
=begin
list = Model_table.new(m1,m2,m3)
puts list
=end

c = Main_Controller.new
p c
c.add_row m1
c.add_row m2
c.add_row m3

c.out
