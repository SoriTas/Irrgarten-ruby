require_relative 'dice'
require_relative 'labyrinth_character'
module Irrgarten
class Monster < Labyrinth_character
  @@INITAL_HEALTH = 5
  def initialize(name,intelligence,strength)
    super(name, intelligence, strength, @@INITAL_HEALTH)
  end
  #@brief Return a value generated from the dice class method intensity passing the strength attribute as argument
  def attack
    
    Dice.intensity(@strength)

  end
  #Proxima Practica
  def defend(recieved_attack)
    is_dead = self.dead
    unless is_dead
      defensive_energy = Dice.intensity(@intelligence)
      if defensive_energy < recieved_attack
        self.got_wounded
        is_dead = self.dead
      end
    end
    is_dead
  end
  # @brief Decrease one unit the health of the monster
  def got_wounded

    @health += -1

  end

end

end