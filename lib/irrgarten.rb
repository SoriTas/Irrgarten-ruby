#encoding: utf-8
require_relative 'weapon'
require_relative 'shield'
require_relative 'dice'
require_relative 'game_state'

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
    
end

Funciona en endeavouros
