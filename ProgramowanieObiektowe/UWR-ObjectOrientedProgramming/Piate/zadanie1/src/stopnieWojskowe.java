public abstract class stopnieWojskowe implements Comparable<stopnieWojskowe> {
    public String ranga;
    public abstract int iloscGwiazdekNaPagonie();

    public int compareTo(stopnieWojskowe Dywizja) {
        if (Dywizja.iloscGwiazdekNaPagonie() == this.iloscGwiazdekNaPagonie()){
            return 0;
        }
        else if (Dywizja.iloscGwiazdekNaPagonie() < this.iloscGwiazdekNaPagonie()){
            return 1;
        }
        else{
            return -1;
        }
    }

    public String toString() {
        return "Stopień " + ranga + " posiada " + iloscGwiazdekNaPagonie() + " jako liczbę ważności rangi.";

    }
}