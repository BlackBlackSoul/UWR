public class Stala extends Wyrazenie {
    Integer wartosc;
    public Stala(Integer value) {
        this.wartosc = value;
    }

    int obliczWyrazenie() {
        return wartosc;
    }

    public String toString() {
        return Integer.toString(wartosc);
    }
}
