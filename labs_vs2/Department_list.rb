current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"

#3/1
class Department_list
  def initialize(*arr)
    @dep_arr = Array.new

    #3/2
    arr.each { |i| add_note(i) }
    @index = 0
  end

  #3/2
  def add_note(dep)
    @dep_arr.append(dep)
  end

  def choose_note(index)
    @index = index
  end

  def change_note(new_dep)
    @dep_arr[@index] = new_dep
  end

  def get_note
    @dep_arr[@index]
  end

  def delete_note
    @dep_arr.delete_at(@index)
    if @index > 0
      @index-=1
    end
  end

  #3/3
  def to_s
    s = "\n"
    @dep_arr.each_index { |i| s += "#{i})  "+@dep_arr[i].to_s }
    s
  end

  def each
    @dep_arr.each  do |dep|
      yield dep
    end
  end

  def write_to_yaml(file)
    File.open(file,"w") { |f| f.puts YAML.dump(self) }
  end

  def Department_list.read_from_yaml(file)
    store = YAML::Store.new file
    arr_lines = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        arr_lines+= line
      end
    end
    store.load(arr_lines)
  end

  #3/4
  def Department_list.from_yaml(file)
    Department_list.read_from_yaml(file)
  end

  #3/5
  def sort_notes_by_name!
    @dep_arr.sort! {|a, b| a.name <=> b.name}
  end

  #6/1
  def sort_by_vak_count!
    @dep_arr.sort! { |a, b| b.count_vak <=> a.count_vak }
  end

  #6/2
  def to_s_big
    s = "\n"
    @dep_arr.each_index { |i| s += "#{i}}  "+@dep_arr[i].to_s_big }
    s
  end
end