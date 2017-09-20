class Minesweeper

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
        for i in 0..width
            line = []
            for j in 0..height
                line.push '.'
            end
            @field.push line
        end

        # Calculate bombs positions
        bombs_set = 0
        while bombs_set < nbombs do
            i = Random.rand(@field.length-1)
            j = Random.rand(@field[0].length-1)
            if not @bombs_pos.include? [i,j]
                @bombs_pos.push([i,j])
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
        
        # Verify if clicked on a BOMB
        if @bombs_pos.include? [x,y]
            @playing = false
        end
        
        # Verify if its valid
        if x >= @field.length || x < 0 || y < 0 || y >= @field[0].length || @field[x][y] != '.'  
            return false
        end
       
        # Verify if got any bombs nearby
        nearby = 0
        x_pos = [x, x+1, x-1]
        y_pos = [y, y+1, y-1]

        x_pos.each do |x|
            y_pos.each do |y|
                if @bombs_pos.include? [x,y]
                    nearby += 1
                end
            end
        end

        if nearby > 0
            @field[x][y] = nearby
        else
            # Fazer recursiva as chamadas para os vizinhos proóximos
            @field[x][y] = ' '
            x_pos.each do |x|
                y_pos.each do |y|
                    self.play(x,y)
                end
            end
        end
        return  true
    end
    
    
    def printField
        @field.each_index do |i|
            @field[0].each_index do |j|
                print "#{@field[i][j]} " 
            end
            puts
        end
        print @bombs_pos
        puts
    end
end