require_relative 'dice'

class Shield
        def initialize(protection,uses)
            @protection = protection
            @uses = uses
        end
        attr_reader :protection
        attr_reader :uses
        def protect
            
            if @uses > 0
              @uses += -1
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
          Dice.discard_element(@uses)
        end 
    end
