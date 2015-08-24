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
