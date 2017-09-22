module MineSweeper
    require_relative "States_Constants"

    class Minesweeper

        def initialize(width, height, nbombs)
            # Field with actual status of the game
            @field = []

            # Game status
            @playing = true

            # Victory conditions
            @victory = false
            @bombs_flagged = 0
            @nbombs = nbombs


            # Initate Field
            for x in 0..width
                line = []
                for y in 0..height
                    line.push UNKNOWN_CELL
                end
                @field.push line
            end

            # Calculate bombs positions
            bombs_set = 0
            while bombs_set < @nbombs do
                x = Random.rand(@field.length-1)
                y = Random.rand(@field[0].length-1)
                if not @field[x][y] == BOMB_CELL
                    @field[x][y] = BOMB_CELL
                    bombs_set += 1
                end
            end
        end

        def still_playing?
            @playing
        end

        def victory?
            @victory
        end

        def play(x,y)
            
            # Verify if its i j are within the matrice bounds
            if x < 0 || y < 0 || x >= @field.length || y >= @field[0].length
                return false
            end
            
            # Verify if clicked on a BOMB
            if @field[x][y] == BOMB_CELL
                @field[x][y] = BOMB_EXPLODED
                @playing = false
            end
            
            # Verify if its not Unknown
            if  @field[x][y] != UNKNOWN_CELL  
                return false
            end
        
            # Verify if got any bombs nearby
            nearby = 0
            x_pos = [x, x+1, x-1]
            y_pos = [y, y+1, y-1]

            x_pos.each do |x|
                y_pos.each do |y|
                    begin
                        # If any bombs (Flagged or not)
                        if (@field[x][y] == BOMB_CELL || @field[x][y] == BOMB_FLAGGED)
                            nearby += 1
                        end
                    rescue
                        # If x,y are invalid for the matrice
                        # Do nothing
                    end
                end
            end

            if nearby > 0
                @field[x][y] = nearby
            else
                # Fazer recursiva as chamadas para os vizinhos próximos
                # Se uma célula vazia
                @field[x][y] = 0
                x_pos.each do |x|
                    y_pos.each do |y|
                        self.play(x,y)
                    end
                end
            end
            return  true
        end

        def flag(x,y)
            # Se a célula foi clicada antes
            if @field[x][y] >= 0
                return false
            end

            # Se clicou em cima de uma flag
            # desfaz
            if [EMPTY_UNKNOWN_FLAGGED,BOMB_FLAGGED].include?(@field[x][y]) 
                @field[x][y] = (@field[x][y] == BOMB_FLAGGED) ? BOMB_CELL : UNKNOWN_CELL

                # Se a flag de uma bomba for tirada, desfaz
                if @field[x][y] == BOMB_CELL
                    @bombs_flagged -= 1
                end

                return true
            end
            
            # Célula Desconhecida Ou Bomba desconhecida foi flaggeada
            @field[x][y] = (@field[x][y] == UNKNOWN_CELL) ? EMPTY_UNKNOWN_FLAGGED : BOMB_FLAGGED 

            if @field[x][y] == BOMB_FLAGGED
                @bombs_flagged += 1

                # Se todas as bombas foram flaggeadas
                if @bombs_flagged == @nbombs
                    @victory = true
                    @playing = false
                end
            end
            return true 
        end
        
        def board_state(xray = false)
            if !xray
                new_field = []
                @field.each do |line|
                    new_line = []
                    line.each do |elem|
                        case elem
                        # Disfarça todas as Flags como de célula vazia
                        when EMPTY_UNKNOWN_FLAGGED, BOMB_FLAGGED
                            new_line.push(EMPTY_UNKNOWN_FLAGGED)
                        # Disfarça as bombas como células vazias
                        when BOMB_CELL
                            new_line.push(UNKNOWN_CELL)
                        # manda o número da célula
                        else
                            new_line.push(elem)
                        end
                    end
                    new_field.push(new_line)
                end
                return new_field
            else # XRAY TRUE
                return @field
            end
        end
    end

end #Module