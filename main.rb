module MineSweeper

    require_relative "minesweeper"
    require_relative "PrettyPrinter"
    require_relative "SimplePrinter"


    puts "Coloque a altura, largura e o número de bombas do novo jogo"
    puts "ex: 10 10 10"
    h, w, n = gets.split.map(&:to_i)

    puts "Para jogar coloque o comando e as coordenas x y"
    puts "ex: click 0 2"
    puts "    flag 0 2"

    mine1 = Minesweeper.new(10,10,10)
    printer = PrettyPrinter.new 
    
    while mine1.still_playing?
        printer.print(mine1.board_state)
        cmmd, x, y, *rest = gets.split(" ")
        x = Integer(x)
        y = Integer(y)
        if(cmmd == 'click')
            mine1.play(x,y)
        elsif(cmmd == 'flag')
            mine1.flag(x,y)
        else
            puts "Comando Inválido"
        end
    end


    puts "Fim do jogo!"
    if mine1.victory?
        puts "Você venceu!"
    else
        puts "Você perdeu! As minas eram:"
        printer.print(mine1.board_state(xray: true))
    end
end