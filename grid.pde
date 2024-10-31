/**
 * Die Klasse Grid repräsentiert ein Raster aus Zellen, das zur Pfadfindung verwendet wird.
 */
public class Grid {
    private int square_size; // Breite und Höhe eines Grid-Feldes
    private int grid_width; // Anzahl der Felder horizontal
    private int grid_heigth; // Anzahl der Felder vertikal
    private final int left_space = 200; // Abstand zur UI
    private final int stroke_weight = 1; 
    
    private Cell[][] grid;

    private Position start_pos; 
    private Position end_pos; 
    /**
     * Konstruktor der Grid-Klasse.
     */
    Grid() {
        this.square_size = 7; 
        this.grid_width = (window_size - this.left_space) / this.square_size;
        this.grid_heigth = (window_size / this.square_size);
        
        this.grid = new Cell[this.grid_width][this.grid_heigth];
         
        for (int row = 0; row < this.grid_width; ++row) {
            for (int col = 0; col < this.grid_heigth; ++col) {
                this.grid[row][col] = new Cell(Cell_state.empty);
            }
        }
        
        this.start_pos = new Position(0, 0);
        this.end_pos = new Position(this.grid_width-1, this.grid_heigth-1);
        
        this.set_cell_state(start_pos.get_x(), start_pos.get_y(), Cell_state.start);
        this.set_cell_state(end_pos.get_x(), end_pos.get_y(), Cell_state.end);
    }

    /**
     * Setzt die Größe der Zellen und passt die Breite und Höhe des Rasters entsprechend an.
     *
     * @param new_square_size Die neue Größe der Zellen.
     */
    public void set_size(int new_square_size) {
        this.square_size = new_square_size;
        this.grid_width = (window_size - this.left_space) / this.square_size;
        this.grid_heigth = (window_size / this.square_size);
    }

    /**
     * Gibt den linken Abstand zurück.
     *
     * @return Der linke Abstand.
     */
    public int get_left_space() {
        return this.left_space;
    }

    /**
     * Gibt den Zustand einer Zelle an der angegebenen Position zurück.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @return Der Zustand der Zelle.
     */
    public Cell_state get_cell_state(int row, int col) {
        return this.grid[row][col].get_state();
    }

    /**
     * Gibt die Farbe einer Zelle an der angegebenen Position zurück.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @return Die Farbe der Zelle.
     */
    public color get_cell_color(int row, int col) {
        return this.grid[row][col].get_color();
    }

    /**
     * Gibt das Gewicht einer Zelle an der angegebenen Position zurück.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @return Das Gewicht der Zelle.
     */
    public int get_cell_weight(int row, int col) {
        return this.grid[row][col].get_weight();
    }  

    /**
     * Gibt den Zustand einer Zelle an der angegebenen Position zurück.
     *
     * @param position Die Position der Zelle.
     * @return Der Zustand der Zelle.
     */
    public Cell_state get_cell_state(Position position) {
        return this.grid[position.get_x()][position.get_y()].get_state();
    }

    /**
     * Gibt das Gewicht einer Zelle an der angegebenen Position zurück.
     *
     * @param position Die Position der Zelle.
     * @return Das Gewicht der Zelle.
     */
    public int get_cell_weight(Position position) {
        return this.grid[position.get_x()][position.get_y()].get_weight();
    } 

    /**
     * Gibt die Startposition des Rasters zurück.
     *
     * @return Die Startposition.
     */
    public Position get_start() {
        return this.start_pos;
    }

    /**
     * Gibt die Endposition des Rasters zurück.
     *
     * @return Die Endposition.
     */
    public Position get_end() {
        return this.end_pos;
    }

    /**
     * Zeigt das Raster an und zeichnet die Zellen.
     */
    public void show() {
        strokeWeight(this.stroke_weight);
        stroke(0, 0, 0);
        
        for (int row = 0; row < this.grid_width; row++) {
            for (int col = 0; col < this.grid_heigth; col++) { 
                int curr_pos_x = row * this.square_size;
                int curr_pos_y = col * this.square_size;
                
                int cell_weight = this.grid[row][col].get_weight();
                
                fill(this.get_cell_color(row, col)); 
                square(curr_pos_x, curr_pos_y, this.square_size);

                if (cell_weight > 1) {
                    fill(color_manager.get_color("weight"));
                    textSize(15);
                    text(cell_weight, curr_pos_x, curr_pos_y + this.square_size);
                }
            }
        }  
    }

    /**
     * Platziert eine Zelle durch einen Mausklick.
     */
    public void place_by_click() {
        int row = mouseX / this.square_size;
        int col = mouseY / this.square_size;
        
        if (this.out_of_bounds(row, col)) {
            return;    
        } 
        
        if (user.get_is_weight_setting()) {
            this.set_cell_weight(row, col, user.get_current_weight()); 
            redo_path();
        } else {
            this.set(row, col, new Cell(user.get_cell_selector()));
            
            if (user.get_cell_selector() == Cell_state.blocked) {
                if (mouseButton == RIGHT) {
                    user.set_cell_selector(Cell_state.empty); 
                    this.set(row, col, new Cell(user.get_cell_selector()));
                    
                    this.redo_path();
                }
                
                this.reconstruct_missing_fields(row, col);
            }
        }
    }

