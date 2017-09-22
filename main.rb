module MineSweeper

    require_relative "minesweeper"
    require_relative "PrettyPrinter"
    require_relative "SimplePrinter"


    mine1 = Minesweeper.new(10,10,10)
    printer = SimplePrinter.new 

    while mine1.still_playing?
        mine1.play(rand(10),rand(10))
        mine1.flag(rand(10),rand(10))
        printer.print(mine1.board_state)
    end


    puts "Fim do jogo!"
    if mine1.victory?
        puts "Você venceu!"
    else
        puts "Você perdeu! As minas eram:"
        printer.print(mine1.board_state(xray: true))
    end
end