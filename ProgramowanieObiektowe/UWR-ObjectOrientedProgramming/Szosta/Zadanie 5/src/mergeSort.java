import java.util.Arrays;
/**
 * Created by metUAN on 01.04.17.
 * GL&HF
 */
public class mergeSort {
    public static void parallelMergeSort(int[] a) {
        int cores = 8;
        parallelMergeSort(a, cores);
    }

    public static void parallelMergeSort(int[] a, int threadCount) {
        if (threadCount <= 1) {
            mergeSort(a);
        } else if (a.length >= 2) {
            int[] left = Arrays.copyOfRange(a, 0, a.length / 2);
            int[] right = Arrays.copyOfRange(a, a.length / 2, a.length);
            Thread lThread = new Thread(new toSort(left, threadCount / 2));
            Thread rThread = new Thread(new toSort(right, threadCount / 2));
            lThread.start();
            rThread.start();
            try {
                lThread.join();
                rThread.join();
            } catch (InterruptedException ie) {
            }
            merge(left, right, a);
        }
    }

    public static void merge(int[] left, int[] right, int[] a) {
        int i1 = 0;
        int i2 = 0;
        for (int i = 0; i < a.length; i++) {
            if (i2 >= right.length || (i1 < left.length && left[i1] < right[i2])) {
                a[i] = left[i1];
                i1++;
            } else {
                a[i] = right[i2];
                i2++;
            }
        }
    }

    public static void mergeSort(int[] a) {
        if (a.length >= 2) {
            int[] left = Arrays.copyOfRange(a, 0, a.length / 2);
            int[] right = Arrays.copyOfRange(a, a.length / 2, a.length);
            mergeSort(left);
            mergeSort(right);
            merge(left, right, a);
        }
    }
}