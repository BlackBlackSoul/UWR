import java.util.Scanner;
public class Main {

    public static void main(String[] args) throws InterruptedException {
        Scanner S = new Scanner(System.in);
        Tests T1 = new Tests();
        //FIFO BLOCKING QUEUE TEST
        T1.BlockingFifoQueueTEST();
        S.nextLine();
        //PRODUCER AND CONSUMER PROBLEM//
        T1.ProducerAndConsumerTEST();

        System.out.println("CONSUMER AND PRODUCER PROBLEM: ");
    }
}