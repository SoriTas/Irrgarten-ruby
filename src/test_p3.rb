# frozen_string_literal: true
require_relative '../Irrgarten/monster'
require_relative '../Irrgarten/player'
require_relative '../Irrgarten/directions'
require_relative '../Irrgarten/labyrinth'
require_relative '../Irrgarten/game'

require_relative '../textUI/textUI'
require_relative '../controller/controller'
require 'strscan'

class MAIN

  puts "Bienvenido al divertidísimo juego Irrgarten:"
  puts "Selecciona el número de jugadores"

  puts "Elegiste jugar con: "
  puts "jugadores. Ahora toca jugar"

  game = Game.new(1)
  view = TextUI.new

  controlador = Controller.new(game,view)

  controlador.play

end