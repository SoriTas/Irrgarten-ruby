#encoding: utf-8
module Irrgarten
    module directions
        LEFT =:left 
        RIGHT =:right 
        UP =:up 
        DOWN =:down 

    end
    module orientation
        VERTICAL =:vertical 
        HORIZONTAL=:horizontal 
    end
    module game_character
        PLAYER = :player 
        MONSTER = :monster
    end
    class weapon
        def initialize(power,uses)
            @power = power
            @uses = uses
        end
        def attack
            if uses > 0
                intensidad = power
                @uses += -1
            else
                intensidad = 0  
            end
        end
        def to_s
            cadena = "W[" + @power.to_s + "," + @uses.to_s + "]"
            cadena
        end
        def discard
            dice.discard_element(@uses)
        end 

    end
    class shield
        def initialize(protection,uses)
            @protection = protection
            @uses = uses
        end
        def protect
            
            if uses > 0
                protect = @protection
            else
                protect = 0
            end
        end
        def to_s
            cadena = "S[" + @protection.to_s + "," + @uses.to_s + "]"
            cadena
        end
        def discard
            dice.discard_element(@uses)
        end 
    end
    class dice 
        @@max_uses = 5
        @@max_intelligence = 10.0
        @@max_strength = 10.0
        @@resurrect_prob = 0.3
        @@weapons_reward = 2
        @@shield_reward = 3
        @@health_reward = 5
        @@max_attack = 3
        @@max_shield = 2
        @@generator = Random.new
        
        def self.random_pos(max)
            @@generator.rand(max)
        end   
        def self.who_starts(n_players)  
            @@generator.rand(n_players)
        end 
        def self.random_intelligence
            @@generator.rand(@@max_intelligence)
        end
        def self.random_strength
            @@generator.rand(@@max_strength)
        end
        def self.resurrect_player
            if @@generator.rand(1.0) < @@resurrect_prob 
                resurrect = true
            else
                resurrect = false
            end
        end
        def self.weapons_reward
            @@generator.rand(@@weapons_reward + 1)
        end
        def self.shields_reward
            @@generator.rand(@@shield_reward + 1)
        end 
        def self.health_reward
            @@generator.rand(@@health_reward + 1)
        end     
        def self.weapon_power
            @@generator.rand(@@max_attack + 1)
        end
        def self.shield_power
            @@generator.rand(@@max_shield + 1)
        end
        def self.uses_left
            @@generator.rand(@@max_uses + 1)
        end
        def self.intensity(competencia)
            @@generator.rand(competencia + 1)
        end 
        def self.discard_element(uses_left)
            if @@generator.rand(@@max_uses + 1) < uses_left 
                true
            else
                false
            end
        end 
    end
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
end

