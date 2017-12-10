package com.hagibidaba;

import com.google.common.io.Files;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.api.CuratorWatcher;
import org.apache.curator.framework.recipes.leader.LeaderLatch;
import org.apache.curator.framework.recipes.leader.LeaderLatchListener;
import org.apache.curator.retry.RetryUntilElapsed;
import org.apache.zookeeper.AsyncCallback;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.data.Stat;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sasi on 11/18/2017.
 */
public class ShardServer {

    final private CuratorFramework frameWorkClient;

    final private LeaderLatch leaderLatch;

    private File replicatedFileToStoreData;

    final private String dataFile;

    final private String shardName;

    private Watcher newDataWatcher = new Watcher() {
        public void process(WatchedEvent watchedEvent) {
            if (watchedEvent.getType() == Watcher.Event.EventType.NodeChildrenChanged ||
                    watchedEvent.getType() == Watcher.Event.EventType.NodeDataChanged) {
                try {
                    replicateData();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else
            {
                System.out.println("nothing to do with - "+watchedEvent);
            }
        }
    };


    public ShardServer(String dataDirectory, String shardName) throws FileNotFoundException {
        System.out.println(shardName);
        dataFile = dataDirectory+shardName+".csv";
        replicatedFileToStoreData = new File(dataFile);
        this.shardName = shardName;
        frameWorkClient = CuratorFrameworkFactory.newClient("localhost:2181"
                ,new RetryUntilElapsed(500, 30)
        );
        frameWorkClient.start();
        leaderLatch = new LeaderLatch(frameWorkClient, "/leaderElection");
    }


    public void replicateData() throws Exception {
        final String shardPath = "/WAL/" + shardName;

        frameWorkClient.getZookeeperClient().getZooKeeper().getChildren(shardPath, newDataWatcher, new AsyncCallback.ChildrenCallback() {
                public void processResult(int i, String s, Object o, List<String> list) {
                    for (String childrenPath : list) {
                        String fullPathOfChildren = shardPath + "/" + childrenPath;

                        byte[] bytes = new byte[0];
                        try {
                            bytes = frameWorkClient.getData().forPath(fullPathOfChildren);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        String data = new String(bytes);
                        System.out.println(data);
                        BufferedWriter bw = null;

                        try {
                            // APPEND MODE SET HERE
                            bw = new BufferedWriter(new FileWriter(dataFile, true));
                            bw.write(data);
                            bw.newLine();
                            bw.flush();
                        } catch (IOException ioe) {
                            ioe.printStackTrace();
                        } finally {
                            if (bw != null) {
                                try {
                                    bw.close();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                        try {
                            frameWorkClient.delete().forPath(fullPathOfChildren);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }
                }
            },
            null);
    }

    private volatile boolean leadership;

    public void start() throws Exception
    {
        Stat pathExists = frameWorkClient.checkExists().forPath("/WAL/"+shardName);
        if (pathExists == null) {
            frameWorkClient.create().forPath("/WAL/"+shardName);
        }
        leaderLatch.addListener(getListener());
        leaderLatch.start();
        replicateData();

        while(true) {
            if(leadership) {
//                System.out.println("LEADER");
            }
            Thread.sleep(5000);
        }
    }

    private LeaderLatchListener getListener() {
        return new LeaderLatchListener() {
            public void isLeader() {
                leadership = true;
            }

            public void notLeader() {
                leadership = false;
            }
        };
    }

    public static void main(String arg[]) throws Exception {
        new ShardServer("C:\\Users\\rodzinsk\\Downloads\\ReplicatedFile\\ReplicatedFile\\src\\main\\resources\\", "two").start();
    }
}
