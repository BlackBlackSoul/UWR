class Kolekcja<V, T extends Comparable<T>> {
    V val;
    T key;
    Kolekcja<V, T> next;

    public Kolekcja(V val, T key) {
        this.val = val;
        this.key = key;
        this.next = null;
    }
    public Kolekcja() {}
    public Kolekcja<V, T> usun() {
        Kolekcja<V, T> nastepny_element = this.next;
        if(this.next != null){
            this.next = this.next.next;
        }
        return nastepny_element;
    }

    public void wstaw(V val, T key)
    {
        if(this.next != null)
        {
            if (this.next.key.compareTo(key)>=0)
            {
                Kolekcja<V,T> k=this.next;
                this.next=new Kolekcja<V,T>(val, key);
                this.next.next=k;
            }
            else this.next.wstaw(val, key);
        }
        else this.next=new Kolekcja<V,T>(val, key);
    }

    public void  wypisanie() {
     if (this.next != null)
        {
            System.out.println("Wartość w kolejkcji: " + this.next.val + " oraz jej klucz ->" + this.next.key);
            this.next.wypisanie();
        }
    }
}
