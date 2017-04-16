import java.util.Random;

public class Main {

    public static void main(String[] args) {
        Random rnd = new Random();
        int[] toMergeSort = new int[1000];
        for (int i = 0; i < 1000; i++) {
            toMergeSort[i] = rnd.nextInt(1000);
        }
        int[] toMergeSort1 = new int[1000];
        for (int i = 0; i < 1000; i++) {
            toMergeSort1[i] = rnd.nextInt(1000);
        }
        mergeSort sort1 = new mergeSort();
        mergeSort sort = new mergeSort();
        long startTime = System.nanoTime();
        sort.parallelMergeSort(toMergeSort, 4);
        long endTime = System.nanoTime();
        System.out.println("Time of execution MergeSort with threads (random integers included): " + ((double)endTime - startTime)/1000000000.0);
        long startTime1 = System.nanoTime();
        sort1.parallelMergeSort(toMergeSort1, 1);
        long endTime1 = System.nanoTime();
        System.out.println("Time of execution MergeSort without threads (random integers included): " + ((double)endTime1 - startTime1)/1000000000.0);
    }

}
