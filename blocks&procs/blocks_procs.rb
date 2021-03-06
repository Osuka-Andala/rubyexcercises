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

def compose proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x)) #put proc1 into parenthesis inorder for it to be done first
  end
end

  squareIt = Proc.new do |x|
    x * x
  end

  doubleIt = Proc.new do |x|
    x + x
  end

  doubleThenSquare = compose doubleIt, squareIt
  squareThenDouble = compose squareIt, doubleIt

  puts doubleThenSquare.call(7)
  puts squareThenDouble.call(7)
  puts doubleThenSquare.call(17)
  puts squareThenDouble.call(76)

# Passing blocks into Methods

class Array
  def eachEven(&wasABlock_nowAProc)
    #Start with 'true' value because arrays start with 0 which is even

    isEven = true

    self.each do |object|
      if isEven
        wasABlock_nowAProc.call object
      end

      isEven = (not isEven) #Loop from odd to even and viceversa
    end
  end
end

['peach', 'blueberry', 'apple', 'walnut', 'mango', 'apricot'].eachEven do |fruit|
  puts 'Yoooh! I just adore '+fruit+' pizza, don\'t you?'
end

[1, 2, 3, 4, 5, 6].eachEven do |oddBall|
  puts oddBall.to_s + ' is NOT an even number'

end

# So to pass in a block to eachEven, all we had to do was stick the block after the method.
# You can pass a block into any method this way, though many methods will just ignore the block.
# In order to make your method not ignore the block, but grab it and turn it into a proc,
# put the name of the proc at the end of your method's parameter list, preceded by an ampersand (&)


# I remember one time I wanted to be able to time how long different sections of a program were taking.
# (This is also known as profiling the code.)
# So I wrote a method which takes the time before running the code,
# then it runs it, then it takes the time again at the end and figures out the difference.

def profile blockDescription, &block
  startTime = Time.now

  block.call
  
  duration = Time.now - startTime

  puts blockDescription + ': '+duration.to_s+' seconds'

end

profile '25000 doublings' do
  number = 1

  25000.times do
    number = number + number
  end

  puts number.to_s.length .to_s+' digits'
end

profile 'count to a million' do
  number = 0

  1000000.times do
    number = number + 1
  end
end
