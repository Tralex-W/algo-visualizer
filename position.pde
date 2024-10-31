/**
 * Eine Klasse, die eine Position darstellt.
 */
class Position {
  private int x; 
  private int y; 
  
  /**
   * Konstruktor für die Position.
   * @param x Die x-Koordinate.
   * @param y Die y-Koordinate.
   */
  Position(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  /**
   * Gibt die x-Koordinate zurück.
   * @return Die x-Koordinate.
   */
  public int get_x() {
    return this.x;
  }
  
  /**
   * Gibt die y-Koordinate zurück.
   * @return Die y-Koordinate.
   */
  public int get_y() {
    return this.y;
  }
  
  /**
   * Setzt die x-Koordinate.
   * @param x Die neue x-Koordinate.
   */
  public void set_x(int x) {
    this.x = x;
  }
  
  /**
   * Setzt die y-Koordinate.
   * @param y Die neue y-Koordinate.
   */
  public void set_y(int y) {
    this.y = y;
  }
  
  /**
   * Gibt die benachbarten Positionen zurück.
   * @return Eine ArrayList von benachbarten Positionen.
   */
  public ArrayList<Position> get_adjacent() {
    ArrayList<Position> positions = new ArrayList<>();
      
    // oben
    if (this.y - 1 >= 0)
      positions.add(new Position(this.x, this.y - 1));
      
    // unten
    if (this.y + 1 < grid.grid_heigth)
      positions.add(new Position(this.x, this.y + 1));
      
    // rechts
    if (this.x + 1 < grid.grid_width)
      positions.add(new Position(this.x + 1, this.y));
      
    // links
    if (this.x - 1 >= 0)
      positions.add(new Position(this.x - 1, this.y));
      
    return positions;
  }
  
  /**
   * Überschreibt die equals-Methode.
   * @param compare Das zu vergleichende Objekt.
   * @return true, wenn die Positionen gleich sind, ansonsten false.
   */
  @Override
  public boolean equals(Object compare) { 
    if (this == compare) 
      return true;
    
    Position compare_pos = (Position) compare;
    
    return this.x == compare_pos.x && this.y == compare_pos.y;
  }
    
  /**
   * Überschreibt die hashCode-Methode.
   * @return Der Hash-Wert der Position (ohne überschreibung wird das ganze Objekt gehashed).
   */
  @Override
  public int hashCode() {
    return Objects.hash(x, y);
  }
}
