class Dice 
        @@MAX_USES = 5
        @@MAX_INTELLIGENCE = 10.0
        @@MAX_STRENGTH = 10.0
        @@RESURRECT_PROB = 0.3
        @@WEAPONS_REWARD = 2
        @@SHIELDS_REWARD = 3
        @@HEALTH_REWARD = 5
        @@MAX_ATTACK = 3
        @@MAX_SHIELD = 2
        @@generator = Random.new

        def self.random_pos(max)
            @@generator.rand(max)
        end   
        
        def self.who_starts(n_players)  
            @@generator.rand(n_players)
        end 
        
        def self.random_intelligence
            @@generator.rand(@@MAX_INTELLIGENCE)
        end
        
        def self.random_strength
            @@generator.rand(@@MAX_STRENGTH)
        end
        
        def self.resurrect_player
            @@generator.rand(1.0) < @@RESURRECT_PROB
        end
        
        def self.weapons_reward
            @@generator.rand(@@WEAPONS_REWARD + 1)
        end
        
        def self.shields_reward
            @@generator.rand(@@SHIELDS_REWARD + 1)
        end 
        
        def self.health_reward
            @@generator.rand(@@HEALTH_REWARD + 1)
        end  
        
        def self.weapon_power
            @@generator.rand(@@MAX_ATTACK + 1)
        end
        
        def self.shield_power
            @@generator.rand(@@MAX_SHIELD + 1)
        end
        
        def self.uses_left
            @@generator.rand(@@MAX_USES + 1)
        end
        
        def self.intensity(competence)
            @@generator.rand(competence + 1)
        end 
        
        def self.discard_element(uses_left)
             @@generator.rand(@@MAX_USES + 1) > uses_left
        end
        def self.nextStep(preference, valid_moves, intelligence)
          if(@@generator.rand(@@MAX_INTELLIGENCE) < intelligence)
            preference
          else
            random_pos = @@generator.rand(valid_moves.size)
            valid_moves[random_pos]
          end
        end
        
    end
