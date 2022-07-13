current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Department_list.rb"
#4.2
class Post_list
  def initialize(*list)
    @post_list = Array.new
    list.each { |i| add_note(i) }
    @index = 0
  end

  def add_note(post)
    @post_list.append(post)
  end

  def choose_note(index)
    @index = index
  end

  def change_note(new_post)
    @post_list[@index] = new_post
  end

  def get_note
    @post_list[@index]
  end

  def delete_note
    @post_list.delete_at(@index)
    @index-=1
  end

  def to_s
    s = "\n"
    @post_list.each_index { |i| s += "#{i}]"+@post_list[i].to_s+"\n\n"}
    s
  end

  #5/3:
  def find_vak_posts
    vak_posts = Array.new
    @post_list.each { |p| if p.vak == 0 then vak_posts.append(p) end }
    vak_posts
  end

  #5/6:
  def Post_list.from_yaml(file)
    store = YAML::Store.new file
    arr_lines = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        arr_lines+= line
      end
    end
    posts = store.load(arr_lines)
    p = Post_list.new
    posts.each { |i| p.add_note(i) }
    p
  end

  def Post_list.to_yaml(file, post)
    File.open(file,"w") do |f|
      f.puts YAML.dump(post)
    end
  end

end



