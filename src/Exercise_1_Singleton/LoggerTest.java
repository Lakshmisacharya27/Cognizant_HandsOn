package Exercise_1_Singleton;

public class LoggerTest {

    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("Singleton Pattern Example");

        if (logger1 == logger2) {
            System.out.println("Both objects are the same.");
        } else {
            System.out.println("Objects are different.");
        }
    }
}