    /**
     * Setzt eine Zelle an der angegebenen Position.
     *
     * @param pos Die Position der Zelle.
     * @param new_cell Die neue Zelle.
     */
    public void set(Position pos, Cell new_cell) {
        this.set(pos.get_x(), pos.get_y(), new_cell); 
    }

    /**
     * Setzt eine Zelle an der angegebenen Position.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @param new_cell Die neue Zelle.
     */
    public void set(int row, int col, Cell new_cell) { 
        if (out_of_bounds(row, col))
            return;
        
        Cell_state current_cell_state = this.grid[row][col].cell_state;
        
        if (current_cell_state == Cell_state.start || current_cell_state == Cell_state.end)
            return;
        else if (new_cell.cell_state == Cell_state.start || new_cell.cell_state == Cell_state.end)
            this.update_start_or_end(row, col, new_cell);  
        else if (new_cell.cell_state == Cell_state.blocked && current_cell_state == Cell_state.path) {
            this.set_cell_state(row, col, new_cell.cell_state);
            this.redo_path();
        } else if (new_cell.cell_state == Cell_state.empty) {
            if (current_cell_state == Cell_state.blocked)
                this.redo_path();
            if (current_cell_state == Cell_state.visited || current_cell_state == Cell_state.path)
                return;
        }
        
        this.set_cell_weight(row, col, new_cell.get_weight());
        this.set_cell_state(row, col, new_cell.get_state());
    }

    /**
     * Löscht das Raster, optional auch blockierte und gewichtete Zellen.
     *
     * @param destroy_blocked Gibt an, ob blockierte Zellen gelöscht werden sollen.
     * @param destroy_weight Gibt an, ob gewichtete Zellen gelöscht werden sollen.
     */
    public void clear(boolean destroy_blocked, boolean destroy_weight) {
        for (int row = 0; row < this.grid_width; ++row) {
            for (int col = 0; col < this.grid_heigth; ++col) {
                if (this.get_cell_state(row, col) == Cell_state.start || this.get_cell_state(row, col) == Cell_state.end)
                    continue;
                
                if (!destroy_blocked && this.get_cell_state(row, col) == Cell_state.blocked)
                    continue;
                
                this.set_cell_state(row, col, Cell_state.empty); 
                
                if (destroy_weight)
                    this.set_cell_weight(row, col, 1);
            }
        }
    }

    /**
     * Rekonstruiert die fehlenden Felder zwischen den zuletzt platzierten Positionen.
     *
     * @param row Die aktuelle Zeile.
     * @param col Die aktuelle Spalte.
     */
    private void reconstruct_missing_fields(int row, int col) {
        int previousRow = pmouseX / this.square_size;
        int previousCol = pmouseY / this.square_size;
        
        // Berechnung der unmarkierten Felder zwischen den letzten platzierten Positionen
        float distance = dist(previousCol, previousRow, col, row); 
        
        for (int i = 0; i < distance; ++i) {
            this.set(int(lerp(previousRow, row, i / distance)), int(lerp(previousCol, col, i / distance)), new Cell(user.get_cell_selector())); // lerp gibt lineare Zwischenwerte aus
        }  
    }

    /**
     * Überprüft, ob die angegebene Position außerhalb des Rasters liegt.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @return True, wenn die Position außerhalb des Rasters liegt, sonst False.
     */
    private boolean out_of_bounds(int row, int col) {
        return row < 0 || row >= this.grid_width || col < 0 || col >= this.grid_heigth;
    }

    /**
     * Setzt das Gewicht einer Zelle an der angegebenen Position.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @param weight Das neue Gewicht der Zelle.
     */
    private void set_cell_weight(int row, int col, int weight) {
        this.grid[row][col].set_weight(weight);
    }

    /**
     * Setzt den Zustand einer Zelle an der angegebenen Position.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @param new_state Der neue Zustand der Zelle.
     */
    private void set_cell_state(int row, int col, Cell_state new_state) {
        this.grid[row][col].set_state(new_state);
    }

    /**
     * Aktualisiert den Pfad im Raster.
     */
    private void redo_path() {
        this.clear(false, false);
        find_path.get_shortest_path();
    }

    /**
     * Aktualisiert die Start- oder Endposition im Raster.
     *
     * @param row Die Zeile der Zelle.
     * @param col Die Spalte der Zelle.
     * @param new_cell Die neue Zelle.
     */
    private void update_start_or_end(int row, int col, Cell new_cell) {
        // Es kann nur einen Start- und Endpunkt geben
        Cell_state current_cell_state = new_cell.cell_state;
        
        if (current_cell_state == Cell_state.start) { 
            this.set_cell_state(this.start_pos.get_x(), this.start_pos.get_y(), Cell_state.empty);
            this.start_pos.set_x(row);
            this.start_pos.set_y(col);
        }
        
        if (current_cell_state == Cell_state.end) {
            this.set_cell_state(this.end_pos.get_x(), this.end_pos.get_y(), Cell_state.empty);
            this.end_pos.set_x(row);
            this.end_pos.set_y(col);
        }
        
        // Pathfinding neu starten, damit der Pfad dem verschobenen Start/Ende folgt
        redo_path();
    }
}
