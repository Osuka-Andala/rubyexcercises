sentence = Proc.new do
  puts 'This is a sentence!'
end

sentence.call

# Blocks can also take parameters

iWantToGo = Proc.new do |anAwesomeplace|
  puts 'I would really love to go to '+anAwesomeplace+'!'
end

iWantToGo.call 'Salar de Uyuni'
iWantToGo.call 'Ayen Tepui'
iWantToGo.call "The Great Barrier Rief"


# You cant pass methods into other methods but you can pass procs into methods
# Methods cant return other methods but they can return procs
# This is because procs are objects, procs are not.

def thisIsAMethod myProc
  puts 'SILENCE!!! I have an announcemenyt'
  myProc.call
  puts 'As you were!'

end

saySomething = Proc.new do
  puts 'Winter is coming'
end

sayOtherThing = Proc.new do
  puts 'Valar Dhoharis'
end

thisIsAMethod saySomething
thisIsAMethod sayOtherThing
