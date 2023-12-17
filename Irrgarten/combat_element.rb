# frozen_string_literal: true
module Irrgarten
class Combat_element
  def initialize(effect, uses)
    @effect = effect
    @uses = uses
  end
  def discard
    Dice.discard_element(@uses)
  end
  def to_s
    "[" + @effect.to_s + "," + @uses.to_s + "]"
  end
  protected def produce_effect
    if @uses > 0
      @uses += -1
      @effect
    else
      0
    end
  end

end

end
