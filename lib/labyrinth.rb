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
        @monsterGrid = Matrix.new(n_rows){Array.new(n_cols,@@EMPTY_CHAR)}
        @labyrinthGrid = Matrix.new(n_rows){Array.new(n_cols,nil)}
        @playerGrid = Matrix.new(n_rows){Array.new(n_cols,nil)}
    end
    attr_reader :n_rows
    attr_reader :n_cols
    attr_reader :exit_row
    attr_reader :exit_col
    attr_reader :monsterGrid
    attr_reader :playerGrid
    # Proxima practica
    def spread_players(players)

    end
    def have_a_winner()
        @playerGrid[@exit_row][@exit_col].nil?
    end
    def to_string()
        estado = ""
        for i in 0..@n_rows-1
            for j in 0..@n_cols-1
                estado << @labyrinthGrid[i][j]
            end
            estado << "\n"
        end
        estado
    end
    def add_monster(row, col, monster)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end
        @monsterGrid[row][col] = monster
    end
    # Para la proxima práctica
    def put_player(direction, player)

    end
    # Para la proxima practica
    def add_block(orientation, start_row, start_column, length)

    end
    # Para la proxima practica
    def valid_moves(row, col)

    end
    
    private

    def pos_ok(row, col)
        row > @n_rows && col > @n_cols && row < 0 && col < 0
    end
    def empty_pos(row, col)
        @labyrinthGrid[row][col] == @@EMPTY_CHAR
    end
    def monster_pos(row, col)
        @labyrinthGrid[row][col] == @@MONSTER_CHAR
    end

    def exit_pos(row,col)
        row == @exit_row && col == @exit_col
    end
    def combat_pos(row, col)
        @labyrinthGrid[row][col] == @@COMBAT_CHAR
    end
    def can_step_on(row, col)
        row > @n_rows && col > @n_cols && row < 0 && col < 0 && @labyrinthGrid[i][j] != @@BLOCK_CHAR
    end
    def update_old_pos(row, col)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end

        if @labyrinthGrid[row][col] == @@COMBAT_CHAR
            @labyrinthGrid[row][col] == @@MONSTER_CHAR
        else
            @labyrinthGrid[row][col] == @@EMPTY_CHAR
        end

    end

    def dir_2_pos(row, col, direction)

    end
    def random_empty_pos()
        no_vacio = false
        pos = [0,0]
        while no_vacio == false
            fila_aleatoria = Dice.random_pos(@n_rows)
            columna_aleatoria = Dice.random_pos(@n_cols)
            no_vacio = @labyrinthGrid[fila_aleatoria][columna_aleatoria] == @@EMPTY_CHAR
        end
        pos[0] = fila_aleatoria
        pos[1] = columna_aleatoria
        pos
    end
    # Para la proxima practica
    def put_player_2d(old_row, row, col)

    end
end