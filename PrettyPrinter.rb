module MineSweeper
    require_relative "States_Constants"

    class PrettyPrinter
        def print(matrix)
            matrix.each do |line|
                line.each do |cell|
                    case cell
                    when 0 #Empty Cell
                        $stdout.print "  "
                    when UNKNOWN_CELL
                        $stdout.print ". "
                    when EMPTY_UNKNOWN_FLAGGED
                        $stdout.print "F "
                    when BOMB_FLAGGED
                        $stdout.print "O "
                    when BOMB_CELL
                        $stdout.print "# "
                    when BOMB_EXPLODED
                        $stdout.print "@ "
                    else #Imprime o numero da celula
                        $stdout.print "#{cell} "
                    end
                end
                puts 
            end
            puts
        end
    end
end #Module