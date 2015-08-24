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
  puts 'SILENCE!!! I have an announcement'
  myProc.call
  puts 'As you were!'

end

saySomething = Proc.new do
  puts 'Valar Molghulis'
end

sayOtherThing = Proc.new do
  puts 'Valar Dhoharis'
end

thisIsAMethod saySomething
thisIsAMethod sayOtherThing

# You can write mehods which will determine how many times, or even if to call the proc.

def maybeDo newProc
  if rand(2) == 0
    newProc.call
  end

end

def doTwice newProc
  newProc.call
  newProc.call

end

stark = Proc.new do
  puts 'Winter is coming!'
end

greyjoy = Proc.new do
  puts 'We do not sow!'
end

maybeDo stark
maybeDo greyjoy
doTwice stark
doTwice greyjoy

# We can also call a proc on an object.
# Adding in loops, in this case, a while loop.

def untilFalse firstInput, someProc
  input = firstInput
  output = firstInput

  while output
    input = output
    output = someProc.call input

  end

end
