class game_state
        def initialize(labyrinth,players,monsters,current_player,winner,log)
            @labyrinth = labyrinth
            @player = player
            @monsters = monster
            @current_player = current_player
            @winner = winner
            @log = log
        end 
        attr_reader :labyrinth
        attr_reader :player
        attr_reader :monster
        attr_reader :current_player
        attr_reader :winner
        attr_reader :log
        
    end 
