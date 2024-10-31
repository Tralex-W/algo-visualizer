/**
 * Die Klasse Start_screen repräsentiert den Startbildschirm der Anwendung.
 * Sie enthält Knöpfe zur Auswahl zwischen dem Pfadvisualisierer und dem Sortiervisualisierer.
 */
public class Start_screen {
    private final int button_space = 50; // Abstand zwischen den Knöpfen
    private final int text_space = 10; // Abstand zwischen Text und Rahmen der Knöpfe
    private ArrayList<Button> buttons = new ArrayList<Button>(); 

    /**
     * Konstruiert ein neues Start_screen-Objekt und erstellt die Knöpfe.
     */
    Start_screen() {
        int pos_x = window_size / 2;
        int pos_y = window_size / 2;

        for (Application_state state : Application_state.values()) {
            if (state != Application_state.start_screen) {
                textSize(32);

                String text = state.name();
                int text_width = int(textWidth(text));
                int text_height = int(textAscent()); // Abstand der Basislinie des Textes zum höchsten Buchstaben

                int button_width = text_width + this.text_space;
                int button_heigth = text_height + this.text_space;

                pos_x -= button_width;

                this.buttons.add(new Button(pos_x, pos_y, button_width, button_heigth, text, color_manager.get_color("controll_button"), this.text_space, text_height, true));
                pos_x += 2 * button_width + this.button_space;
            }
        }
    }

    /**
     * Zeigt die Knöpfe des Startbildschirms an.
     */
    public void draw() {
        for (Button button : this.buttons) {
            button.show();
        }
    }

    /**
     * Überprüft, ob ein Knopf angeklickt wurde, und Wechselt zwischen den Anwendungen.
     */
    public void mousePressed() {
        for (Button selection_button : this.buttons) {
            if (selection_button.is_clicked()) {
                switch (selection_button.get_name()) {
                    case "path_visualizer":
                        background(color_manager.get_color("background"));
                        application.set_state(Application_state.path_visualizer);
                        break;
                    case "sort_visualizer":
                        background(color_manager.get_color("background"));
                        application.set_state(Application_state.sort_visualizer);
                        break;
                }
            }
        }
    }

    /**
     * Wechselt zwischen den Anwendungen.
     */
    void keyPressed() {
        if (key == '1') {
            application.set_state(Application_state.path_visualizer);
            background(color_manager.get_color("background"));
        } else if (key == '2') {
            application.set_state(Application_state.sort_visualizer);
            background(color_manager.get_color("background"));
        }
    }
}
