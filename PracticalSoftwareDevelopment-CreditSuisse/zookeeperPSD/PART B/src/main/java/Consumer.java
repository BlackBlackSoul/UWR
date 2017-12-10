import org.apache.zookeeper.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Semaphore;

public class Consumer implements Watcher{

    private final ZooKeeper zoo;
    private final String path;
    private final Semaphore semaphore = new Semaphore(1);

    public static void main(String[] args) throws KeeperException, InterruptedException, IOException {
        ZooKeeper zk = connect();
        Consumer watcher = new Consumer(zk, "/tasks");
        watcher.watch();

    }

    static ZooKeeper connect() throws IOException, InterruptedException {
        final CountDownLatch connectedSignal = new CountDownLatch(1);
        ZooKeeper zk = new ZooKeeper("localhost", 5000, event -> {
            if (event.getState() == Watcher.Event.KeeperState.SyncConnected) {
                connectedSignal.countDown();
            }
        });
        connectedSignal.await();
        return zk;
    }

    private Consumer(ZooKeeper zoo, String path) throws InterruptedException, KeeperException {
        this.zoo = zoo;
        this.path = path;
        ensureLockPathExists(zoo, path);
    }

    private void watch() throws InterruptedException, KeeperException {
        semaphore.acquire();
        while (true) {
            List<String> children = zoo.getChildren(path, this);
            showChildren(children);
            semaphore.acquire();
        }
    }

    @Override
    public void process(WatchedEvent event) {
        if (event.getType() == Event.EventType.NodeChildrenChanged) {
            semaphore.release();
        }
    }
    private void ensureLockPathExists(ZooKeeper zk, String lockPath)
            throws InterruptedException, KeeperException {

        if (zk.exists(lockPath, false) == null) {
            zk.create(lockPath, null, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
        }
    }
    private void showChildren(List<String> children) {
        if (children.isEmpty()) {
            System.out.println("Node hasn't got any children.");
            return;
        }
        System.out.println("RECEIVED AT: " + new Timestamp(System.currentTimeMillis()));
        System.out.println("ALL CHILDREN: ");
        System.out.println("--------------------");
        for (String child : children) {
            System.out.println(child);
        }
        System.out.println("--------------------");
    }
    private static class ConnectToServer {

    }
}