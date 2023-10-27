require_relative 'player'
require_relative 'monster'
require_relative 'labyrinth'
require_relative 'game_state'
require_relative 'directions'
require_relative 'game_character'
require_relative 'dice'

class Game 
    @@MAX_ROUNDS = 10
    @@FILAS_MAX = 7
    @@COLUMNAS_MAX = 5
    @@FILA_SALIDA = 0
    @@COLUMNA_SALIDA = 0
    def initialize(n_players)
        @players = Array.new(n_players)
        @current_player_index = Dice.who_starts(n_players)
        @current_player = @players[@current_player_index]
        @labyrinth = Labyrinth.new(@@FILAS_MAX,@@COLUMNAS_MAX,@@FILA_SALIDA,@@COLUMNA_SALIDA)
        @monsters = Array.new
        configure_labyrinth
        @labyrinth.spread_players(@players)
        @log = nil
    end
    #@brief return true if there is a winner
    def finished()
        @labyrinth.have_a_winner
    end
    # Proxima practica
    def next_step(preferred_direction)

    end
    #@brief Return the state of the game
    def get_game_state
        @game_state = Game_state.new(@labyrinth,@players,@monsters,@players[@current_player_index],@labyrinth.have_a_winner,@log)
    end
 
    private
    # Proxima Practica
    def configure_labyrinth()
        for i in 0..@monsters.size
            @labyrinth.add_monster(Dice.random_pos(@labyrinth.n_rows),Dice.random_pos(@labyrinth.n_cols),@monsters[i])
        end
    end
    #@brief Change the current player turn
    def next_player()
        @current_player_index = (@current_player_index + 1) % @n_players
        @current_player = @players[@current_player_index]
    end
    # Proxima Practica
    def actual_direction(preferred_direction)

    end
    # proxima practica
    def combat(monster)

    end
    # Proxima practica
    def manage_reward(winner)

    end
    # Proxima practica
    def manage_resurrection

    end
    #@brief Register in the log when a player wins a combat
    def log_player_won
        @log += "El jugador ha ganado el combate.\n"
    end
    #@brief Register in the log when a player loses a combat
    def log_monster_won()
        @log += "El mounstro ha ganado el combate.\n"
    end
    #@brief Register in the log when a player is resurrected
    def log_resurrected()
        @log += "El jugador ha resucitado.\n"
    end
    #@brief Register in the log when a player skips a turn
    def log_player_skip_turn()
        @log += "El jugador ha perdido el turno por estar muerto.\n"
    end
    #@brief Register in the log when a player does not follow orders
    def log_player_no_orders()
        @log += "El jugador no ha seguido las instrucciones del jugador humano.\n"
    end
    #@brief Register in the log when a player moves to an empty cell or was unable to move
    def log_no_monster()
        @log += "El jugador se ha movido a una celda vacia o no le ha sido posible moverse.\n"
    end
    #@brief Register in the log how many rounds the combat lasted
    def log_rounds(rounds, max)
        @log += "Se han producido " + rounds + "/" + max + "rondas de combate.\n"
    end
end