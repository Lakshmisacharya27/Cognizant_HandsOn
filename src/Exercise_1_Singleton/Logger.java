package Exercise_1_Singleton;

public class Logger {

    // Create a single object
    private static Logger instance;

    // Private constructor
    private Logger() {
    }

    // Method to return the same object
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    // Method to display a message
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}