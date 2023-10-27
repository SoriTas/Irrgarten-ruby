class Player
  @@MAX_WEAPONS=2
  @@MAX_SHIELDS=3
  @@INITIAL_HEALTH=10
  @@HITS2LOSE=3
  
  def initialize(name,number,intelligence,strength,row,col,consecutive_hits)
    @name = name
    @number = number
    @intelligence = intelligence
    @strength = strength
    @health = @@INITIAL_HEALTH
    @row = row
    @col = col
    @consecutive_hits = consecutive_hits
    @weapons = Array.new 
    @shields = Array.new
  end

  def resurrect
    
  end

  def get_row
    
  end

  def get_col
    
  end

  def get_number
    
  end
  
  def set_pos
    
  end

  def dead
    
  end

  def move(direction,valid_moves)
    
  end

  def attack
    
  end

  def defend(recieved_attack)
    
  end

  def recieve_reward
    
  end

  def to_string
    
  end

  def recieve_weapon(weapon)
    
  end

  def recieve_shield(shield)
    
  end

  private

  def new_weapon
    
  end

  def new_shield
    
  end

  def sum_weapons
    
  end

  def sum_shields
    
  end

  def defensive_energy
    
  end

  def manage_hit(recieved_attack)
    
  end

  def reset_hits()
    
  end

  def got_wounded
    
  end

  def inc_consecutive_hits
    
  end

end
