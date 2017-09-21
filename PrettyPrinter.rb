class PrettyPrinter
    # States:
    # >0 --> Number of Bombs nearby cell (Radius of 1 cell)
    # 0 --> Empty Cell
    # -1 --> Unknown Cell 
    # -2 --> Empty Unknown Flagged
    # -10 --> Bomb
    # -11 --> Flagged Bomb
    # -99 --> Bomb Exploded

    def print(matrix)
        matrix.each do |line|
            line.each do |cell|
                case cell
                when 0
                    $stdout.print "  "
                when -1
                    $stdout.print ". "
                when -2
                    $stdout.print "F "
                when -11
                    $stdout.print "O "
                when -10
                    $stdout.print "# "
                when -99
                    $stdout.print "X "
                else
                    $stdout.print "#{cell} "
                end
            end
            puts 
        end
        puts
    end
end
