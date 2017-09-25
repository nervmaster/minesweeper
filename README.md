# minesweeper

Um pequeno projeto de um jogo de campo minado

## Arquivos
  * main.rb - Arquivo com rotina para um jogo padrão com entrada do usuário pelo teclado.
  
  * debug.rb - Arquivo com rotina para testar as condições de falha e sucesso do jogo. As execuções dos jogos não tomam entrada do usuário.
  
  * minesweeper.rb - Código do jogo campo minado com os métodos especificados:
    * Minesweeper(H, W, N) - Construtor do objeto que faz um campo HxW com N bombas espalhadas aleatoriamente.
    * still_playing? - Retorna TRUE se o jogo ainda não terminou
    * victory? - Retorna TRUE se o jogo acabou e o jogador alcançou condição de vitória
    * play(x,y) - Descobre a célula de coordenada x,y do campo. Retorna TRUE se foi uma jogada válida.
    * flag(x,y) - Coloca ou retira uma flag de uma célula ainda não clicada. Retorna TRUE se foi uma jogada válida.
    * board_state(xray = false) - Retorna o campo do jogo somente com as informações do escopo do jogador (não mostra as posições das bombas) ou com todas as informações (mostra as posições das bombas)

  * States_Constants - Arquivo definindo estados de células com constantes numéricas. 
  
  * SimplePrinter.rb - Arquivo com o código de uma classe de uma impressora simples do estado.
    * print(board_state) - Recebe o campo de um campo minado e imprime no STDOUT os valores puros do vetor em forma de matriz (imprime linha por linha e os estados são impressos em sua forma numérica).

  * PrettyPrinter.rb - Arquivo com o código de uma classe de uma impressora elaborada. 
    print(board_state) - Recebe o campo de um campo minado e imprime de forma agradável ao jogador no STDOUT. Aqui vai uma legenda das células:
      * @ -> Bomba Explodida
      * B -> Bomba com Flag
      * # -> Bomba sem Flag
      * . -> Célula sem bomba não clicada
      * F -> Célula vazia com Flag
      *   -> Célula vazia sem bombas ao redor (valor 0)
      * 1..5 -> Célula vazia clicada com 1 ou mais bombas ao redor
