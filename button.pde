public class Button {
    private Position position; 
    private int button_width; 
    private int button_height; 
    private String text; 
    private color button_color; 
    private int text_space; // Abstand des Textes vom Button
    private int text_height; 
    private int stroke_weight = 1;
    private boolean text_in_button; // Gibt an, ob der Text im Button ist
    private int box_width; // Breite des Buttons + Text (Wenn dieser außerhalb vom Button ist, weicht er von button_widht ab)

    /**
     * Konstruktor für die Klasse Button.
     * 
     * @param x_position X-Position des Buttons
     * @param y_position Y-Position des Buttons
     * @param button_width Breite des Buttons
     * @param button_height Höhe des Buttons
     * @param text Text des Buttons
     * @param button_color Farbe des Buttons
     * @param text_space Abstand des Textes vom Button
     * @param text_height Höhe des Textes
     * @param text_in_button Gibt an, ob der Text im Button ist
     */
    Button(int x_position, int y_position, int button_width, int button_height, String text, color button_color, int text_space, int text_height, boolean text_in_button) {
        this.position = new Position(x_position, y_position);
        
        if (text_in_button)
          this.button_width = button_width;
        else
          this.button_width += int(textWidth(text)) + text_space;
          
        
        this.box_width = button_width;
        this.button_height = button_height;
        this.text = text;
        this.button_color = button_color;
        this.text_space = text_space;
        this.text_height = text_height;
        this.text_in_button = text_in_button;
    }

    /**
     * Zeigt den Button auf dem Bildschirm an.
     */
    public void show() {
        strokeWeight(1);
        if (path_visualizer_ui.get_line_pos() != null) { 
            line(path_visualizer_ui.get_line_pos().x, path_visualizer_ui.get_line_pos().y + 20 + 5, path_visualizer_ui.get_line_pos().x + this.button_width, path_visualizer_ui.get_line_pos().y + 20 + 5);
        }

        strokeWeight(1);
        if (this.button_color != -2) {
            fill(this.button_color);
            rect(this.position.get_x(), this.position.get_y(), this.box_width, this.button_height);
        }

        textSize(30);
        fill(255);
        if (!this.text_in_button)
            text(this.text, this.position.get_x() + this.box_width + this.text_space, this.position.get_y() + (this.button_height / 2) + (this.text_height / 2) - 2);
        else {
            text(this.text, this.position.get_x() + this.text_space, this.position.get_y() + (this.button_height / 2) + (this.text_height / 2) - 2);
            
        }  
    }

    /**
     * Überprüft, ob der Button geklickt wurde.
     * 
     * @return true, wenn der Button geklickt wurde, sonst false.
     */
    public boolean is_clicked() {
        return (mouseX >= this.position.get_x() && mouseX <= this.position.get_x() + this.button_width && mouseY >= this.position.get_y() && mouseY <= this.position.get_y() + this.button_height);
    }

    /**
     * Hebt den Button hervor und entfernt die Hervorhebung von allen anderen Buttons.
     */
    public void highlight() { // Highlightet einen Button und dehighlighted alle anderen
        stroke(color_manager.get_color("button_underline")); // Schwarzer Strich
        strokeWeight(this.stroke_weight);
        path_visualizer_ui.set_line_pos(new Position(this.position.get_x(), this.position.get_y()));
    }

    /**
     * Gibt den Text (Name) des Buttons zurück.
     * 
     * @return Der Text des Buttons.
     */
    public String get_name() {
        return this.text;
    }
    
    /**
     * Setzt den Text (Namen) des Buttons.
     * 
     * @param new_name der neue Name des Buttons.
     */
    public void set_name(String new_name){
      this.text = new_name;
    }

    /**
     * Setzt die X-Position des Buttons.
     * 
     * @param new_x_pos Die neue X-Position des Buttons.
     */
    public void set_x(int new_x_pos) {
        this.position.set_x(new_x_pos);
    }

    /**
     * Gibt die X-Position des Buttons zurück.
     * 
     * @return Die X-Position des Buttons.
     */
    public int get_x() {
        return this.position.get_x();
    }
}
