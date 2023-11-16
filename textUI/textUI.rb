
require 'io/console'
require_relative '../Irrgarten/directions'

module UI

  class TextUI

    #https://gist.github.com/acook/4190379
    def read_char
      STDIN.echo = false
      STDIN.raw!
    
      input = STDIN.getc.chr
      if input == "\e" 
        input << STDIN.read_nonblock(3) rescue nil
        input << STDIN.read_nonblock(2) rescue nil
      end
    ensure
      STDIN.echo = true
      STDIN.cooked!
    
      return input
    end

    def next_move
      print "Where? "
      got_input = false
      while (!got_input)
        c = read_char
        case c
          when "\e[w"
            puts "UP ARROW"
            output = Irrgarten::Directions::UP
            got_input = true
          when "\e[s"
            puts "DOWN ARROW"
            output = Irrgarten::Directions::DOWN
            got_input = true
          when "\e[d"
            puts "RIGHT ARROW"
            output = Irrgarten::Directions::RIGHT
            got_input = true
          when "\e[a"
            puts "LEFT ARROW"
            output = Irrgarten::Directions::LEFT
            got_input = true
          when "\u0003"
            puts "CONTROL-C"
            got_input = true
            exit(1)
          else
            #Error
        end
      end
      output
    end

    def show_game(game_state)
      puts game_state.labyrinth.to_s
      game_state.players.each do |player|
        puts player.to_s
      end
      game_state.monsters.each do |monster|
        puts monster.to_s
      end
      puts "Current Player: "
      puts game_state.current_player.to_s
      puts "Winner: " << game_state.winner.to_s
      puts game_state.log.to_s
    end

  end # class   

end # module   


