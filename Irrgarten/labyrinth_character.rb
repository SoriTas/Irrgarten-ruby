# frozen_string_literal: true
module Irrgarten
class Labyrinth_character
  def initialize(name, intelligence, strength, health)
    @name = name
    @intelligence = intelligence
    @strength = strength
    @health = health
    @row = -1
    @col = -1
  end
  def copy_char(other)
    @name = other.name
    @intelligence = other.intelligence
    @strength = other.strength
    @health = other.health
    @row = other.row
    @col = other.col
  end
  attr_reader :row
  attr_reader :col
  attr_reader :name
  def dead
    @health <= 0
  end
  def set_pos(row,col)
    @row = row
    @col = col
  end
  def to_s
    "Name: " + @name + "; " + "Strength: " + @strength.to_s + "; " + "Intelligence: " + @intelligence.to_s + "; " + "Health: " + @health.to_s + "; " + "Row: " + @row.to_s + "; " + "Col: " + @col.to_s
  end
  protected
  attr_reader :intelligence
  attr_reader :strength
  attr_reader :health
  def set_health(health)
    @health = health
  end
  def got_wounded
    @health = @health-1
  end
end

end
