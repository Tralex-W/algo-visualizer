public class Sort_visualizer_ui {
    private final int base_button_width = 20; // Breite der Schaltflächen
    private final int button_height = 50; // Höhe der Schaltflächen
    private final int button_space = 50; // Abstand zwischen den Schaltflächen
    private final int start_y_pos = window_size - 50; // Startposition der ersten Schaltfläche
    private ArrayList<Button> buttons = new ArrayList<Button>(); // Liste der Schaltflächen

    /**
     * Konstruiert ein neues Sort_visualizer_ui-Objekt und initialisiert die Schaltflächen.
     */
    Sort_visualizer_ui() {
        int pos_x = 100; 

    
        // Start
        String button_text = "Start";
        int button_width =  this.base_button_width + (int) textWidth(button_text);
        
        buttons.add(new Button(pos_x, start_y_pos, button_width, button_height, button_text, color_manager.get_color("controll_button"),  10, (int) textAscent(), true));
        pos_x += button_width + button_space;
    
        // Reset
        button_text = "Reset";
        button_width =  this.base_button_width + (int) textWidth(button_text);
        
        buttons.add(new Button(pos_x, start_y_pos, button_width, button_height, button_text, color_manager.get_color("controll_button"),  10, (int) textAscent(), true));
        pos_x += button_width + button_space;
        
        // Richtung
        button_text = "Ascending";
        button_width = this.base_button_width + (int) textWidth(button_text);
        
        buttons.add(new Button(pos_x, start_y_pos, button_width, button_height, button_text, color_manager.get_color("controll_button"), 10, (int) textAscent(), true));
        pos_x += button_width + button_space;
        
         // Algorithmus
        button_text = "Bubble Sort";
        button_width =  this.base_button_width + (int) textWidth(button_text);
        
        buttons.add(new Button(pos_x, start_y_pos, button_width, button_height, button_text, color_manager.get_color("controll_button"),  10, (int) textAscent(), true));

    
    }

    /**
     * Ermöglicht Interaktion mit den Buttons. 
     */
    public void change_sort_attributes(){
      for (Button button : this.buttons) {
        if (button.is_clicked()) {
          switch(button.get_name()) {
            case "Start":
              if (sort_visualizer.get_is_sorting())
                sort_visualizer.set_is_sorting(false);
              else
                sort_visualizer.set_is_sorting(true);
              break;
            case "Bubble Sort":
              button.set_name("Merge Sort");
              sort_visualizer.toggle_algorithm();
              break;
            case "Merge Sort":
              button.set_name("Bubble Sort");
              sort_visualizer.toggle_algorithm();
              break;
            case "Reset":
              sort_visualizer.reset();
              break;
            case "Ascending":
              button.set_name("Descending");
              //sort_visualizer.reset();
              sorter.toggle_direction();
              break;
            case "Descending":
              button.set_name("Ascending");
              //sort_visualizer.reset();
              sorter.toggle_direction();
              break;
             }
          }
        }
      }
     
   /**
    * Zeigt die UI an, indem alle Schaltflächen gezeichnet werden.
   */
    public void show() {
        for (Button button : buttons) {
            button.show();
        }
    }
}
