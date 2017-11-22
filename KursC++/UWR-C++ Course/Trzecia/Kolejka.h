#include <iostream>

#ifndef UNTITLED_KOLEJKA_H
#define UNTITLED_KOLEJKA_H

using namespace std;

class Kolejka {
public:
    void wstaw(string x);
    string pobierz();
    string sprawdz();
    int rozmiar();
    void wypisz();
    Kolejka (int poj);
    Kolejka();
    ~Kolejka();
    Kolejka (initializer_list<string> lista_argumentow);
    Kolejka(Kolejka &Kol);
    Kolejka(Kolejka &&Kol);
    Kolejka operator =(Kolejka &Kol);
    Kolejka operator =(Kolejka &&Kol);

private:
    string *Tablica;
    int pojemnosc = 0;
    int poczatek = 0;
    int indeks_elementu = 1;
    int ile = 0;
};
#endif //UNTITLED_KOLEJKA_H