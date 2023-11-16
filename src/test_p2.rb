# frozen_string_literal: true

require_relative '../Irrgarten/monster'
require_relative '../Irrgarten/player'
require_relative '../Irrgarten/directions'
require_relative '../Irrgarten/labyrinth'
require_relative '../Irrgarten/game'

class MAIN

  puts "----------Monstruo----------"
  puts "Creo el monstruo m1"
  m1 = Monster.new("m1",Dice.random_intelligence,Dice.random_strength)

  puts m1.to_s
  puts "Le paso la posición 1,3:"
  m1.set_pos(1,3)
  puts m1.to_s
  puts "Ataca:"
  puts m1.attack
  m1.defend(4)
  if(m1.dead)
    puts "esta muerto"

  else
    puts "No esta muerto"
  end

  puts m1.to_s
  puts "--------------------------"

  puts "----------Player----------"
  puts "Creo el player p1:"
  p1 = Player.new("1",Dice.random_intelligence,Dice.random_strength)
  puts p1.to_string
  puts "Ataca:"
  puts p1.attack
  ola = p1.attack
  puts p1.to_string
  puts "Defiende:"
  puts p1.defend(100)
  if(p1.dead)
    puts "Esta muerto"
  else
    puts "No esta muerto"
  end
  puts p1.to_string
  p1.resurrect
  puts p1.to_string
  puts "--------------------------"

  puts "---------Labyrinth--------"
  puts "Creo el laberinto l1:"
  l1 = Labyrinth.new(3,3,2,2)
  puts l1.to_string
  puts "añado el monstruo m1:"
  l1.add_monster(1,1,m1)

  puts l1.to_string
  pos = Array.new
  for i in 0..20

    pos = l1.random_empty_pos
    puts "\n" + "pos:" + pos[0] + pos[1] + "\n"

  end

  puts "--------------------------"
  puts "----------Game------------"
  puts "--------------------------"

end