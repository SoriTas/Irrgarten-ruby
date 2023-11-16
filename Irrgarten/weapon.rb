
require_relative 'dice'
class Weapon
        def initialize(power,uses)
            @power = power
            @uses = uses
        end
        attr_reader :power
        attr_reader :uses
        def attack
            if uses > 0
                intensidad = @power
                @uses += -1
            else
                intensidad = 0  
            end
            intensidad
        end
        def to_s
            cadena = "W[" + @power.to_s + "," + @uses.to_s + "]"
            cadena
        end
        def discard
          Dice.discard_element(@uses)
        end 

    end
