
require_relative 'combat_element'
require_relative 'dice'
module Irrgarten
class Weapon < Combat_element
        def initialize(power,uses)
          super(power,uses)
        end
        attr_reader :power
        attr_reader :uses
        def attack
          produce_effect
        end
        def to_s
            cadena = "W" + super.to_s
            cadena
        end

end

end

