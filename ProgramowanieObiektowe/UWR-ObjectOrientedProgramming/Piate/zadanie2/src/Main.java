public class Main {

    public static void main(String[] args) {
        Wyrazenie w = new Dodawanie(new Stala(4), new Stala(5));
        System.out.println(w+", oraz jego wartość -> "+w.obliczWyrazenie());
        Wyrazenie w1 = new Mnozenie(new Zmienna("x"), new Stala(10));
        w1.przypiszWartosc("x", 12);
        System.out.println(w1+", oraz jego wartość -> "+w1.obliczWyrazenie());
        Wyrazenie w3 = new Dzielenie(new Stala(100), new Stala(1));
        System.out.println(w3+", oraz jego wartość -> "+w3.obliczWyrazenie());

    }
}
