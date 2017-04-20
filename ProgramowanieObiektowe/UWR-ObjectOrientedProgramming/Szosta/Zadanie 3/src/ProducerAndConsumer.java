/**
 * Created by metUAN on 01.04.17.
 * GL&HF
 */
public class ProducerAndConsumer {
    QueueB<String> list = new QueueB<>();
    int capacity = 5;
    String[] alfabet = {"raz", "dwa", "trzy", "cztery", "pięć", "sześć", "siedem", "osiem", "dziewięć", "dziesięc"};

    public void produce() throws InterruptedException
    {
        int i = 0;
        while (true) {
                java.util.Random random = new java.util.Random();
                int random_computer_card = random.nextInt(alfabet.length);
                String val = alfabet[random_computer_card];
                synchronized (this) {
                    while (list.getSize() != 0) {
                        this.wait();
                    }
                    System.out.println("Producer produced -> "
                            + val + ". It was his " + i + " step.");
                    list.add(val);
                    notify();
                    i++;
                    Thread.sleep(850);
                }
            }
    }
    public void consume() throws InterruptedException
    {
        int i = 0;
        while (true)
        {
            synchronized (this)
            {
                while (list.getSize()==0) {
                    this.wait();
                }
                String val = list.removeFirst();
                System.out.println("Consumer consumed -> "
                        + val + ". It was his: " + i + " step.");
                System.out.println();
                notify();
                i++;
                Thread.sleep(850);
            }
        }
    }
}
