#1.1
#puts("Hello World!")

#1.2
#puts("Enter your name:")
#name=gets.chop
#puts("Привет, #{name}!")

#1.3
#puts("Какой язык твой любимый?")
#lang=gets.chop

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
puts "Введите команду ОС"
com1=gets.chop
puts(`#{com1}`)

puts "Введите команду Ruby:"
com2 = gets.chop
puts eval(com2)