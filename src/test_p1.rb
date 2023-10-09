#encoding: utf-8
require_relative '../lib/irrgarten'

arma1 = weapon.new(dice.weapon_power, dice.uses_left)

arma2 = weapon.new(dice.weapon_power, dice.uses_left)

escudo1 = shield.new(dice.shield_power, dice.uses_left)

escudo2 = shield.new(dice.shield_power, dice.uses_left)

puts dice.random_pos(5) + '\n'
puts dice.who_starts(5) + '\n'
puts dice.random_intelligence + '\n'
puts dice.random_strength +'\n'
puts dice.resurrect_player + '\n'