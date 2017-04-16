import java.util.*;

public class Zmienna extends Wyrazenie {
    private String nazwa_zmiennej;

    public Zmienna(String NZ) {
        this.nazwa_zmiennej = NZ;
    }

    int obliczWyrazenie() {
        Integer val = tablicaPrzypisan.get(nazwa_zmiennej);
        if (val != null)
            return val;
        else throw new UnsupportedOperationException("Variable " + nazwa_zmiennej + " is not assigned");
    }

    public String toString() {
        return nazwa_zmiennej;
    }

}
