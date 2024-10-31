/**
 * Enum für den Zustand einer Zelle.
 */
public enum Cell_state {
    empty, // Leere Zelle
    blocked, // Blockierte Zelle
    visited, // Besuchte Zelle
    path, // Teil des Pfades
    start, // Startzelle
    end // Endzelle
}

/**
 * Klasse, die eine Zelle repräsentiert, die im Pfadfindungsalgorithmus verwendet wird.
 */
class Cell implements Comparable<Cell> {
    private Cell_state cell_state; // Zustand der Zelle
    private int weight; // Gewicht der Zelle

    /**
     * Konstruktor, der eine leere Zelle mit einem bestimmten Gewicht erstellt.
     * 
     * @param weight Das Gewicht der Zelle.
     */
    Cell(int weight) {
        this.cell_state = Cell_state.empty;
        this.weight = weight;
    }

    /**
     * Konstruktor, der eine Zelle mit einem bestimmten Zustand erstellt.
     * 
     * @param cell_state Der Zustand der Zelle.
     */
    Cell(Cell_state cell_state) {
        this.cell_state = cell_state;
        this.weight = 1;
    }

    /**
     * Konstruktor, der eine Zelle mit einem bestimmten Zustand und Gewicht erstellt.
     * 
     * @param cell_state Der Zustand der Zelle.
     * @param weight Das Gewicht der Zelle.
     */
    Cell(Cell_state cell_state, int weight) {
        this.cell_state = cell_state;
        this.weight = weight;
    }

    /**
     * Setzt das Gewicht der Zelle.
     * 
     * @param weight Das neue Gewicht der Zelle.
     */
    public void set_weight(int weight) {
        this.weight = weight;
    }

    /**
     * Setzt den Zustand der Zelle.
     * 
     * @param new_state Der neue Zustand der Zelle.
     */
    public void set_state(Cell_state new_state) {
        this.cell_state = new_state;
    }

    /**
     * Gibt den Zustand der Zelle zurück.
     * 
     * @return Der Zustand der Zelle.
     */
    public Cell_state get_state() {
        return this.cell_state;
    }

    /**
     * Gibt das Gewicht der Zelle zurück.
     * 
     * @return Das Gewicht der Zelle.
     */
    public int get_weight() {
        return this.weight;
    }

    /**
     * Gibt die Farbe der Zelle basierend auf ihrem Zustand zurück.
     * 
     * @return Die Farbe der Zelle.
     */
    public color get_color() {
        Cell_state cell_state = this.get_state();
        return color_manager.get_state_color(cell_state);
    }

    /**
     * Vergleicht diese Zelle mit einer anderen basierend auf ihrem Gewicht.
     * 
     * @param compare_cell Die Zelle, mit der verglichen wird.
     * @return Ein negativer Wert, null oder ein positiver Wert, wenn das Gewicht dieser Zelle kleiner, gleich oder größer als das Gewicht der anderen Zelle ist.
     */
    @Override
    public int compareTo(Cell compare_cell) {
        return Integer.compare(this.weight, compare_cell.get_weight());
    }
}
