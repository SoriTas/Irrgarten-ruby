require_relative 'monster'
require_relative 'directions'
require_relative 'player'

class Labyrinth
    @@BLOCK_CHAR = 'X'
    @@EMPTY_CHAR = '-'
    @@COMBAT_CHAR = 'C'
    @@MONSTER_CHAR = 'M'
    @@EXIT_CHAR = 'E'
    @@ROW = 0
    @@COL = 1


    def initialize(n_cols, n_rows, exit_row, exit_col)
        @n_rows = n_rows
        @n_cols = n_cols
        @exit_row = exit_row
        @exit_col = exit_col
        @monsterGrid = Array.new(n_rows){Array.new(n_cols){nil}}
        @labyrinthGrid = Array.new(n_rows){Array.new(n_cols){@@EMPTY_CHAR}}
        @playerGrid = Array.new(n_rows){Array.new(n_cols){nil}}
        @labyrinthGrid[@exit_row,@exit_col] = @@EXIT_CHAR
    end
    attr_reader :n_rows
    attr_reader :n_cols
    attr_reader :exit_row
    attr_reader :exit_col
    attr_reader :monsterGrid
    attr_reader :playerGrid
    # Proxima practica
    def spread_players(players)
        for i in 1..players.length()
            p = players.next
            pos = self.random_empty_pos
            self.put_player_2d(old_row = -1,old_col = -1,pos[ROW],pos[COL],p)
        end
    end
    #@brief Return true if there is a player in the exit square
    def have_a_winner()
        !@playerGrid[@exit_row,@exit_col].nil?
    end
    #@brief  convert to string the current state of the labyrinth
    def to_string()
        estado = ""
        for i in 0..@n_rows-1
            for j in 0..@n_cols-1
                estado << @labyrinthGrid[i,j].to_s
                estado << " "
            end
            estado << "\n"
        end
        estado
    end
    #brief add a monster to the labyrinth
    def add_monster(row, col, monster)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end
        while !empty_pos(row,col)
            row = Dice.random_pos(@n_rows)
            col = Dice.random_pos(@n_cols)
        end
        monster.set_pos(row,col)
        @monsterGrid[row,col] = monster
        @labyrinthGrid[row,col] = @@MONSTER_CHAR

    end
    # Para la proxima práctica
    def put_player(direction, player)
        old_row = player.row
        old_col = player.col
        new_pos = self.dir_2_pos(old_row,old_col,direction)
        monster = self.put_player_2d(old_row,old_col,new_pos[@@ROW],new_pos[@@COL],player)
    end
    # Para la proxima practica
    def add_block(orientation, start_row, start_column, length)
        if orientation = Orientation::VERTICAL
            inc_row = 1
            inc_col = 0
        else
            inc_row = 0
            inc_col = 1
        end
        row = start_row
        col = start_column
        while self.pos_ok(row,col) && self.empty_pos(row,col) && length > 0
            @labyrinthGrid[row,col] = @@BLOCK_CHAR
            row += inc_row
            col += inc_col
            length -= 1
        end
    end
    # Para la proxima practica
    def valid_moves(row, col)
        output = Directions.new
        if self.can_step_on(row + 1,col)
            output << Directions::DOWN
        end
        if self.can_step_on(row - 1,col)
            output << Directions::UP
        end
        if self.can_step_on(row,col + 1)
            output << Directions::RIGHT
        end
        if self.can_step_on(row,col - 1)
            output << Directions::LEFT
        end
    end
    

    #@brief Return true if the selected position is inside the labyrinth
    #@param row the row of the position
    # @param col the col of the position
    def pos_ok(row, col)
        row < @n_rows && col < @n_cols && row >= 0 && col >= 0
    end
    #@brief Return true if the position given is empty
    # @param row the row of the position
    # @param col the col of the position
    def empty_pos(row, col)
        @labyrinthGrid[row,col] == @@EMPTY_CHAR
    end
    #@brief return true if there is a monster in the position
    # @param row the row of the position
    #  @param col the col of the position
    def monster_pos(row, col)
        @labyrinthGrid[row,col] == @@MONSTER_CHAR
    end
    #brief return true if the position given is the exit block
    #@param row the row of the position
    # @param col the col of the position
    def exit_pos(row,col)
        row == @exit_row && col == @exit_col
    end
    #brief return if there is a combat in the given position
    #@param row the row of the position
    # @param col the col of the position
    def combat_pos(row, col)
        @labyrinthGrid[row,col] == @@COMBAT_CHAR
    end
    #brief return true if the position can be accessed
    #@param row the row of the position
    # @param col the col of the position
    def can_step_on(row, col)
        row < @n_rows && col < @n_cols && row >= 0 && col >= 0 && @labyrinthGrid[row,col] != @@BLOCK_CHAR
    end
    #brief change the the position to the current state
    #@param row the row of the position
    # @param col the col of the position
    def update_old_pos(row, col)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end

        if @labyrinthGrid[row,col] == @@COMBAT_CHAR
            @labyrinthGrid[row,col] == @@MONSTER_CHAR
        else
            @labyrinthGrid[row,col] == @@EMPTY_CHAR
        end

    end
    #brief
    #@param row the row of the position
    # @param col the col of the position
    # @param direction the direction to advance
    def dir_2_pos(row, col, direction)
        new_pos = Array.new
        new_pos << row
        new_pos << col
        if direction == Directions::UP
            new_pos[0] -= 1
        end
        if direction == Directions::DOWN
            new_pos[0] += 1
        end
        if direction == Directions::RIGHT
            new_pos[1] += 1
        end
        if direction == Directions::LEFT
            new_pos[1] -= 1
        end
        new_pos
    end
    # @brief return the position of an empty block
    def random_empty_pos()
        no_vacio = false
        pos = [0,0]
        while no_vacio == false
            fila_aleatoria = Dice.random_pos(@n_rows)
            columna_aleatoria = Dice.random_pos(@n_cols)
            no_vacio = @labyrinthGrid[fila_aleatoria,columna_aleatoria] == @@EMPTY_CHAR
        end
        pos[0] = fila_aleatoria
        pos[1] = columna_aleatoria
        pos
    end
    # Preguntar al teacher linea 198
    def put_player_2d(old_row,old_col, row, col,player)
        output = nill
        if self.can_step_on(row,col)
            if self.pos_ok(old_row,old_col)
                p = @playerGrid[old_row,old_col]
                if p == player
                    self.update_old_pos(row,col)
                    @playerGrid[old_row,old_col] = nil
                end
            end
            monster_pos = self.monster_pos(row,col)
            if monster_pos
                @labyrinthGrid[row,col] = @@COMBAT_CHAR
                output = @monsterGrid[row,col]
            else
                number = player.number
                @labyrinthGrid[row,col] = number
            end
            @playerGrid[row,col] = player
            player.set_pos(row,col)
        end
        output
    end
end