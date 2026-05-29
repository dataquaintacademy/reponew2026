public class InfiniteLoop {
    public static void main(String[] args) {
        while (true) {
            System.out.println("Running forever...");
            
            // Optional delay to slow down output
            try {
                Thread.sleep(1000); // 1 second
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
