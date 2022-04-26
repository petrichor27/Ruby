current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Decorators.rb"
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


# post_1 = Post.new("IT","Программист",55000,0)
# post_2 = Post.new("IT","Уборщица",15000,1)
# post_3 = Post.new("IT","Инженер",50000,0)
# post_4 = Post.new("HR","Уборщица",15000,0)
# post_5 = Post.new("HR","Менеджер",60000,1)
# post_6 = Post.new("Рекламный","Уборщица",15000,0)
# post_7 = Post.new("Рекламный","Менеджер",60000,0)
#
# post_list1 = Post_list.new(post_1,post_2,post_3)
# post_list2 = Post_list.new(post_4,post_5)
# post_list3 = Post_list.new(post_6,post_7)
#
# dep_1 = Department.new("IT","8(123)1223777",post_list1,["ensuring proper operation and trouble-free operation","maintenance of computers, organizational, computing equipment, server equipment"])
# dep_2 = Department.new("HR","8(123)1225437",post_list2,["1111","22222"])
# dep_3 = Department.new("Рекламный","8(123)1443277",post_list3,["1234","2656422"])
#
# deps = Department_list.new(dep_1,dep_2,dep_3)

#5.5
# dep_1.set_post(post_1)
# dep_1.set_post(post_2)
# dep_1.set_post(post_2)
# dep_1.set_post(post_3)
# dep_1.choose_post(1)
# dep_1.update_post(post_1)
# dep_1.delete_post
# puts dep_1
# puts "\n\nВакантные должности:\n",dep_1.vak_posts
# puts "\n\nВсе должности:\n",dep_1.post_list

#5.6
# yaml_to_file "Post.yaml",deps.to_yaml
# puts Department_list.deserialize_yaml("Post.yaml")

# yaml_to_file "Post.yaml",dep_1.to_yaml
# puts Department.deserialize_yaml("Post.yaml")

# yaml_to_file "Post.yaml",post_list1.to_yaml
# puts Post_list.deserialize_yaml("Post.yaml")

# yaml_to_file "Post.yaml",post_1.to_yaml
# puts Post.from_yaml("Post.yaml")

#6.1
# puts deps.sort_by_vak_count!

#6.2
# puts dep_1.list_post
# puts deps
# puts deps.to_s_big



#----lab 3----
=begin
s = Oklad_sal.new(1000)
s1 = Rub_nadb_decorator.new(s,500)
p s1.get_salary
s2 = Fine_decorator.new(s1,750)
p s2.get_salary
s3 = Percent_nadb_decorator.new(s2,10)
p s3.get_salary
s4 = Premium_decorator.new(s3,10)
p s4.get_salary
=end

post_11 = Post.new("IT","Руководитель",75000,1)
post_12 = Post.new("IT","Программист",55000,1)
post_13 = Post.new("IT","Web-программист",45000,1)
post_14 = Post.new("IT","Инженер",50000,0)

post_21 = Post.new("Финансовый отдел","Руководитель",75000,0)
post_22 = Post.new("Финансовый отдел","Бухгалтер",55000,0)
post_23 = Post.new("Финансовый отдел","Главный бугалтер",65000,0)
post_24 = Post.new("Финансовый отдел","Экономист",55000,0)

post_31 = Post.new("HR","Руководитель",75000,0)
post_32 = Post.new("HR","Рекрутер",30000,1)

post_41 = Post.new("Маркетинговый","Руководитель",75000,0)
post_42 = Post.new("Маркетинговый","Маркетолог",60000,0)

post_list1 = Post_list.new(post_11,post_12,post_13,post_14)
post_list2 = Post_list.new(post_21,post_22,post_23,post_24)
post_list3 = Post_list.new(post_31,post_32)
post_list4 = Post_list.new(post_41,post_42)

dep_1 = Department.new("IT","8(123)1223777",post_list1,["Поддержка согласованного набора ИТ-услуг","Управление ИТ-проектами","Развитие ИТ-среды компании"])
dep_2 = Department.new("Финансовый отдел","8(123)12999437",post_list2,["учёт, анализ, планирование и организация бизнес-процессов"," управление денежными потоками", "определение порядка взаиморасчётов и очередности платежей", "контроль платежей и остатков на счетах компании","получение кредитов на выгодных условиях, выпуск ценных бумаг, внедрение факторинга"])
dep_3 = Department.new("HR","8(123)8523277",post_list3,["Управление эффективностью и уровнем производительности","Поиск и развитие талантов"])
dep_4 = Department.new("Маркетинговый","8(123)12312312",post_list4,["анализирует эффективность рекламных кампаний в интернете","мониторит и анализирует работу конкурентов","собирает обратную связь от целевой аудитории со всех каналов коммуникации"])

deps = Department_list.new(dep_1,dep_2,dep_3,dep_4)

post_11.set_salary(rub_nadb: 1000,fine: 200)
post_12.set_salary(rub_nadb: 1000)
post_13.set_salary(rub_nadb: 1000,premium: 20)
#post_14.set_salary(percent_nadb: 10,premium: 10)
puts post_list1
# post_list1.to_yaml
yaml_to_file "Post.yaml",post_list1.to_yaml
puts Post_list.deserialize_yaml("Post.yaml")
