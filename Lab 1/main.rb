#1.1
#puts("Hello World!")

#1.2
=begin
puts("Enter your name:")
name=gets.chop
puts("Привет, #{name}!")
=end

#1.3
=begin
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
puts "Введите команду ОС"
com1=gets.chop
puts(`#{com1}`)

puts "Введите команду Ruby:"
com2 = gets.chop
puts eval(com2)
=end


#2.1

puts "Введите число:"
a=gets.chop.to_i
=begin
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

def proizv a
  p=1
  until a==0
    p *= a%10
    a/=10
  end
  p
end

#puts proizv(a), sum(a), max(a), min(a)

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

#2
def sum3 a
  sum=0
  until a==0
    sum += if (a%10)%3==0 then a%10 else 0 end
    a/=10
  end
  sum
end



puts "Выберите метод:\n1. Сумма цифр числа\n2. Максимальная цифра числа\n3. Минимальная цифра числа"
puts "4. Произведение цифр числа\n5. Количество чисел, взаимно простых с заданным"
puts "6. Сумма цифр числа, делящихся на 3\n7. Делитель числа, являющийся взаимно простым с
наибольшим количеством цифр данного числа"
number = gets.chop.to_i
case number
when 1 then puts sum a
when 2 then puts max a
when 3 then puts min a
when 4 then puts proizv a
when 5 then puts countprost a
when 6 then puts sum3 a

else
  puts "Hello world"
end

