/**
 * Created by metUAN on 02.04.17.
 * GL&HF
 */
public class toSort implements Runnable {
    private int[] a;
    private int threadCount;

    public toSort(int[] a, int threadCount) {
        this.a = a;
        this.threadCount = threadCount;
    }

    public void run() {
        mergeSort.parallelMergeSort(a, threadCount);
    }
}
