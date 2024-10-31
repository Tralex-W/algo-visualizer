public class Bars {
    private ArrayList<Bar> bars = new ArrayList<>();
    private final int bar_space = 0;
    private final int start_x_pos = 0;
    private final int start_y_pos = 0;
    private final int bar_thickness = 1;

    /**
     * Generiert eine Liste von Bars mit zufälliger Höhe im angegebenen Bereich und fester Breite.
     * 
     * @param number_of_bars Die Anzahl der zu generierenden Bars.
     * @param min_height Die minimale Höhe der Bars.
     * @param max_height Die maximale Höhe der Bars.
     * @param bar_width  Die Breite der Bars.
     * @return Eine Liste von generierten Bars.
     */
    public ArrayList<Bar> generate_random(int number_of_bars, int min_height, int max_height, int bar_width) {
        this.bars.clear();

        for (int i = 0; i < number_of_bars; ++i) {
            this.bars.add(new Bar(min_height, max_height, bar_width));
        }

        return this.bars;
    }

    /**
     * Gibt den Abstand zwischen den Bars zurück.
     * 
     * @return Der Abstand zwischen den Bars.
     */
    private int get_bar_space() {
        return bar_space;
    }

    /**
     * Gibt die Liste der Bars zurück.
     * 
     * @return Die Liste der Bars.
     */
    public ArrayList<Bar> get_bars() {
        return this.bars;
    }

    /**
     * Zeigt die Bars auf dem Bildschirm an.
     * Zeichnet jede Bar als Rechteck mit der festgelegten Breite und Höhe an der entsprechenden Position.
     */
    public void show() {
        strokeWeight(this.bar_thickness);
        int pos_x = this.start_x_pos;

        for (int i = 0; i < bars.size(); ++i) {
            fill(color_manager.get_color("bar"));
            rect(pos_x, this.start_y_pos, bars.get(i).get_bar_width(), bars.get(i).get_bar_height());
            pos_x += bars.get(i).get_bar_width() + this.bar_space;
        }
    }
}
