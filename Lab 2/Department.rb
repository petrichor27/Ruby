current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department_list.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Post_list.rb"
#1.1
class Department
  def initialize (name, phone, posts = Post_list.new, duties)
    @name = name
    @duties = duties
    @index_duty = 0
    self.phone=phone
    @post_list = posts
  end

  attr_accessor :name
  attr_reader :phone
  attr_accessor :post_list

  def phone=(phone)
    if Department.check_phone?(phone)
      @phone = phone
    else raise ArgumentError.new("Это не номер телефона!")
    end
  end

  #1.2
  def to_s
    "Name: #{name}\nPhone: #{phone}; \nDuties:\n#{duties}\nPosts:#{post_list}\n"
  end

  #1.3
  def set_duty(val)
    @duties.append(val)
  end

  def choose_duty(index)
    @index_duty = index
  end

  def delete_duty
    @duties.delete(@duties[@index_duty])
    @index_duty -=1
  end

  def get_duty
    @duties[@index_duty]
  end

  def update_duty(new)
    @duties[@index_duty] = new
  end

  def duties
    s = ""
    @duties.each_index { |i| s += "#{i}) #{@duties[i]}\n" }
    s
  end

  def set_post(val)
    @post_list.add_note(val)
  end

  def choose_post(index)
    @post_list.choose_note(index)
  end

  def delete_post
    @post_list.delete_note
  end

  def get_post
    @post_list.get_note
  end

  def update_post(new)
    @post_list.change_note(new)
  end

  def vak_posts
    @post_list.find_vak_posts
  end

  #1.5
  def Department.check_phone?(phone)
    /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ =~ phone
  end

  def duties_for_txt
    "\"" + @duties.join("\", \"") + "\""
  end

  def self.find_duties(duties)
    reg_duty = /"[\w| |,|.|']+"/
    d = []
    a = reg_duty.match(duties).to_s
    until a == "" do
      d.append(a[1...a.length - 1])
      duties.sub!(a, "")
      a = reg_duty.match(duties).to_s
    end
    d
  end

  def Department.from_yaml(file)
    store = YAML::Store.new file
    deps = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        deps+= line
      end
    end
    store.load(deps)
  end

  def Department.deserialize_yaml(file)
    Department.from_yaml(file)
  end

  def to_yaml
    d = Department.new(@name,@phone,@duties)
    a = YAML.dump(d)
    a[-15..-2]=""
    t=@post_list.to_yaml[38..@post_list.to_yaml.length-1]
    l=""
    t.each_line { |line| l+="  "+line }
    a + l
  end

  def count_vak
    @post_list.find_vak_posts.length
  end
end

def ask_which_duty(dep)
  puts "Какую обязанность выбрать?"
  puts dep.duties
  d = gets.chomp
  dep.choose_duty(d.to_i)
end

#2.2
def read_from_txt(file)
  reg_name = /^"[\w| |,|.]+/
  reg_phone = /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  reg_duties = /\(["[\w| |,|.|']+"]*\)$/
  deps = []
  File.open(file,"r") do |f|
    while (line = f.gets)
      name = reg_name.match(line).to_s
      name[0]=''
      phone = reg_phone.match(line).to_s
      duties = reg_duties.match(line).to_s
      d = Department.find_duties(duties)
      dep = Department.new(name, phone,[])
      (0..d.length-1).each { |x| dep.set_duty(d[x]) }
      deps.append(dep)
    end
  end
  deps
end

=begin
#2.3
def print_deps(deps)
  deps.each { |x| puts(x) }
end
=end

#2.4
def write_to_txt(file, deps)
  File.open(file,"w") do |f|
    deps.each do |x|
      f.puts "\"#{x.name}\", #{x.phone}, (#{x.duties_for_txt})"
    end
  end
end

=begin
#2.6
def write_to_yaml(file, deps)
  File.open(file,"w") do |f|
    f.puts YAML.dump(deps)
  end
end

#2.7
def read_from_yaml(file)
  store = YAML::Store.new file
  deps = ""
  File.open(file,"r") do |f|
    while (line = f.gets)
      deps+= line
    end
  end
  store.load(deps)
end
=end

