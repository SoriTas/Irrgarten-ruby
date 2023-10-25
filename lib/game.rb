require_relative 'player'
require_relative 'monster'
require_relative 'labyrinth'
require_relative 'game_state'
require_relative 'directions'
require_relative 'game_character'
require_relative 'dice'

class Game 
    @@MAX_ROUNDS = 10

    def initialize(n_players)
        @players = Array.new
        @current_player_index = Dice.who_starts(n_players) % n_players
        @current_player = Player.new
        @labyrinth = Labyrinth.new
        @monsters = Array.new
        configure_labyrinth
        @labyrinth.spread_players(@players)
    end
    def finished()
        @labyrinth.have_a_winner
    end
    // Proxima practica
    def next_step(preferred_direction)

    end
    def get_game_state()
        @game_state = Game_state.new
    end
 
    private
    // Preguntar al teacher
    def configure_labyrinth()
        @labyrinth.add_monster(Dice.random_pos(@labyrinth))
    end

    def next_player()
        @current_player_index += 1
        @current_player = @players[@current_player_index]
    end
    // Proxima Practica
    def actual_direction(preferred_direction)

    end
    // proxima practica
    def combat(monster)

    end
    //Proxima practica
    def manage_reward(winner)

    end
    //Proxima practica
    def manage_resurrection()

    end

    def log_player_won
        @log << "El jugador ha ganado el combate.\n"
    end

    def log_monster_won()
        @log << "El mounstro ha ganado el combate.\n"
    end
    def log_resurrected()
        @log << "El jugador ha resucitado.\n"
    end
    def log_player_skip_turn()
        @log << "El jugador ha perdido el turno por estar muerto.\n"
    end
    def log_player_no_orders()
        @log << "El jugador no ha seguido las instrucciones del jugador humano.\n"
    end
    def log_no_monster()
        @log << "El jugador se ha movido a una celda vacia o no le ha sido posible moverse.\n"
    end
    def log_rounds(rounds, max)
        @log << "Se han producido " + rounds + "/" + max + "rondas de combate.\n"
    end