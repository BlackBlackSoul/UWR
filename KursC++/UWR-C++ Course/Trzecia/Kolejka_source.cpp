#include "Kolejka.h"

using namespace std;

Kolejka::Kolejka(int poj) {
    pojemnosc = poj;
    Tablica = new string[poj];
}

Kolejka::Kolejka()
        : Kolejka(4) {};

Kolejka::Kolejka(initializer_list<string> lista_argumentow)
        : Kolejka(lista_argumentow.size()) {
    int i = 0;
    for (auto iterator = lista_argumentow.begin(); iterator != lista_argumentow.end(); this->indeks_elementu++, iterator++){
        Tablica[indeks_elementu] = *iterator;
    }
}


Kolejka::Kolejka(Kolejka &Kol) {
    pojemnosc = Kol.pojemnosc;
    ile = Kol.ile;
    indeks_elementu = Kol.indeks_elementu;
}

Kolejka::Kolejka(Kolejka &&Kol)
        : pojemnosc(Kol.pojemnosc), ile(Kol.ile), indeks_elementu(Kol.indeks_elementu) {
    Kol.Tablica = nullptr;
}

Kolejka::~Kolejka() {
    if (Tablica != nullptr) {
        cout << "Usuwanie obiektu " << this << endl;
        delete[] Tablica;
    }
}

Kolejka Kolejka::operator=(Kolejka &Kol) {
    this->pojemnosc = Kol.pojemnosc;
    this->ile = Kol.ile;
    this->indeks_elementu = Kol.indeks_elementu;
    this->Tablica = new string[pojemnosc];
    for (int i = 0; i < pojemnosc; ++i) {
        Tablica[i] = Kol.Tablica[i];
    }
}

Kolejka Kolejka::operator=(Kolejka &&Kol) {
    this->pojemnosc = move(Kol.pojemnosc);
    this->ile = move(Kol.ile);
    this->indeks_elementu = move(Kol.indeks_elementu);
    this->Tablica = move(Kol.Tablica);
}
void Kolejka::wypisz() {
    cout << "Wszystkie elementy kolejki: " << endl;
    for (int i = 0; i < ile; i++) {
        cout << Tablica[i] << endl;
    }
}
void Kolejka::wstaw(string x) {
    if (indeks_elementu > pojemnosc) {
        cerr << "Brak wolnego miejsca" << endl;
    } else {
        Tablica[indeks_elementu-1] = x;
        indeks_elementu = indeks_elementu + 1;
        ile += 1;
    }
}
int Kolejka::rozmiar() {
    return ile;
}
string Kolejka::sprawdz() {
    return Tablica[poczatek];
}
string Kolejka::pobierz() {
    if (ile == 0)
         throw string("Brak elementów");
    poczatek += 1;
    for (int i = 0; i < ile; i++){
        Tablica[i] = Tablica[i+1];
    }
    ile = ile - 1;
    indeks_elementu = indeks_elementu - 1;
    return Tablica[poczatek - 1];
}