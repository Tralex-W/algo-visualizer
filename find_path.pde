/**
 * Klasse zur Pfadfindung.
 */
public class Find_path {
    private Position start_pos; 
    private Position end_pos; 

    /**
     * Konstruktor für die Pfadfindung.
     */
    Find_path() {
        this.start_pos = grid.get_start();
        this.end_pos = grid.get_end(); 
    }

    /**
     * Findet den kürzesten Pfad.
     */
    public void get_shortest_path() {
        HashMap<Position, Integer> distance = new HashMap<>(); // Kürzeste Distanz, um zu einer Position zu gelangen
        HashMap<Position, LinkedList<Position>> shortest_path_to_position = new HashMap<>(); // Der kürzeste Pfad zu einer Position
        Set<Position> shortest_path_known = new HashSet<>(); // Positionen, bei denen der kürzeste Weg bekannt ist
        Queue<Position> shortest_path_unknown = new PriorityQueue<>(Comparator.comparingInt(distance::get)); // Positionen, bei denen der kürzeste Weg unbekannt ist
        
        // Startposition initialisieren
        shortest_path_to_position.put(this.start_pos, new LinkedList<>(Arrays.asList(start_pos))); 
        distance.put(this.start_pos, 0);
        shortest_path_unknown.add(start_pos);
        
        // Um den kürzesten Pfad zu finden
        while (!shortest_path_unknown.isEmpty()) {
            Position current_position = shortest_path_unknown.poll(); // Aktuelle Position

            // Wenn der kürzeste Weg zum Endpunkt gefunden wurde oder alle Zellen überprüft wurden und der Endpunkt keine erreichbaren Nachbarn hat
            if (shortest_path_known.contains(end_pos) || (shortest_path_unknown.isEmpty() && current_position.equals(end_pos))) {
                this.show_path(shortest_path_to_position);
                return;
            }

            // Wenn die aktuelle Position bereits bekannt ist, überspringen
            if (shortest_path_known.contains(current_position))
                continue;

            // Nachbarn der aktuellen Position überprüfen
            for (Position adjacent : current_position.get_adjacent()) {
                if (!shortest_path_known.contains(adjacent) && grid.get_cell_state(adjacent) != Cell_state.blocked) {
                    // Distanz über die aktuelle Position zum Nachbarn berechnen
                    int new_adjacent_distance = grid.get_cell_weight(adjacent) + distance.get(current_position);

                    // Wenn die neue Distanz kürzer ist als die bisherige Distanz
                    if (new_adjacent_distance < distance.getOrDefault(adjacent, Integer.MAX_VALUE)) {
                        distance.put(adjacent, new_adjacent_distance); 

                        // Kürzesten Pfad zum Nachbarn aktualisieren
                        LinkedList<Position> shortest_path_to_adjacent = new LinkedList<>(shortest_path_to_position.get(current_position));
                        shortest_path_to_adjacent.add(adjacent); 
                        shortest_path_to_position.put(adjacent, shortest_path_to_adjacent);

                        shortest_path_unknown.add(adjacent); 
                    }
                }
            }
            
            // Aktuelle Position als bekannt markieren
            shortest_path_known.add(current_position);
            
            // Aktuelle Position als besucht markieren
            grid.set(current_position.get_x(), current_position.get_y(), new Cell(Cell_state.visited, grid.get_cell_weight(current_position)));
        }
    }

    /**
     * Zeigt den kürzesten Pfad an.
     * 
     * @param shortest_path_to_position Der kürzeste Pfad zu den Positionen.
     */
    private void show_path(HashMap<Position, LinkedList<Position>> shortest_path_to_position) {
        LinkedList<Position> shortest_path_to_end = shortest_path_to_position.get(this.end_pos); // Kürzester Pfad zum Endpunkt

        for (Position path_pos : shortest_path_to_end) {
            grid.set(path_pos, new Cell(Cell_state.path, grid.get_cell_weight(path_pos)));
        }
    }
}
