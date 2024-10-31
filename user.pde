/**
 * Sie speichert den aktuellen Zustand des Benutzers, einschließlich der Auswahl des Zelltyp und der Eingabe von Gewichtungen für Zellen
 */
public class User {
    private Cell_state cell_selector; // Der ausgewählte Zelltyp (Start, Ende, Blockiert)
    private String weight_input_text; 
    private int current_weight; 
    private boolean is_weight_setting; // ob der Benutzer gerade das Gewicht für Zellen einstellt
    private boolean ended_weight_setting; //  ob der Benutzer die Gewichteinstellung abgeschlossen hat

    /**
     * Konstruiert ein neues User-Objekt mit Standardwerten.
     */
    User() {
        this.cell_selector = Cell_state.start;
        this.weight_input_text = "";
        this.current_weight = 5;
        this.is_weight_setting = false;
        this.ended_weight_setting = false;
    }


    /**
     * Gibt den ausgewählten Zelltyp des Benutzers zurück.
     */
    public Cell_state get_cell_selector() {
        return this.cell_selector;
    }

    /**
     * Gibt den eingegebenen Text für das Zellgewicht des Benutzers zurück.
     */
    public String get_weight_input_text() {
        return this.weight_input_text;
    }

    /**
     * Gibt die Länge des eingegebenen Texts für das Zellgewicht des Benutzers zurück.
     */
    public int get_weight_input_text_length() {
        return this.weight_input_text.length();
    }

    /**
     * Fügt dem eingegebenen Text für das Zellgewicht des Benutzers einen neuen Buchstaben hinzu.
     */
    public void add_weight_input_text(char add) {
        this.weight_input_text += add;
    }

    /**
     * Gibt das aktuelle Gewicht für Zellen des Benutzers zurück.
     */
    public int get_current_weight() {
        return this.current_weight;
    }

    /**
     * Gibt zurück, ob der Benutzer gerade das Gewicht für Zellen einstellt.
     */
    public boolean get_is_weight_setting() {
        return this.is_weight_setting;
    }

    /**
     * Gibt zurück, ob der Benutzer die Gewichteinstellung abgeschlossen hat.
     */
    public boolean get_ended_weight_setting() {
        return this.ended_weight_setting;
    }

    /**
     * Legt den ausgewählten Zelltyp des Benutzers fest.
     */
    public void set_cell_selector(Cell_state new_state) {
        this.cell_selector = new_state;
    }

    /**
     * Legt den eingegebenen Text für das Zellgewicht des Benutzers fest.
     */
    public void set_weight_input_text(String new_input_text) {
        this.weight_input_text = new_input_text;
    }

    /**
     * Legt das aktuelle Gewicht für Zellen des Benutzers fest.
     */
    public void set_current_weight(int new_weight) {
        this.current_weight = new_weight;
    }

    /**
     * Legt fest, ob der Benutzer gerade das Gewicht für Zellen einstellt.
     */
    public void set_is_weight_setting(boolean new_weight_setting) {
        this.is_weight_setting = new_weight_setting;
    }

    /**
     * Legt fest, ob der Benutzer die Gewichteinstellung abgeschlossen hat.
     */
    public void set_ended_weight_setting(boolean new_ended_setting) {
        this.ended_weight_setting = new_ended_setting;
    }
}
