#1
#puts("Hello World!")
#2
puts("Enter your name:")
name=gets.chop
puts("Привет, #{name}!")
#3
puts("Какой язык твой любимый?")
lang=gets.chop

#var 1
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
