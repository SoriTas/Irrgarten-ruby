class Dice 
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
            if @@generator.rand(@@max_uses + 1) > uses_left 
                true
            else
                false
            end
        end 
    end
