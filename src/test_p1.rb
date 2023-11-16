#encoding: utf-8

require_relative '../Irrgarten/monster'
require_relative '../Irrgarten/player'
require_relative '../Irrgarten/directions'
require_relative '../Irrgarten/labyrinth'
require_relative '../Irrgarten/game'

class MAIN

  arma1 = Weapon.new(1.2,5)
  arma2 = Weapon.new(1.3,4)
  arma3 = Weapon.new(6.2, 6)

  escudo1 = Shield.new(3.2,1)
  escudo2 = Shield.new(4.2, 2)
  escudo3 = Shield.new(5.2,3)

  puts escudo1.to_s
  ganador = false

  Jugada = Game_state.new("Pachuru","Paquirrin","El feo",1,ganador,"Ronda 1")

  for i in 0..100

    puts Dice.uses_left
    puts Dice.shield_power
    puts Dice.discard_element(5)
    puts Dice.discard_element(3)
    puts Dice.discard_element(2)
    puts Dice.discard_element(4)
  end

end