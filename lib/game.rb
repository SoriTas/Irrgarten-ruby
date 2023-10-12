require_relative 'player'
require_relative 'monster'
require_relative 'labyrinth'
require_relative 'game_state'
require_relative 'directions'
require_relative 'game_character'

class Game 
    @@MAX_ROUNDS = 10
    @current_player_index
    @log

    def initialize(n_players)

    end
    def finished()

    end
    def next_step()

    end
    def get_game_state()

    end
 
    private
 
    def configure_labyrinth()

    end
    def next_player()

    end
    def actual_direction(preferred_direction)

    end
    def combat(monster)

    end
    def manage_reward(winner)

    end
    def manage_resurrection()

    end
    def log_player_won()

    end
    def log_monster_won()

    end
    def log_resurrected()

    end
    def log_player_skip_turn()

    end
    def log_player_no_orders()

    end
    def log_no_monster()

    end
    def log_rounds(rounds, max)

    end