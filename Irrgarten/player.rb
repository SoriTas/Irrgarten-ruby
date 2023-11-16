require_relative 'directions'
require_relative 'weapon'
require_relative 'shield'

class Player
  @@MAX_WEAPONS=2
  @@MAX_SHIELDS=3
  @@INITIAL_HEALTH=10
  @@HITS2LOSE=3
  
  def initialize(number,intelligence,strength)
    @name = "Player #" + number.to_s
    @number = number
    @intelligence = intelligence
    @strength = strength
    @health = @@INITIAL_HEALTH
    @row = -1
    @col = -1
    @consecutive_hits = 0
    @weapons = Array.new
    @weapons << Weapon.new(Dice.weapon_power,Dice.uses_left)
    @shields = Array.new
    @shields << Shield.new(Dice.shield_power,Dice.uses_left)
  end
  attr_reader :row
  attr_reader :col
  attr_reader :number
  #@brief It empties the weapon and shield array and returns the health and consecutive hits to its default value
  def resurrect
    
    @weapons.clear
    @shields.clear
    @health = @@INITIAL_HEALTH
    reset_hits

  end
  #@biref Modifies the players position
  #@param row the row of the players position
  #@param col the column of the players position
  def set_pos(row, col)
    
    @row = row
    @col = col

  end
  #@brief returns if the player is dead
  def dead
    
    @health <= 0

  end
  #Preguntar al teacher
  def move(direction,valid_moves)
    if valid_moves == nil
      size = 0
      contained = false
    else
      size = valid_moves.length
      contained = valid_moves.include? direction
    end
    if size > 0 && !contained
      first_element = valid_moves[0];
    else
      direction
    end
  end
  #@brief adds the player strength with the value of his weapons
  def attack

    attack = @strength + sum_weapons

    attack

  end
  #@brief this method uses the method manage_hit
  #@param is the value of the recieved attack
  def defend(recieved_attack)
    
    manage_hit(recieved_attack)

  end

  def receieve_reward
    wReward = Dice.weapons_reward
    sReward = Dice.shields_reward
    for i in 1..wReward
      wnew = self.new_weapon
      self.recieve_weapon(wnew)
    end
    for i in 1..sReward
      snew = self.new_shield
      self.recieve_shield(snew)
    end
    extraHealth = Dice.health_reward
    @health += extraHealth
  end
  #@brief converts to string the current state of the player
  def to_string
    
    estado = " "

    estado << @name
    estado << ";"
    estado << "Intelligence: "
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
    estado << "Consecutive Hits: "
    estado << @consecutive_hits.to_s
    estado << ";"
    @weapons.each do |weapon|
      estado << weapon.to_s
      estado << ";"
    end
    @shields.each do |shield|
      estado << shield.to_s
      estado << ";"
    end
    estado

  end

  def recieve_weapon(weapon)
    @weapons.each do |wi|
      discard = wi.discard
      if discard
        @weapons.delete(wi)
      end
    end
    size = @weapons.length
    if size < @@MAX_WEAPONS
      @weapons << weapon
    end
  end

  def recieve_shield(s)
    @shields.each do |si|
      discard = si.discard
      if discard
        @shields.delete(si)
      end
    end
    size = @shields.length
    if size < @@MAX_SHIELDS
      @shields << s
    end
  end

  #@brief generates a new weapon
  def new_weapon
    
    weapon = Weapon.new(Dice.weapon_power, Dice.uses_left)

  end
  #@brief generates a new shield
  def new_shield
    
    shield = Shield.new(Dice.shield_power, Dice.uses_left)

  end
  #@brief returns the addition of all the weapons power
  def sum_weapons
    suma = 0
      @weapons.each do |weapon|
        suma += weapon.attack
      end
    suma
  end
  #
  def sum_shields
    suma = 0
    @shields.each do |shield|
      suma += shield.protect
    end
    suma
  end
  #@brief adds the player intelligence with the value of its weapons
  def defensive_energy
    
    defense = @intelligence + sum_shields

    defense

  end

  def manage_hit(receieved_attack)
    defense = self.defensive_energy
    if defense < receieved_attack
      self.got_wounded
      self.inc_consecutive_hits
    else
      self.reset_hits
    end
    if @consecutive_hits == @@HITS2LOSE || self.dead
      self.reset_hits
      lose = true
    else
      lose = false
    end
  end

  private
  #@brief sets de value of consecutive_hits to cero
  def reset_hits
    
    @consecutive_hits = 0

  end
  #@brief decreases in one the value of the players health
  def got_wounded
    
    @health -= 1

  end
  #@brief increases in one the value of the consecutive hits
  def inc_consecutive_hits
    
    @consecutive_hits += 1

  end

end
