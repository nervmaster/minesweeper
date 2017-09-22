module MineSweeper

    class SimplePrinter
        def print(matrix)
            matrix.each do |line|
                $stdout.print line
                puts
            end
            puts
        end
    end
end