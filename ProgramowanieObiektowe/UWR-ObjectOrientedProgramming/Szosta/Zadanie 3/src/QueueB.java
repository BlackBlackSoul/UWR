import java.util.NoSuchElementException;

/**
 * Created by metUAN on 01.04.17.
 * GL&HF
 */

class Node<T>
{
    public T data;
    public Node<T> next;
    public Node(T data, Node<T> next)
    {
        this.data = data;
        this.next = next;
    }
}

public class QueueB<T> {
    private int size = 0;
    private int max_size;
    private Node<T> head;
    public QueueB(int s)
    {
        this.head = null;
        this.max_size = s;
    }
    public QueueB()
    {
        this.head = null;
    }
    public void add(T item)
    {
        if( head == null) {
            head = new Node<T>(item, null);
            size = 1;
        } else
        {
            Node<T> tmp = head;
            while(tmp.next != null) tmp = tmp.next;

            tmp.next = new Node<T>(item, null);
            size += 1;
        }
    }
    public T removeFirst()
    {
        if (head == null) return null;
        else {
            T tmp = showFirstElement();
            head = head.next;
            size = size - 1;
            return tmp;
        }
    }
    public boolean isEmpty()
    {
        return head == null;
    }
    public T showFirstElement()
    {
        if (head == null) {
            return null;
        }
        else return head.data;
    }
    public void clear()
    {
        head = null;
        size = 0;
    }
    public int getSize(){
        return size;
    }
    public void showUs() {
        Node<T> item = head;
        while (item != null) {
            System.out.println(item.data);
            item = item.next;
        }
    }
}
