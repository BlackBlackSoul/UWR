import java.util.HashMap;

public abstract class Wyrazenie {
    static HashMap<String, Integer> tablicaPrzypisan = new HashMap<>();
    void przypiszWartosc(String zmienna, Integer wartosc) {
        System.out.println("Zmiennej '"+zmienna+"' została przypisana wartość: "+ wartosc);
        Wyrazenie.tablicaPrzypisan.put(zmienna, wartosc);
    }
    abstract int obliczWyrazenie();
}