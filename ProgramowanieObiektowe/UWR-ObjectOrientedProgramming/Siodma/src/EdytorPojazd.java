/**
 * Created by metUAN on 12.04.17.
 * GL&HF
 */
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import javax.swing.*;

public class EdytorPojazd extends JFrame implements ActionListener, Serializable {
    public JButton ButtonZapisz, ButtonZapisz1, ButtonZapisz2;
    public JTextField Model, Marka, RokProdukcji;
    private Pojazd P1;

    public EdytorPojazd(Pojazd P2) {
        initUI();
        P1 = P2;
    }

    public final void initUI() {
        ButtonZapisz = new JButton("Zmiana marki");
        ButtonZapisz.setBounds(0, 10, 200, 30);
        ButtonZapisz1 = new JButton("Zmiana modelu");
        ButtonZapisz1.setBounds(0, 10, 200, 30);
        ButtonZapisz2 = new JButton("Zmiana roku produkcji");
        ButtonZapisz2.setBounds(0, 10, 200, 30);

        this.setLayout(null);

        getContentPane().add(ButtonZapisz);
        ButtonZapisz.addActionListener(this);
        getContentPane().add(ButtonZapisz1);
        ButtonZapisz1.addActionListener(this);
        getContentPane().add(ButtonZapisz2);
        ButtonZapisz2.addActionListener(this);

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
        if (source == ButtonZapisz)
            P1.SetMarka(Marka.getText());
        else if (source == ButtonZapisz1)
            P1.SetModel(Model.getText());
        else if (source == ButtonZapisz2)
            P1.SetRokProdukcji(Integer.parseInt(RokProdukcji.getText()));
        System.out.println(P1);
        }
    }
