require 'yaml'
require 'yaml/store'

class Model_one_row
  def initialize(description:,count:,start_date:,end_date:,premium:)
    if check_str? description
      @description = description
    end
    if check_int? count
      @count = count
    end
    if check_date? start_date
      @start_date = start_date
    end
    if check_date? end_date
      @end_date = end_date
    end
    if check_money? premium
      @premium = premium
    end
  end
  attr_accessor :description,:count,:start_date,:end_date,:premium

  def check_date?(date)
    date =~ /((([0-2][1-9]|30|31)( |.)(01|03|05|07|08|10|12)|([0-2][1-9]|30)( |.)(04|06|09|11)|([0-2][1-9])( |.)02)( |.)((19|20)([0-9]{2})))/
  end

  def check_money?(money)
    true
  end

  def check_int?(num)
    true
  end

  def check_str?(str)
    true
  end

  def to_s
    "Описание: "+@description+"\n"+"Количество человек: "+@count.to_s+"\n"+@start_date+" - "+@end_date+"\n"+"Вознаграждение: "+@premium.to_s
  end

  def update new_row
    if check_str? new_row[0]
      @description = new_row[0]
    end
    if check_int? new_row[1]
      @count = new_row[1]
    end
    if check_date? new_row[2]
      @start_date = new_row[2]
    end
    if check_date? new_row[3]
      @end_date = new_row[3]
    end
    if check_money? new_row[4]
      @premium = new_row[4]
    end
  end

  def to_yaml
    YAML.dump(self)
  end

  def from_yaml
    store = YAML::Store.new file
    row = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        row+= line
      end
    end
    store.load(row)
  end

end



class Model_table
  def initialize(*list)
    @list = []
    list.each { |a| add(a) }
    @index = 0
  end
  attr_reader :list

  def add a
    if a.class == Model_one_row
      @list.append(a)
    end
  end

  def choose_row num
    @index = num
  end

  def delete
    @list.delete_at(@index)
    if @index > 0 then @index-=1 end
  end

  def update new_row
    @list[@index].update(new_row)
  end

  def to_yaml
    YAML.dump(self)
  end

  def from_yaml
    store = YAML::Store.new file
    row = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        row+= line
      end
    end
    store.load(row)
  end

  def each
    @list.each  do |post|
      yield post
    end
  end

  def to_s
    s = ""
    @list.each_index { |i| s += i.to_s + ") " + @list[i].to_s + "\n\n"}
    s
  end
end