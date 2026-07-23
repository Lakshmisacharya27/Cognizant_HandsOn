package Exercise_4_FinancialForecasting;

public class ForecastTest {

    public static void main(String[] args) {

        double amount = 10000;
        double rate = 0.10;
        int years = 5;

        double future = FinancialForecast.futureValue(amount, rate, years);

        System.out.println("Future Value = " + future);

        System.out.println("\nTime Complexity:");
        System.out.println("Recursive Solution : O(n)");
        System.out.println("Optimization: Dynamic Programming / Memoization");
    }
}