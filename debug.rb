module MineSweeper
    require_relative "PrettyPrinter"
    require_relative "minesweeper"
    require_relative "States_Constants"

    def self.parse_bombs(board_state)
        bomb_cells = []
        board_state.each_index do |x|
            board_state[0].each_index do |y|
                if board_state[x][y] == BOMB_CELL
                    bomb_cells.push [x,y]
                end
            end
        end
        return bomb_cells
    end

    game = Minesweeper.new(10,10,10)
    
    puts "Células de Bombas:"
    sheet = parse_bombs(game.board_state(xray: true))
    print sheet
    puts

    PrettyPrinter.new.print(game.board_state(xray: true))

    for i in 0..10
        for j in 0..10
            if not sheet.include?([i,j])
                game.play(i,j)
            else
                game.flag(i,j)
            end
        end
    end
    puts 
    if game.victory?
        puts "Você Venceu!"
    else
        puts "Você perdeu!"
    end
    PrettyPrinter.new.print(game.board_state(xray: true))

    puts "Novo jogo com  jogadas randômicas"

    game = Minesweeper.new(10,10,10)
    PrettyPrinter.new.print(game.board_state(xray: true))
   
    while(game.still_playing?)
        game.play(rand(10), rand(10))
    end
    if game.victory?
        puts "Você Venceu!"
    else
        puts "Você perdeu!"
    end

    PrettyPrinter.new.print(game.board_state(xray: true))



    
end # module