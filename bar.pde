public class Bar {
    private int bar_height;
    private int bar_width;

    /**
     * Konstruktor für die Bar-Klasse.
     * Erstellt eine Bar mit einer zufälligen Höhe im angegebenen Bereich und einer festen Breite.
     * 
     * @param min_height Die minimale Höhe der Bar.
     * @param max_height Die maximale Höhe der Bar.
     * @param bar_width  Die Breite der Bar.
     */
    Bar(int min_height, int max_height, int bar_width) {
        Random random = new Random();
        int random_height = random.nextInt(max_height - min_height + 1) + min_height;
        this.bar_height = random_height;
        this.bar_width = bar_width;
    }

    /**
     * Setzt die Höhe der Bar auf einen neuen Wert.
     * 
     * @param new_bar_height Die neue Höhe der Bar.
     */
    public void set_bar_height(int new_bar_height) {
        this.bar_height = new_bar_height;
    }

    /**
     * Setzt die Breite der Bar auf einen neuen Wert.
     * 
     * @param new_bar_width Die neue Breite der Bar.
     */
    public void set_bar_width(int new_bar_width) {
        this.bar_width = new_bar_width;
    }

    /**
     * Gibt die Höhe der Bar zurück.
     * 
     * @return Die Höhe der Bar.
     */
    public int get_bar_height() {
        return this.bar_height;
    }

    /**
     * Gibt die Breite der Bar zurück.
     * 
     * @return Die Breite der Bar.
     */
    public int get_bar_width() {
        return this.bar_width;
    }
}
