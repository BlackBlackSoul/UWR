import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

/**
 * Created by metUAN on 12.04.17.
 * GL&HF
 */
public class EdytorMotocykl extends JFrame implements ActionListener, Serializable
{
    public JButton ButtonZapisz;
    public JTextField Model, Marka, RokProdukcji;
    public Motocykl M1;

    public EdytorMotocykl(Motocykl M2) {
        initUI1();
        M1 = M2;
    }
    public final void initUI1() {
        ButtonZapisz  = new JButton("Zmiana marki");
        ButtonZapisz.setBounds(0, 10, 200, 30);
        ButtonZapisz = new JButton("Zmiana modelu");
        ButtonZapisz.setBounds(0, 10, 200, 30);
        ButtonZapisz = new JButton("Zmiana roku produkcji");
        ButtonZapisz.setBounds(0, 10, 200, 30);

        this.setLayout(null);

        getContentPane().add(ButtonZapisz);
        ButtonZapisz.addActionListener(this);

        Marka = new JTextField("Marka");
        Marka.setBounds(200, 10, 200, 30);
        getContentPane().add(Marka);

        Model = new JTextField("Model");
        Model.setBounds(200, 50, 200, 30);
        getContentPane().add(Model);

        RokProdukcji = new JTextField("Rok produkcji");
        RokProdukcji.setBounds(200, 90, 200, 30);
        getContentPane().add(RokProdukcji);

        setSize(500, 250);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    public void actionPerformed(ActionEvent e) {
        Object source = e.getSource();
        if (source == ButtonZapisz) {
            M1.SetMarka(Marka.getText());
            M1.SetModel(Model.getText());
            M1.SetRokProdukcji(Integer.parseInt(RokProdukcji.getText()));
            System.out.println(M1);
        }
    }
}