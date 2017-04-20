/**
 * Created by metUAN on 05.04.17.
 * GL&HF
 */
public class Tests {
    void ProducerAndConsumerTEST() {
        System.out.println("TESTY PRODUCENTA I KONSUMENTA");
        final ProducerAndConsumer pc = new ProducerAndConsumer();
        Thread t1 = new Thread(new Runnable() {
            public void run() {
                try {
                    pc.produce();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        Thread t2 = new Thread(new Runnable() {
            public void run() {
                try {
                    pc.consume();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    void BlockingFifoQueueTEST() {
        QueueB<Integer> Q1 = new QueueB<>();
        System.out.println("TESTY BUFORA");
        System.out.println("Czy kolejka jest pusta: "+ Q1.isEmpty());
        System.out.println("Pokaż elementy kolejki: ");Q1.showUs();
        System.out.println("Rozmiar kolejki to: " + Q1.getSize());
        System.out.print("Usuwam pierwszy element: ");System.out.println(Q1.removeFirst());
        System.out.println("Pierwszy element to: " + Q1.showFirstElement());
        Q1.add(5);
        Q1.add(12);
        Q1.add(13);
        System.out.println();
        System.out.println("Czy kolejka jest pusta: "+ Q1.isEmpty());
        System.out.println("Pokaż elementy kolejki: ");Q1.showUs();
        System.out.println("Rozmiar kolejki to: " + Q1.getSize());
        System.out.println("Pierwszy element to: " + Q1.showFirstElement());
        System.out.println();
        System.out.print("Usuwam pierwszy element: ");System.out.println(Q1.removeFirst());
        System.out.print("Usuwam pierwszy element: ");System.out.println(Q1.removeFirst());
        System.out.println("Rozmiar kolejki to: " + Q1.getSize());
        System.out.println();
        System.out.print("Usuwam pierwszy element: ");System.out.println(Q1.removeFirst());
        System.out.println("Czy kolejka jest pusta: "+ Q1.isEmpty());
        System.out.println("Pokaż elementy kolejki: ");Q1.showUs();
        System.out.println("Rozmiar kolejki to: " + Q1.getSize());
        System.out.println("Pierwszy element to: " + Q1.showFirstElement());
    }
}
