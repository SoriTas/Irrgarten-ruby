class shield
        def initialize(protection,uses)
            @protection = protection
            @uses = uses
        end
        def protect
            
            if uses > 0
                uses += -1
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
