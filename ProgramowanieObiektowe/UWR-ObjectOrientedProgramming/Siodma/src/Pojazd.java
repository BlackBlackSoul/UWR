import java.io.*;

/**
 * Created by metUAN on 11.04.17.
 * GL&HF
 */
public class Pojazd implements Serializable{
    String Marka;
    String Model;
    int RokProdukcji;

    public void SetMarka(String marka) {
        this.Marka = marka;
    }
    public void SetModel(String model) {
        this.Model = model;
    }
    public void SetRokProdukcji(int rokprodukcji) {
        this.RokProdukcji = rokprodukcji;
    }

    public Pojazd() {
        this.Marka = "None";
        this.Model = "None";
        this.RokProdukcji = 0;
    }
    public Pojazd(String marka, String model, int rokprodukcji) {
        this.Marka = marka;
        this.Model = model;
        this.RokProdukcji = rokprodukcji;
    }
    public String toString() {
        return "Marka: " + this.Marka + "\n" + "Model: " + this.Model
                + "\n" + "Wartosc: " + "Rok produkcji: " + this.RokProdukcji + "\n";
    }
    public void Zapis(String s) {
        try {
            FileOutputStream fileOut = new FileOutputStream(s);
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(this);
            out.close();
            fileOut.close();
            System.out.printf("Serialized data is saved in /home/yoga/Pulpit/object.ser" + "\n");
        }catch(IOException i) {
            i.printStackTrace();
        }
    }
    public void Odczyt(String s) {
        Pojazd e = null;
        try {
            FileInputStream fileIn = new FileInputStream(s);
            ObjectInputStream in = new ObjectInputStream(fileIn);
            e = (Pojazd) in.readObject();
            in.close();
            fileIn.close();
        }catch(IOException i) {
            i.printStackTrace();
            return;
        }catch(ClassNotFoundException c) {
            System.out.println("Class not found");
            c.printStackTrace();
            return;
        }
    }

}

class Tramwaj extends Pojazd {
    public Tramwaj(String marka, String model, int rokprodukcji) {
        super(marka, model, rokprodukcji);
    }
    public Tramwaj () {
        super();
    }
    @Override
    public String toString() {
        return super.toString();
    }
}

class Motocykl extends Pojazd {

    public Motocykl(String marka, String model, int rokprodukcji){
        super(marka, model, rokprodukcji);
    }
    public Motocykl() {
        super();
    }
    @Override
    public String toString() {
        return super.toString();
    }
}


