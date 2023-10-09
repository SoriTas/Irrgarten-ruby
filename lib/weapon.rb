
require_relative 'dice'
class Weapon
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
