require_relative "minesweeper"

mine1 = Minesweeper.new(10,10,10)

mine1.printField

while mine1.still_playing?
    mine1.play(rand(10),rand(10))
    mine1.printField
end