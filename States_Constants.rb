module MineSweeper
    # Os estados do Minesweeper são expressados com números negativos
    # Estados positivos é igual ao número de bombas próximas daquela célula

    UNKNOWN_CELL = -1
    EMPTY_UNKNOWN_FLAGGED = -2
    BOMB_CELL = -3
    BOMB_FLAGGED = -4
    BOMB_EXPLODED = -5
end