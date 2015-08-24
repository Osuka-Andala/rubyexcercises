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

 input

end

arrayOfSquares = Proc.new do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop #Take out the last number

    array.push lastNumber*lastNumber #...and replace it with its square

    array.push lastNumber-1  #...followed by the next smaller number
  end

end

alwysFalse = Proc.new do  |justIgnoreMe|
  false
end

puts untilFalse([5], arrayOfSquares).inspect #inspect works almost the same as to_s
puts untilFalse([81], arrayOfSquares).inspect
puts untilFalse('I am just following examples!', alwysFalse)

# You cancreate a proc in a method and then return it.
# The example below takes two procs and returns the new proc which
# when called, calls the first proc and passes the result into the second proc.
