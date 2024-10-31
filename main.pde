/** Algorithmusvisualisierung zur Veranschaulichung von Sortier-, sowie Pfadfindungsalgorithmen //<>//
  * Von Eric Wramling
  * Datum 6.6.2024
  * Ziel der Applikation: Häufig verwendete Algorithmen besser interaktiv verstehen und diese visuell ausprobieren.
*/


import java.util.*;


Grid grid;
Find_path find_path;
User user;
Path_visualizer_ui path_visualizer_ui;
Color_manager color_manager;
Path_visualizer path_visualizer;
Sort_visualizer sort_visualizer;
Start_screen start_screen;
Sorter sorter;
Bars bars;
Button go_back_button;

int window_size;
Application application; // Welches Programm angezeigt wird

/**
 * Setzt die Fenstergröße für die Anwendung.
 */
void settings() {
    window_size = 800;
    size(window_size, window_size);
}

/**
 * Initialisiert die notwendigen Komponenten für die Anwendung.
 */
void setup() {
    frameRate(100);
    color_manager = new Color_manager();
    
    grid = new Grid();
    find_path = new Find_path();
    user = new User();
    path_visualizer_ui = new Path_visualizer_ui();
    
    bars = new Bars();
    sort_visualizer = new Sort_visualizer();
    sorter = new Sorter();
    
    path_visualizer = new Path_visualizer();
    start_screen = new Start_screen();
    
    application = new Application();
    
    go_back_button = new Button(0, window_size-20, 20, 35, "X", color_manager.get_color("go_back_button"), 0, 10, true); //(int x_position, int y_position, int button_width, int button_height, String text, color button_color, int text_space, int text_height, boolean text_in_button) {
    
    background(color_manager.get_color("background"));
    application.set_state(Application_state.start_screen); 
}

/**
 * Bestimmt, welcher Anwendungszustand gezeichnet wird.
 */
void draw() {
  
    if (application.get_state() == Application_state.path_visualizer)
        path_visualizer.draw();
    else if (application.get_state() == Application_state.sort_visualizer)
        sort_visualizer.draw();
    else if (application.get_state() == Application_state.start_screen)
        start_screen.draw();
   
   go_back_button.show();
}

/**
 * Verarbeitet Mausdruckereignisse basierend auf dem aktuellen Anwendungszustand und leitet diese weiter.
 */
void mousePressed() {
    if (application.get_state() == Application_state.path_visualizer)
        path_visualizer.mousePressed();
    else if (application.get_state() == Application_state.sort_visualizer)
        sort_visualizer.mousePressed();
    else if (application.get_state() == Application_state.start_screen)
        start_screen.mousePressed();
        
      
   if (go_back_button.is_clicked()){
     application.set_state(Application_state.start_screen);
     path_visualizer_ui.set_line_pos(new Position(Integer.MIN_VALUE,Integer.MIN_VALUE)); //damit die Linie nicht angezeigt wird, wenn man das fenster wechselt
   }
}

/**
 * Verarbeitet Mausrad-Ereignisse für den Pfad-Visualizer.
 * @param e Instanz von MouseEvent
 */
void mouseWheel(MouseEvent e) {
    if (application.get_state() == Application_state.path_visualizer)
        path_visualizer.mouseWheel(e);
}

/**
 * Verarbeitet Mauszieh-Ereignisse für den Pfad-Visualizer.
 */
void mouseDragged() {
    if (application.get_state() == Application_state.path_visualizer)
        path_visualizer.mouseDragged();
}

/**
 * Verarbeitet Tastendruckereignisse zum Wechseln der Zustände oder zur Interaktion mit dem aktuellen Anwendungszustand.
 */
void keyPressed() {
    if (keyCode == BACKSPACE) { // Zurück zum Startbildschirm
        application.set_state(Application_state.start_screen);
        path_visualizer_ui.set_line_pos(new Position(Integer.MIN_VALUE,Integer.MIN_VALUE)); //damit die Linie nicht angezeigt wird, wenn man das fenster wechselt
    }
  
    if (application.get_state() == Application_state.path_visualizer)
        path_visualizer.keyPressed();
    else if (application.get_state() == Application_state.sort_visualizer)
        sort_visualizer.keyPressed();
    else if (application.get_state() == Application_state.start_screen)
        start_screen.keyPressed();
}
