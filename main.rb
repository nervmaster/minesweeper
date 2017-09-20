require_relative "minesweeper"

mine1 = Minesweeper.new(10,10,10)

mine1.printField

while mine1.still_playing?
    mine1.play(rand(10),rand(10))
    mine1.flag(rand(10),rand(10))
    mine1.printField
end


puts "Fim do jogo!"
if mine1.victory?
    puts "Você venceu!"
else
    puts "Você perdeu! As minas eram:"
    mine1.printField(xray: true)
end