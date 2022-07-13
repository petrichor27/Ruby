current_path = File.dirname(__FILE__)
require "#{current_path}/Department.rb"
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post_list.rb"
require "#{current_path}/Decorators.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Employee.rb"
require 'yaml'
require 'yaml/store'
#1/2
=begin
dep_1 = Department.new("IT","8(123)1223777")
dep_2 = Department.new("HR","8(123)1225437")
dep_3 = Department.new("Рекламный","8(123)1443277")

puts dep_1,dep_2,dep_3
=end

#1/4
=begin
dep_1 = Department.new("IT","8(123)1223777",["ensuring proper operation and trouble-free operation","maintenance of computers, organizational, computing equipment, server equipment"])
dep_2 = Department.new("HR","8(123)1225437")
dep_2.set_duty("ensuring proper operation and trouble-free operation")
dep_2.update_duty("ensuring proper operation")
dep_1.choose_duty(1)
dep_1.delete_duty

puts dep_1,dep_2
=end

#1/5
=begin
dep_1 = Department.new("IT","8(123)1223777")
puts dep_1
dep_2 = Department.new("HR","8(123)12")
=end

#2/8

dep_1 = Department.new("IT","8(123)1223777",['111','222'])
dep_2 = Department.new("HR","8(123)1225437")
dep_3 = Department.new("Рекламный","8(123)1443277",['444','333'])
=begin
deps = [dep_1,dep_2]
write_to_yaml(deps,'file.yaml')
puts "Из файла:"
deps = read_from_yaml('file.yaml')
print_mas_deps(deps)
deps.append(dep_3)
write_to_yaml(deps,'file.yaml')
puts "С новым объектом:"
deps = read_from_yaml('file.yaml')
print_mas_deps(deps)
=end

#3/3
=begin
deps = Department_list.new(dep_1,dep_2,dep_3)
deps.write_to_yaml 'file.yaml'
puts Department_list.from_yaml 'file.yaml'
=end

#5/5
=begin
post_1 = Post.new("IT","Программист",55000,0)
post_2 = Post.new("IT","Уборщица",15000,1)
post_3 = Post.new("IT","Инженер",50000,0)
post_4 = Post.new("HR","Уборщица",15000,0)
post_5 = Post.new("HR","Менеджер",60000,1)
post_6 = Post.new("Рекламный","Уборщица",15000,0)
post_7 = Post.new("Рекламный","Менеджер",60000,0)

post_list1 = Post_list.new(post_1,post_2,post_3)
post_list2 = Post_list.new(post_4,post_5)
post_list3 = Post_list.new(post_6,post_7)

dep_1 = Department.new("IT","8(123)1223777",post_list1,["ensuring proper operation and trouble-free operation","maintenance of computers, organizational, computing equipment, server equipment"])
dep_2 = Department.new("HR","8(123)1225437",post_list2,["1111","22222"])
dep_3 = Department.new("Рекламный","8(123)1443277",post_list3,["1234","2656422"])

deps = Department_list.new(dep_1,dep_2,dep_3)
=end

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

#puts deps.to_s_big

#----lab 3----

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
puts post_11
post_12.set_salary(rub_nadb: 1000)
puts post_12
post_13.set_salary(rub_nadb: 1000,premium: 20)
puts post_13
# post_14.set_salary(percent_nadb: 10,premium: 10)
