import java.util.*;
public class Main {

    public static void main(String[] args) {
        System.out.println("Kazdy stopien posiada gwizadki, wezyk generalski badz belki, gdzie gwiazdka to - 1, belki - 5, wezyk generalski - 10.");
        ArrayList<stopnieWojskowe> korpusWojskaPolskiego = new ArrayList<stopnieWojskowe>();
        korpusWojskaPolskiego.add(new generalBroni());
        korpusWojskaPolskiego.add(new Kapitan());
        korpusWojskaPolskiego.add(new Major());
        korpusWojskaPolskiego.add(new Porucznik());
        Collections.sort(korpusWojskaPolskiego);
        for(stopnieWojskowe stopien : korpusWojskaPolskiego) System.out.println(stopien);
        System.out.println("");
        Kolekcja<Integer, String > K1 = new Kolekcja<>();
        K1.wstaw(5,"x");
        K1.wstaw(12, "z");
        K1.wstaw(123123, "y");
        K1.wstaw(-123123, "d");
        K1.wypisanie();
        K1.usun();
        System.out.println("Zabieram najmniejszy element");
        K1.wypisanie();
    }
}

