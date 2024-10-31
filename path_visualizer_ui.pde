/**
 * Benutzeroberfläche für die Pfadvisualisierung.
 */
public class Path_visualizer_ui {
  private final int button_width = 20;
  private final int button_height = 20;
  private final int button_space = 50; // Abstand zwischen den Buttons
  private final int text_space = 10; // Abstand zwischen Button und Text
  private final int start_y_pos = 50;
  private ArrayList<Button> buttons = new ArrayList<Button>(); // Liste der Buttons
  private Slider size_slider; // Der Slider für die Einstellungen der Größe
  private Slider weight_slider; //Der Slider für die Einstellung der Gewichtung
  private Position line_pos; // Position der Linie für die visuelle Darstellung
  
  /**
   * Konstruktor für die Path_visualizer_ui Klasse.
   */
  Path_visualizer_ui() {
    this.size_slider = new Slider(new Position(window_size - grid.get_left_space(), window_size - 50)); 
    this.weight_slider = new Slider( new Position(window_size - grid.get_left_space(), window_size - 150));
    
    int pos_x = window_size - grid.left_space;
    int pos_y = this.start_y_pos;
    
    textSize(32);
    float text_height = textAscent(); // Höhe des Textes
    
    for (Cell_state state : Cell_state.values()) {
      // Buttons erstellen und der Liste hinzufügen
      this.buttons.add(new Button(pos_x, pos_y, this.button_width, this.button_height, state.name(), color_manager.get_state_color(state), this.text_space, int(text_height), false));
      pos_y += this.button_height + this.button_space;  
    }
    
    // Clear-Button 
    this.buttons.add(new Button(pos_x, pos_y, this.button_width, this.button_height, "clear", -2, this.text_space, int(text_height), false));
    pos_y += this.button_height + this.button_space; 
    
    // Redo-Button
    this.buttons.add(new Button(pos_x, pos_y, this.button_width, this.button_height, "redo", -2, this.text_space, int(text_height), false));
    pos_y += this.button_height + this.button_space; 
    
    // Weight-Button 
    this.buttons.add(new Button(pos_x, pos_y, this.button_width, this.button_height, "weight", -2, this.text_space, int(text_height), false));
  }
  
  /**
   * Setzt die Position der Linie für die visuelle Darstellung (Unterstrich = Linie).
   * @param new_line_pos Die neue Position der Linie.
   */
  public void set_line_pos(Position new_line_pos) {
    this.line_pos = new_line_pos;
  }
  
  /**
   * Gibt die Position der Linie zurück.
   * @return Die Position der Linie.
   */
  public Position get_line_pos() {
    return this.line_pos;
  }
  
  /**
   * Zeigt die Benutzeroberfläche an.
   */
  public void show() {
    for (Button button : this.buttons) {
      button.show(); 
    }
    size_slider.show(); 
    weight_slider.show();
    
    textSize(30);
    text("(" + String.valueOf(user.current_weight) + ")", window_size - 60, window_size-170);
  }
  
  /**
   * Bewegt den Slider basierend auf einer Verschiebung.
   * @param displacement Die Verschiebung.
   */
  public void move_size_slider(int displacement) {
    size_slider.move(displacement); 
  }
  
  /**
   * Bewegt den Slider.
   */
  public void move_size_slider() { 
    if (size_slider.handle.is_clicked()) {
      size_slider.move(true); 
    }
    else if (weight_slider.handle.is_clicked()){
      weight_slider.move(false);
    }
  }
  
  /**
   * Behandelt Mausklicks auf der UI.
   */
  public void place_by_click() {
    for (Button selection_button : this.buttons) { //<>//
      if (selection_button.is_clicked()) {
        switch(selection_button.get_name()) {
          case "start":
            selection_button.highlight();
            user.set_is_weight_setting(false);
            user.set_cell_selector(Cell_state.start); 
            break;
          case "end":
            selection_button.highlight();
            user.set_is_weight_setting(false);
            user.set_cell_selector(Cell_state.end); 
            break;
          case "blocked":
            selection_button.highlight();
            user.set_is_weight_setting(false);    
            user.set_cell_selector(Cell_state.blocked); 
            break;
          case "clear":
            selection_button.highlight();
            user.set_is_weight_setting(false);
            grid.clear(true, true); 
            break;
          case "redo":
            selection_button.highlight();
            user.set_is_weight_setting(false);
            grid.redo_path(); 
            break;  
          case "weight":
            selection_button.highlight();
            
            user.set_is_weight_setting(true);
            user.set_ended_weight_setting(false); 
              
            break;
         }
      }
    }
  } 
}
