current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Post_list.rb"

#1.2
=begin
dep_j = Department.new("Department of justice", "8(123)1248525","Control of the activities of the notary")
dep_e = Department.new("Department of energy", "8(123)4523432","implementation of state policy in the field of the fuel and energy complex")
dep_d = Department.new("Department of defense", "8(123)1111111","command of the armed forces","controls the financial, economic and economic activities of the Armed Forces")
dep_s = Department.new("Department of state", "8(123)3445652","Serves as the Presidents principal adviser on U.S. foreign policy", "Conducts negotiations relating to U.S. foreign affairs")
=end

# puts "\n*** Список объектов ***"
# puts dep_j,dep_e,dep_d,dep_s

#1.4
=begin
puts "\n*** Добавление ***"
dep_j.set_duty("Control of court activities")
puts dep_j

puts "\nОбязанность №1: "
dep_j.choose_duty(1)
puts dep_j.get_duty

puts "\n*** Обновление ***"
dep_j.choose_duty(1)
dep_j.update_duty("Improving the legal literacy of the population")
puts dep_j

puts "\n*** Удаление ***"
ask_which_duty(dep_d)
dep_d.delete_duty
puts dep_d
=end

#1.5
#dep_j.phone= "sdgsdgdsg"

#2.5
=begin
deps = read_from_txt("Department.txt")
puts "Из файла:"
print_deps(deps)

deps.append(Department.new("Department of something", "8(123)1223777","smth"))
puts "С новым объектом:"
print_deps(deps)
write_to_txt("Department.txt",deps)
=end

#2.8
=begin
deps = read_from_yaml "yaml_text.yaml"
puts "Из файла:", deps
deps.append(dep_s)
puts "С новым объектом:", deps
write_to_yaml("yaml_text.yaml", deps)
=end



#3.2
=begin
a = Department_list.new(dep_j,dep_s)
a.add_note(dep_d)
a.add_note(dep_e)
puts "Все:", a

a.choose_note(2)
a.change_note(dep_j)
puts "Измененная:", a.get_note
a.choose_note(0)
a.delete_note
puts "После удаления:", a
=end

#3.3
=begin
b = Department_list.from_yaml "yaml_text.yaml"
puts b
a = Department_list.from_txt("Department.txt")
puts a

Department_list.to_txt("Department.txt",a)
Department_list.to_yaml("yaml_text.yaml",a)
=end

#3.4
=begin
c=Department_list.deserialize_yaml "yaml_text.yaml"

puts "c", c
d=Department_list.deserialize_txt "Department.txt"
puts "d", d
=end

#3.5
=begin
c.sort_notes_by_name!
puts "sorted",c
=end


post_1 = Post.new("IT","Программист",55000,0)
post_2 = Post.new("IT","Уборщица",15000,1)
post_3 = Post.new("IT","Инженер",50000,1)
# puts post_1
post_list = Post_list.new(post_1,post_2,post_3)
#Post_list.to_yaml("Post.yaml",post_list)
#post_l = Post_list.from_yaml "Post.yaml"
#puts post_l
dep = Department.new("IT","8(123)1223777",["ensuring proper operation and trouble-free operation","maintenance of computers, organizational, computing equipment, server equipment"])
dep.set_post(post_1)
dep.set_post(post_2)
dep.set_post(post_2)
dep.set_post(post_3)
dep.choose_post(1)
dep.update_post(post_1)
dep.delete_post
puts dep




