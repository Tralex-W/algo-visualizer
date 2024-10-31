/**
 * Eine Klasse, die einen Schieberegler darstellt.
 */
public class Slider {
  private Position line_start_pos; 
  private final int line_length = grid.get_left_space() - 10; 
  private final int line_thickness = 5; 
  
  private final int handle_width = 10; 
  private final int handle_height = 10; 
  private Button handle;
  
  /**
   * Konstruktor für den Schieberegler.
   */
  Slider(Position line_start_pos) {
    this.line_start_pos = line_start_pos;
    this.handle = new Button(this.line_start_pos.x + this.handle_width, this.line_start_pos.y - this.handle_height / 2, this.handle_width, this.handle_height, "", color_manager.get_color("handle"), 0, 0, true); 
  }
   
  /**
   * Zeigt den Schieberegler an.
   */
  public void show() {
    strokeWeight(this.line_thickness); 
    line(this.line_start_pos.x, this.line_start_pos.y, this.line_start_pos.x + this.line_length, this.line_start_pos.y);  
    this.handle.show(); 
  }
  
  /**
   * Bewegt den Schieberegler um eine bestimmte Verschiebung.
   * @param displacement Die Verschiebung.
   */
  public void move(int displacement) {
    this.handle.set_x(constrain(this.handle.get_x() + displacement, this.line_start_pos.x, this.line_start_pos.x + this.line_length - this.handle_width)); // Begrenzung, damit sich der Schieberegler nur innerhalb der Linie bewegen kann
     
    this.update_grid_size(); 
  } 
  
  /**
   * Bewegt den Schieberegler mit der Maus.
   */
  public void move(boolean change_grid_size) {
    this.handle.set_x(constrain(mouseX - this.handle_width / 2, this.line_start_pos.x, this.line_start_pos.x + this.line_length - this.handle_width)); // Begrenzung, damit sich der Schieberegler nur innerhalb der Linie bewegen kann
    
    if (change_grid_size)
      this.update_grid_size(); 
    else{ 
      user.set_current_weight((constrain(int((this.handle.get_x() - this.line_start_pos.x) / 5), 5, 40))); // Akutelle Gewichtung basieriend auf der Slider Entfernung setzten.
    }
      
  } 
  
  /**
   * Aktualisiert die Größe des Gitters basierend auf der Position des Schiebereglers.
   */
  private void update_grid_size() {
    grid.set_size(constrain(int((this.handle.get_x() - this.line_start_pos.x) / 1.8), 7, 99)); // Die Gittergröße basierend auf der Position des Schiebereglers aktualisieren
    grid.redo_path(); 
  }
}
