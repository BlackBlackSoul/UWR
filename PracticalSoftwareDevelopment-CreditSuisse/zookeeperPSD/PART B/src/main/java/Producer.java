import org.apache.zookeeper.*;
import org.apache.zookeeper.Watcher.Event.KeeperState;
import org.apache.zookeeper.data.Stat;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.CountDownLatch;


public class Producer {

    private ZooKeeper zoo;
    private final CountDownLatch connectedSignal = new CountDownLatch(1);
    private final Timer t = new Timer();

    private final TimerTask task = new TimerTask() {
        @Override
        public void run() {
            try {
                String data = new Timestamp(System.currentTimeMillis()).toString();
                create(data.getBytes(), "/tasks/task");
                System.out.println("Created new node task with arbitrary data: " + data);
            } catch (KeeperException e) {
                System.out.println("Terminated because there isn't node!");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    };

    private void connect() throws IOException, InterruptedException, KeeperException {
        this.zoo = new ZooKeeper("localhost",5000,new Watcher() {
            public void process(WatchedEvent we) {
                if (we.getState() == KeeperState.SyncConnected) {
                    connectedSignal.countDown();
                }
            }
        });
        connectedSignal.await();
    }

    private void create(byte[] data, String path) throws KeeperException, InterruptedException {
        zoo.create(path, data, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL_SEQUENTIAL);
    }

    private void startProducer(final String path) {
        zoo.exists(path, new Watcher() {
            public void process(WatchedEvent watchedEvent) {
                if (watchedEvent.getType() != Event.EventType.NodeCreated) {
                    System.out.println("Cancelled");
                    t.cancel();
                }
                else {
                    startProducer(path);
                }
            }
        }, new AsyncCallback.StatCallback() {
            public void processResult(int i, String s, Object o, Stat stat) {
                if (stat != null) {
                    t.schedule(task, 0, 3000);
                    startProducer(path);
                }
                else {
                    System.out.println("else");
                }
            }
        }, null);
    }


    public static void main(String... args) throws Exception {
        final Producer producer = new Producer();
        producer.connect();
        producer.startProducer("/goAhead");
    }
}