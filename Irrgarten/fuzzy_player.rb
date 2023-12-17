# frozen_string_literal: true
module Irrgarten
class Fuzzy_player < Player
  def initialize(other)
    copy_player(other)
  end
  def move(direction, valid_moves)
    Dice.nextStep(direction, valid_moves, @intelligence)
  end
  def attack
    sum_weapons + Dice.intensity(@strength)
  end

  protected def defensive_energy
    sum_weapons + Dice.intensity(@strength)
  end

  def to_s
    "FuzzyPlayer: " + super.to_s
  end
end

end
