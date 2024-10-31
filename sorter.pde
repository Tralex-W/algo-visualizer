/**
 * Die Klasse Sorter implementiert Sortieralgorithmen für eine Liste von Bars.
 */
public class Sorter {
    private ArrayList<Bar> bar_array; 
    private int size; // Größe der Liste
    private boolean desending = false; 

    // für den Bubble Sort:
    private int sort_loop_run = 0;

    // für den Merge Sort:
    private int current_sub_array_size = 1; 
    private int current_left_index = 0;

    /**
     * Konstruktor der Sorter-Klasse.
     * Initialisiert die Liste der Bars und deren Größe.
     */
    Sorter() {
        this.bar_array = bars.get_bars();
        this.size = this.bar_array.size();
    }

    /**
     * Sortiert die Bars anhand des angegebenen Algorithmus.
     *
     * @param algorithm Der Sortieralgorithmus (0 = Bubble Sort, 1 = Merge Sort).
     */
    public void sort_bars(int algorithm) {
        if (algorithm == 0)
            this.bubble_sort();
        else if (algorithm == 1)
            this.merge_sort();
    }

    /**
     * Führt den Merge Sort Algorithmus aus.
     */
    public void merge_sort() {
        if (current_sub_array_size <= size - 1) {
            if (current_left_index < size - 1) {
                int middle_index = Math.min(current_left_index + current_sub_array_size - 1, size - 1);
                int right_index = Math.min(current_left_index + 2 * current_sub_array_size - 1, size - 1);

                merge(current_left_index, middle_index, right_index);

                current_left_index += 2 * current_sub_array_size;
            } else {
                current_left_index = 0;
                current_sub_array_size *= 2;
            }
        } else 
            sort_visualizer.set_is_sorting(false);
    }

    /**
     * Hilfsmethode, um zwei Teilarrays zu einem sortierten Array zusammenzuführen.
     *
     * @param left_index Startindex des linken Teilarrays.
     * @param middle_index Endindex des linken Teilarrays und Startindex des rechten Teilarrays.
     * @param right_index Endindex des rechten Teilarrays.
     */
    private void merge(int left_index, int middle_index, int right_index) {
        int left_size = middle_index - left_index + 1;
        int right_size = right_index - middle_index;

        ArrayList<Bar> left_part = new ArrayList<>(left_size);
        ArrayList<Bar> right_part = new ArrayList<>(right_size);

        for (int left_pointer = 0; left_pointer < left_size; left_pointer++) 
            left_part.add(bar_array.get(left_index + left_pointer));
        
        for (int right_pointer = 0; right_pointer < right_size; right_pointer++) 
            right_part.add(bar_array.get(middle_index + 1 + right_pointer));

        int left_pointer = 0, right_pointer = 0, merged_index = left_index;

        while (left_pointer < left_size && right_pointer < right_size) {
            if ((this.desending && left_part.get(left_pointer).get_bar_height() >= right_part.get(right_pointer).get_bar_height()) || (!this.desending && left_part.get(left_pointer).get_bar_height() <= right_part.get(right_pointer).get_bar_height())) {
                bar_array.set(merged_index, left_part.get(left_pointer));
                left_pointer++;
            } else {
                bar_array.set(merged_index, right_part.get(right_pointer));
                right_pointer++;
            }
            merged_index++;
        }

        while (left_pointer < left_size) {
            bar_array.set(merged_index, left_part.get(left_pointer));
            left_pointer++;
            merged_index++;
        }

        while (right_pointer < right_size) {
            bar_array.set(merged_index, right_part.get(right_pointer));
            right_pointer++;
            merged_index++;
        }
    }

    /**
     * Führt den Bubble Sort Algorithmus aus.
     */
    private void bubble_sort() {    
        for (int j = this.sort_loop_run + 1; j < this.size; ++j) {
            if ((this.desending && this.bar_array.get(this.sort_loop_run).get_bar_height() < this.bar_array.get(j).get_bar_height()) || (!this.desending && this.bar_array.get(this.sort_loop_run).get_bar_height() > this.bar_array.get(j).get_bar_height())) {
                Bar temp = this.bar_array.get(this.sort_loop_run);
                this.bar_array.set(this.sort_loop_run, this.bar_array.get(j));
                this.bar_array.set(j, temp);
            }
        }
    
        if (this.sort_loop_run == this.size - 1) // Sortierung abgeschlossen
            sort_visualizer.set_is_sorting(false);
    
        ++this.sort_loop_run;
    }

    /**
     * Wechselt die Sortierrichtung zwischen aufsteigend und absteigend.
     */
    public void toggle_direction() {
        this.desending = !this.desending;
    }

    /**
     * Setzt die Attribute für die Sortieralgorithmen zurück.
     */
    public void reset_attributes() {
        this.sort_loop_run = 0;
        this.current_sub_array_size = 1; 
        this.current_left_index = 0;
    }
}
