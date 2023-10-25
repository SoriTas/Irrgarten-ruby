require_relative 'monster'
require_relative 'directions'
require_relative 'player'

class Labyrinth
    @@BLOCK_CHAR = 'X'
    @@EMPTY_CHAR = '-'
    @@COMBAT_CHAR = 'C'
    @@EXIT_CHAR = 'E'
    @@ROW = 0
    @@COL = 1


    def initialize(n_cols, n_rows, exit_row, exit_col)
        @n_rows = n_rows
        @n_cols = n_cols
        @exit_row = exit_row
        @exit_col = exit_col
        @monsterGrid = Matrix.new(n_rows,n_cols)
        @labyrinthGrid = Matrix.new(n_rows,n_cols)
        @playerGrid = Matrix.new(n_rows,n_cols)
    end
    // Proxima practica
    def spread_players(players)

    end
    // Preguntar al teacher
    def have_a_winner()
        @playerGrid[@exit_row][@exit_col].present?
    end
    //  Preguntar al teacher
    def to_string()
        estado = ""
        for i in 0..@n_rows-1
            for j in 0..@n_cols-1
                estado << @labyrinthGrid[i][j]
            end
            estado << "\n"
        end
    end
    // preguntar al teacher
    def add_monster(row, col, monster)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end
        @monsterGrid[row][col] = monster
    end
    // Para la proxima práctica
    def put_player(direction, player)

    end
    // Para la proxima practica
    def add_block(orientation, start_row, start_column, length)

    end
    // Para la proxima practica
    def valid_moves(row, col)

    end
    
    private

    def pos_ok(row, col)
        row > @n_rows && col > @n_cols && row < 0 && col < 0
    end
    def empty_pos(row, col)
        @labyrinthGrid[row][col] == "-"
    end
    def monster_pos(row, col)
        @labyrinthGrid[row][col] == "M"
    end

    def exit_pos(row,col)
        row == @exit_row && col == @exit_col
    end
    def combat_pos(row, col)
        @labyrinthGrid[row][col] == "C"
    end
    def can_step_on(row, col)
        row > @n_rows && col > @n_cols && row < 0 && col < 0 && @labyrinthGrid[i][j] != "X"
    end
    def update_old_pos(row, col)
        if row > @n_rows || col > @n_cols || row < 0 || col < 0
            raise Exception.new("Parametros fuera de rango")
        end

        if @labyrinthGrid[row][col] == "C"
            @labyrinthGrid[row][col] == "M"
        else
            @labyrinthGrid[row][col] == "-"
        end

    end
    // Preguntar al teacher
    def dir_2_pos(row, col, direction)

    end
    // Preguntar como hacer el retur
    def random_empty_pos()
        no_vacio = true
        while no_vacio
            fila_aleatoria = Dice.random_pos(@n_rows)
            columna_aleatoria = Dice.random_pos(@n_cols)
            no_vacio = @labyrinthGrid[fila_aleatoria][columna_aleatoria] == "-"
        end

    end
    // Para la proxima practica
    def put_player_2d(old_row, row, col)

    end
end