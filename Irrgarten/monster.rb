require_relative 'dice'

class Monster
  @@INITAL_HEALTH = 5
  def initialize(name,intelligence,strength)
    @name = name
    @intelligence = intelligence
    @strength = strength
    @health = @@INITAL_HEALTH
    @row = -1
    @col = -1
  end
  #@brief Checks if the monster is dead. Return a true if health is lower or equal to zero
  def dead
    
    @health <= 0

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
  #@brief Refresh the position of the monster
  #@param row Fila nueva
  #@param col Columna nueva
  def set_pos(row,col)
    
    @row = row
    @col = col

  end
  #@brief Return the a string containing the stats of the mosnter
  def to_String
    
    estado = " "

    estado << @name
    estado << ";"
    estado << "Inteligence: "
    estado << @intelligence.to_s
    estado << ";"
    estado << "Strength: "
    estado << @strength.to_s
    estado << ";"
    estado << "Health: "
    estado << @health.to_s
    estado << ";"
    estado << "Row: "
    estado << @row.to_s
    estado << ";"
    estado << "Col: "
    estado << @col.to_s
    estado << ";"

    estado

  end
  # @brief Decrease one unit the health of the monster
  def got_wounded

    @health -= 1

  end

end
