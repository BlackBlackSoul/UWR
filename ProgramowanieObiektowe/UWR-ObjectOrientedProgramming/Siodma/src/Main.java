import javax.swing.*;
import java.awt.*;

public class Main {

    public static void main(String[] args) {
        Motocykl M1 = new Motocykl("Honda", "CBR",2010 );
        System.out.println(M1);
        M1.Zapis("/home/yoga/Pulpit/object1.ser");
        M1.Odczyt("/home/yoga/Pulpit/object1.ser");
        M1.SetMarka("Kawasaki");
        M1.SetModel("Ninja");
        M1.Zapis("/home/yoga/Pulpit/object1.ser");
        M1.Odczyt("/home/yoga/Pulpit/object1.ser");
        System.out.println("\n"+M1);
            EventQueue.invokeLater(() -> {
            JFrame ex;
            ex = new EdytorPojazd(M1);
            ex.setLayout(new GridLayout(2, 3));
            ex.pack();
            ex.setVisible(true);
        });

    }
}
