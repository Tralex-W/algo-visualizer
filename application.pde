/**
 * Enum für die verschiedenen Zustände der Anwendung.
 */
public enum Application_state {
    path_visualizer,
    sort_visualizer,
    start_screen;
}

/**
 * Klasse zur Verwaltung des aktuellen Zustands der Anwendung.
 */
public class Application {
    private Application_state current_state;

    /**
     * Gibt den aktuellen Zustand der Anwendung zurück.
     * @return Der aktuelle Anwendungszustand.
     */
    public Application_state get_state() {
        return this.current_state;
    }

    /**
     * Setzt den neuen Zustand der Anwendung.
     * @param new_state Der neue Anwendungszustand.
     */
    public void set_state(Application_state new_state) {
        this.current_state = new_state;
    }
}
