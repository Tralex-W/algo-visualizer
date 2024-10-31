/**
 * 
 *Funktionalitäten zur Visualisierung von Sortieralgorithmen und ermöglicht es dem Benutzer, den Sortiervorgang zu steuern.
 */
public class Sort_visualizer {
    private boolean is_sorting = false; 
    private Sort_visualizer_ui sort_visualizer_ui = new Sort_visualizer_ui(); 
    private final int bar_width = 2; 
    private int algorithm = 0; // Ausgewählter Sortieralgorithmus (0 = BubbleSort, 1 = MergeSort)
    private final int number_of_algorithms = 2;
    private final int delay = 40; // Verzögerung zwischen Schritten im Sortiervorgang

    /**
     * 
     * Initialisiert den Visualisierer mit zufälligen Balken.
     */
    Sort_visualizer() {
        bars.generate_random(window_size / (bar_width + bars.get_bar_space()), 100, 600, bar_width);
    }

    /**
     * Zeichnet den Sortiervisualisierer.
     */
    public void draw() {
        background(color_manager.get_color("background"));

        if (is_sorting)
            sorter.sort_bars(this.algorithm);

        bars.show();
        sort_visualizer_ui.show();
        delay(this.delay);
    }


    public void mousePressed() {
        sort_visualizer_ui.change_sort_attributes();
    }

 //<>//
    /**
     * Ermöglicht es dem Benutzer, den Sortiervorgang mit Tastenkombinationen zu steuern.
     */
    void keyPressed() {
        if (key == '1') {
            this.set_is_sorting(true);
        } else if (key == '2') {
            this.reset();
        } else if (key == '3') {
            this.toggle_algorithm();
        }
    }
    
    /**
     * Erstellt erneute zufälllige Balken und setzt alle Attribute zurück.
     */
    public void reset(){
      this.is_sorting = false;
      bars.generate_random(window_size / (bar_width + bars.get_bar_space()), 100, 600, bar_width);
      sorter.reset_attributes();
    }
    
    /**
     * Switcht zwischen den Algorithmen.
     */
    public void toggle_algorithm(){
      this.algorithm = (this.algorithm + 1) % this.number_of_algorithms; 
    }

    /**
     * Gibt den aktuellen Sortierzustand zurück.
     * @return true, wenn das Sortieren aktiv ist, false sonst
     */
    public boolean get_is_sorting() {
        return this.is_sorting;
    }

    /**
     * Setzt den Sortierzustand.
     * @param new_sorting_state Der neue Sortierzustand, der gesetzt werden soll
     */
    public void set_is_sorting(boolean new_sorting_state) {
        this.is_sorting = new_sorting_state;
    }
}
