require_relative 'dice'
require_relative 'combat_element'
module Irrgarten

class Shield < Combat_element
        def initialize(protection,uses)
          super(protection,uses)
        end
        attr_reader :protection
        attr_reader :uses
        def protect
          produce_effect
        end
        def to_s
            cadena = "S" + super.to_s
            cadena
        end
end

end