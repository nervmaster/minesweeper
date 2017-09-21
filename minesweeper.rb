class Minesweeper

    # States:
    # >0 --> Number of Bombs nearby cell (Radius of 1 cell)
    # 0 --> Empty Cell
    # -1 --> Unknown Cell 
    # -2 --> Empty Unknown Flagged
    # -10 --> Bomb
    # -11 --> Flagged Bomb
    # -99 --> Bomb Exploded
    # 

    def initialize(width, height, nbombs)
        # Field with actual status of the game
        @field = []

        # Bombs positions
        @bombs_pos = []

        # Game status
        @playing = true

        # Victory conditions
        @victory = false
        @bombs_flagged = 0

        # Initate Field
        for x in 0..width
            line = []
            for y in 0..height
                line.push -1
            end
            @field.push line
        end

        # Calculate bombs positions
        bombs_set = 0
        while bombs_set < nbombs do
            x = Random.rand(@field.length-1)
            y = Random.rand(@field[0].length-1)
            if not @field[x][y] == -10
                @field[x][y] = -10
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

    def play(i,j)
        
        # Verify if its i j are within the matrice bounds
        if i < 0 || j < 0 || i >= @field.length || j >= @field[0].length
            return false
        end
        
        # Verify if clicked on a BOMB
        if @field[i][j] == -10
            @field[i][j] = -99
            @playing = false
        end
        
        # Verify if its Unknown
        if  @field[i][j] != -1  
            return false
        end
       
       
        # Verify if got any bombs nearby
        nearby = 0
        i_pos = [i, i+1, i-1]
        j_pos = [j, j+1, j-1]

        i_pos.each do |i|
            j_pos.each do |j|
                begin
                    if (@field[i][j] >= -12 && @field[i][j] <= -10)
                        nearby += 1
                    end
                rescue
                    # Do nothing
                end
            end
        end

        if nearby > 0
            @field[i][j] = nearby
        else
            # Fazer recursiva as chamadas para os vizinhos proóximos
            @field[i][j] = 0
            i_pos.each do |i|
                j_pos.each do |j|
                    self.play(i,j)
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
        if [-2,-11].include?(@field[x][y]) 
            @field[x][y] += 1

            # Se a flag de uma bomba for tirada, desfaz
            if @field[x][y] == 10
                @bombs_flagged -= 1
            end

            return true
        end
        
        # Célula Desconhecida Ou Bomba desconhecida foi flaggeada
        @field[x][y] += -1

        if @field[x][y] == -11
            @bombs_flagged += 1

            # Se todas as bombas foram flaggeadas
            if @bombs_flagged == @bombs_pos.size
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
                    when -2, -11
                        new_line.push(-2)
                    when -10
                        new_line.push(-1)
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