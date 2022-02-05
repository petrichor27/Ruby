#1.1
#puts("Hello World!")

#1.2


#puts "Привет, " + ARGV[0]


#1.3
=begin
ARGV.clear
puts("Какой язык твой любимый?")
lang=gets.chop
=end


#var 1
=begin
if lang=="ruby"
  then puts("Ты подлиза!")
else
  if lang=="c#" or lang=="c++"
  then puts("Как скучно!")
  else if lang=="python"
         then puts("Слишком легко!")
       else puts("Скоро будет ruby")
       end
  end
end
=end

#var 2
=begin
answer = if lang=="ruby"
           "Ты подлиза!"
       else
         if lang=="c#" or lang=="c++"
          "Как скучно!"
         else if lang=="python"
           "Слишком легко!"
              else "Скоро будет ruby"
              end
         end
       end
puts answer
=end

#var 3
=begin
case lang
when "ruby" then puts("Ты подлиза!")
when "c#", "c++" then puts("Как скучно!")
when "python" then puts("Слишком легко!")
else puts("Скоро будет ruby")
end
=end


#1.4
=begin
puts "Введите команду ОС:"
com1=gets.chop
puts(`#{com1}`)

puts "Введите команду Ruby:"
com2 = gets.chop
puts eval(com2)
=end


#2.1

=begin
a= ARGV[0].to_i

b=0
until a==0
  b+=a%10
  a/=10
end
puts b
=end


#2.2
def sum a
  b=0
  until a==0
    b+=a%10
    a/=10
  end
  b
end

def max a
  m=a%10
  a/=10
  until a==0
    m = if a%10>m then a%10 else m end
    a/=10
  end
  m
end

def min a
  m=a%10
  a/=10
  until a==0
    m = if a%10<m then a%10 else m end
    a/=10
  end
  m
end

def mult a
  p=1
  until a==0
    p *= a%10
    a/=10
  end
  p
end

#2.3
# 1
def nod a, b
  while a != 0 and b != 0
    if a > b
      a = a % b
    else b = b % a
    end
  end
  a + b
end

def countprost a
  b=a-1
  count=0
  until b==0
    if nod(a, b) == 1
      count+=1
    end
    b-=1
  end
  count
end

# 2
def sum3 a
  sum=0
  until a==0
    sum += if (a%10)%3==0 then a%10 else 0 end
    a/=10
  end
  sum
end

# 3
def delmaxprost a
  b=a/2
  del, kol = 1,0
  until b==1
    if a%b==0
      c=a
      tempkol=0
      until c==0
        if nod(c%10,b) == 1 then tempkol+=1 end
        c/=10
      end
      if tempkol>kol
        kol = tempkol
        del = b
      end
    end
    b-=1
  end
  del
end

=begin
a= ARGV[0].to_i
puts "Выберите метод:\n1. Сумма цифр числа\n2. Максимальная цифра числа\n3. Минимальная цифра числа"
puts "4. Произведение цифр числа\n5. Количество чисел, взаимно простых с заданным"
puts "6. Сумма цифр числа, делящихся на 3\n7. Делитель числа, являющийся взаимно простым с
наибольшим количеством цифр данного числа"

number = ARGV[1].to_i
case number
when 1 then puts sum a
when 2 then puts max a
when 3 then puts min a
when 4 then puts mult a
when 5 then puts countprost a
when 6 then puts sum3 a
when 7 then puts delmaxprost a
else
  puts "Hello world"
end
=end



#3.1
def min_el(list)
  min = list[0]
  list.each { |a|
    if a < min
      min = a
    end
  }
  min
end

def max_el(list)
  max = list[0]
  list.each { |a|
    if a > max
      max = a
    end
  }
  max
end

def sum_el(list)
  sum = 0
  list.each { |a| sum+=a }
  sum
end

def mult_el(list)
  mul = 1
  list.each { |a| mul*=a }
  mul
end

#3.2
=begin
puts "Выберите метод:\n1. Минимальный элемент\n2. Максимальный элемент\n3. Сумма\n4. Произведение"
met_num=gets.chop.to_i
puts "Откуда считать список?\n1. Из файла\n2. С клавиатуры"
from_where=gets.chop.to_i
arr=Array.new
if from_where==1
  puts "Введите адрес файла"
  file=gets.chop
  File.open(file,"r") do |f|
    while (line = f.gets)
      arr.append(line.to_i)
    end
  end
else if from_where==2
       el = gets
       until el == "\n"
         arr.append(el.to_i)
         el = gets
       end
     end
end

case met_num
when 1 then puts min_el arr
when 2 then puts max_el arr
when 3 then puts sum_el arr
when 4 then puts mult_el arr
else
  puts "Ошибка"
end
=end




#4
# 2
def index_min(arr)
  min = arr[0]
  arr.each do |a|
    if a < min
      min = a
    end
  end
  arr.index(min)
end
# 14
def count_inter(arr, a, b)
  count = 0
  arr.each do |x|
    if (a+1...b).include?(x)
      count += 1
    end
  end
  count
end
# 26
def count_between(arr)
  fmin = index_min arr
  lmin = fmin
  min = arr[fmin]
  arr.each_index do |i|
    if arr[i] == min
      lmin = i
    end
  end
  lmin - fmin - 1
end
# 38
def count_otrez(arr, a, b)
  count = 0
  arr.each do |x|
    if (a..b).include?(x)
      count += 1
    end
  end
  count
end
# 50
def l1andl2(l1, l2)
  l3 = Array.new
  (l1 | l2).each do |a|
    unless l3.include?(a)
      l3.append(a)
    end
  end
  l3
end
