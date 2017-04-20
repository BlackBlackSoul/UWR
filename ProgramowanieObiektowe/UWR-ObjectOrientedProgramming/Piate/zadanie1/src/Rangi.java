class Porucznik extends stopnieWojskowe {
    public int iloscGwiazdekNaPagonie() {
        return 3;
    }
    public Porucznik(String s) {
        this.ranga = s;
    }
    public Porucznik() {
        this.ranga = "Porucznik";
    }
}
class Kapitan extends stopnieWojskowe {

    public int iloscGwiazdekNaPagonie() {
        return 4;
    }
    public Kapitan(String s){
        this.ranga = s;
    }
    public Kapitan(){
        this.ranga = "Kapitan";
    }

}
class Major extends stopnieWojskowe {

    public int iloscGwiazdekNaPagonie() {
        return 5+1; //5 za dwie belski i jedna gwiazdka
    }
    public Major (String s) {
        this.ranga = s;
    }
    public Major(){
        this.ranga = "Major";
    }
}
class generalBroni extends stopnieWojskowe {
    public int iloscGwiazdekNaPagonie() {
        return 10+3;//dziesiec za wezyk generalski i trzy gwiazdki
    }
    public generalBroni (String s){
        this.ranga = s;
    }
    public generalBroni(){
        this.ranga = "Generał Broni";
    }
}

