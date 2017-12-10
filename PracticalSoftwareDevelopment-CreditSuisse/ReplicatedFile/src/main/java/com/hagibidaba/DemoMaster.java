package com.hagibidaba;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.RetryUntilElapsed;
import org.apache.zookeeper.CreateMode;

import java.util.List;
import java.util.Scanner;

public class DemoMaster {


    public String data;
    private CuratorFramework frameWorkClient;
    List<String> childrenNodes;

    public DemoMaster() throws Exception {
        frameWorkClient = CuratorFrameworkFactory.newClient("localhost:2181"
                ,new RetryUntilElapsed(500, 30)
        );
        frameWorkClient.start();
        if (frameWorkClient.checkExists().forPath("/WAL") == null) {
            frameWorkClient.create().withMode(CreateMode.PERSISTENT).forPath("/WAL");
        }
    }

    private List<String> getNodes() throws Exception {
        return frameWorkClient.getChildren().forPath("/WAL");
    }

    private boolean checkIfNodesExist() throws Exception {
        childrenNodes = getNodes();
        return childrenNodes.isEmpty();
    }

    private void readFromUserInput() {
        Scanner reader = new Scanner(System.in);  // Reading from System.in
        System.out.println("Enter a text: ");
        data = reader.nextLine();
    }

    private void sendDataToNodes() throws Exception {
        if (checkIfNodesExist()) {
            System.out.println("Cluster is not ready");
            Thread.sleep(5000);
            sendDataToNodes();
        } else {
            readFromUserInput();
            for (String nodes : childrenNodes) {
                String name = "/WAL/" + nodes + "/data-";
                frameWorkClient.create().withMode(CreateMode.PERSISTENT_SEQUENTIAL).forPath(name, data.getBytes());
            }
        }

    }

    public static void main(String... args) throws Exception {
        DemoMaster demoMaster = new DemoMaster();
        while (true) demoMaster.sendDataToNodes();
    }




}
