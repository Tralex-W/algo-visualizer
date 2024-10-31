/**
 * Klasse, die die Farbverwaltung übernimmt.
 */
class Color_manager {

    /**
     * Gibt die Farbe basierend auf dem Namen zurück.
     * 
     * @param name Der Name der Farbe.
     * @return Die entsprechende Farbe.
     */
    public color get_color(String name) {
        if (name == "background") {
            return color(#DDDEC5); 
        } else if (name == "bar") {
            return color(#70ADE8); 
        } else if (name == "handle") {
            return color(#3B3B3B); 
        } else if (name == "button_underline") {
            return color(0); 
        } else if (name == "go_back_button"){
          return color(#790507);
        } else if (name == "controll_button"){
          return color(#13155F);
        } else if (name == "weight"){
          return color(255, 0, 0); 
        }

        return color(255); // Standardfarbe = Weiß
    }

    /**
     * Gibt die Farbe basierend auf dem Zustand einer Zelle zurück.
     * 
     * @param cell_state Der Zustand der Zelle.
     * @return Die entsprechende Farbe.
     */
    public color get_state_color(Cell_state cell_state) {
        if (cell_state == Cell_state.blocked) {
            return color(0); 
        } else if (cell_state == Cell_state.start) {
            return color(0, 255, 0); 
        } else if (cell_state == Cell_state.end) {
            return color(255, 0, 0); 
        } else if (cell_state == Cell_state.visited) {
            return color(209, 209, 209); 
        } else if (cell_state == Cell_state.path) {
            return color(32, 189, 227); 
        }

        return color(255); // Leere Zelle = Weiß
    }
}
