class Monster
  @@INITAL_HEALTH = 5
  def initialise(name,intelligence,strength,health,row,col)
    @name = name
    @intelligence = intelligence
    @strength = strength
    @health = health
    @row = row
    @col = col
  end
  #@brief Checks if the monster is dead. Return a true if health is lower or equal to zero
  def dead
    
  end
  #@brief Return a value generated from the dice class method intensity passing the strength attribute as argument
  def attack
    
  end
  #Proxima Practica
  def defend(recieved_attack)
    
  end
  #@brief Refresh the position of the monster
  #@param row Fila nueva
  #@param col Columna nueva
  def set_pos(row,col)
    
  end
  #@brief Return the a string containing the stats of the mosnter
  def to_String
    
  end
  # @brief Decrease one unit the health of the monster
  def got_wounded

  end

end
