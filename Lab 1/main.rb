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

puts proizv(a), sum(a), max(a), min(a)