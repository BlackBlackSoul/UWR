class Dodawanie extends Wyrazenie {
    Wyrazenie w1;
    Wyrazenie w2;

    public Dodawanie(Wyrazenie w1konstruktor, Wyrazenie w2konstruktor) {
        this.w1 = w1konstruktor;
        this.w2 = w2konstruktor;
    }

    int obliczWyrazenie() {
        return w1.obliczWyrazenie() + w2.obliczWyrazenie();
    }

    public String toString() {
        return "Wyrażenie: (" + w1 + "+" + w2 + ")";
    }
}
class Odejmownie extends Wyrazenie {
    Wyrazenie w1;
    Wyrazenie w2;

    public Odejmownie(Wyrazenie w1konstruktor, Wyrazenie w2konstruktor) {
        this.w1 = w1konstruktor;
        this.w2 = w2konstruktor;
    }

    int obliczWyrazenie() {
        return w1.obliczWyrazenie() - w2.obliczWyrazenie();
    }

    public String toString() {
        return "Wyrażenie: (" + w1 + "-" + w2 + ")";
    }
}
class Dzielenie extends Wyrazenie {
    Wyrazenie w1;
    Wyrazenie w2;

    public Dzielenie(Wyrazenie w1konstruktor, Wyrazenie w2konstruktor) {
        this.w1 = w1konstruktor;
        this.w2 = w2konstruktor;
    }

    int obliczWyrazenie() {
        return w1.obliczWyrazenie() / w2.obliczWyrazenie();
    }
    public String toString() {
        return "Wyrażenie: (" + w1 + "/" + w2 + ")";
    }
}
class Mnozenie extends Wyrazenie {
    Wyrazenie w1;
    Wyrazenie w2;

    public Mnozenie(Wyrazenie w1konstruktor, Wyrazenie w2konstruktor) {
        this.w1 = w1konstruktor;
        this.w2 = w2konstruktor;
    }

    int obliczWyrazenie() {
        return w1.obliczWyrazenie() * w2.obliczWyrazenie();
    }
    public String toString() {
        return "Wyrażenie: (" + w1 + "*" + w2 + ")";
    }
}