current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department.rb"
require "#{current_path}/Post.rb"
require "#{current_path}/Department_list.rb"

class Post_list
  def initialize(*list)
    @post_list = Array.new
    list.each { |i| add_note(i) }
    @index = 0
  end

  def find_vak_posts
    vak_posts = Array.new
    @post_list.each { |p| if p.vakantnost == 0 then vak_posts.append(p) end }
    vak_posts
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

  def Post_list.remove_ast!(line)
    reg_ast = /\*[a-zA-Zа-яА-Я0-9]*\*/
    arg = reg_ast.match(line).to_s
    line.sub!(arg.to_s,'*')
    arg[0]=''
    arg[-1]=''
    arg
  end

  def Post_list.from_txt(file)
    post_list = Post_list.new
    File.open(file,"r") do |f|
      while (line = f.gets)
        otdel = Post_list.remove_ast!(line)
        name = Post_list.remove_ast!(line)
        oklad = Post_list.remove_ast!(line)
        vak = Post_list.remove_ast!(line)

        post = Post.new(otdel,name,oklad.to_i,vak.to_i)
        post_list.add_note(post)
      end
    end
    post_list
  end

  def each
    @post_list.each  do |post|
      yield post
    end
  end

  def Post_list.to_txt(file, post_list)
    File.open(file,"w") do |f|
      post_list.each do |x|
        f.puts "*#{x.otdel}*#{x.name}*#{x.oklad}*#{x.vakantnost}*"
      end
    end
  end

=begin
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
=end

  def Post_list.deserialize_yaml(file)
    arr = Post.from_yaml(file)
    p = Post_list.new
    arr.each { |i| p.add_note(i) }
    p
  end

  def to_yaml
    s="--- !ruby/object:Post_list\npost_list:\n"
    @post_list.each do |p|
      a = p.to_yaml[2..p.to_yaml.length-1]
      l = ""
      a.each_line { |line| l += "  " + line }
      l[0..1] = ""
      s += l
      end
    s + "index: 0"
  end

  def Post_list.deserialize_txt(file)
    @index = 0
    @post_list = Post_list.from_txt(file)
  end

  def sort_notes_by_name!
    @post_list.sort! {|a, b| a.name <=> b.name}
  end
end


