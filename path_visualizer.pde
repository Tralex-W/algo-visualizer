/**
 * Klasse zur Visualisierung des Pfadfindungsalgorithmus.
 */
public class Path_visualizer {
  
  /**
   * Zeichnet die findungs Darstellung.
   */
  public void draw() {
    background(color_manager.get_color("background")); 
    grid.show(); 
    path_visualizer_ui.show(); 
  }
  
  
  public void mousePressed() {
    grid.place_by_click(); 
    path_visualizer_ui.place_by_click(); 
  }  

  public void mouseDragged() {
    grid.place_by_click();
    path_visualizer_ui.move_size_slider(); 
  }
 
  /**
   * Wird aufgerufen, wenn das Mausrad bewegt wird.
   * @param e Das Ereignis des Mausrads (um zu sehen wie sehr und in welche Richtung es gedreht wurde).
   */
  public void mouseWheel(MouseEvent e) {
     path_visualizer_ui.move_size_slider(e.getCount()); // Slider-Bewegung durch Mausrad bewegung.
  }
  
  void keyPressed() {
    // Buttons unterstreichen, wenn sie durch Klick bedient werden
    if (key == 'r') { // Simulation neu starten
      user.set_is_weight_setting(false);
      grid.redo_path();
    }
      
    if (keyCode == ' ') { // Bildschirm leeren
      user.set_is_weight_setting(false);
      grid.clear(true, true);
    }
      
    if (key == 'q') { // Startpunkt auswählen
      user.set_is_weight_setting(false);
      user.set_cell_selector(Cell_state.start);
    }
   
    if (key == 'w') { // Endpunkt auswählen
      user.set_is_weight_setting(false);
      user.set_cell_selector(Cell_state.end);
    }
    
    if (key == 'e') { // Blockierte Zelle auswählen
      user.set_is_weight_setting(false);    
      user.set_cell_selector(Cell_state.blocked);
    }
  
    if (key == 't') { // Gewicht eingeben
      user.set_weight_input_text("");
      user.set_is_weight_setting(true);
      user.set_ended_weight_setting(false);
    }
    
    else if (user.get_is_weight_setting() && !user.get_ended_weight_setting()) { // Nutzer gibt ein Gewicht ein
      if (keyCode == BACKSPACE && user.get_weight_input_text_length() > 0) {
        user.set_weight_input_text(user.get_weight_input_text().substring(0, user.get_weight_input_text_length() - 1)); // Den letzten Buchstaben entfernen
      }
      else if (keyCode == ENTER) {  // Eingabe abschließen
        user.set_current_weight(int(user.get_weight_input_text()));
        user.set_ended_weight_setting(true);
      }
      else if (key >= '0' && key <= '9') { // Eingabe
        user.add_weight_input_text(key);
      }
    }     
  }
}
