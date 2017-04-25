//#define _USE_MATH_DEFINES
//#include <string>
//#include <vector>
#include <math.h>
#include <iostream>

#include "Lista6.h"



using namespace std;

liczba::liczba(double val) {
    this->val = val;
}

double liczba::oblicz() {
    return this->val;
}

string liczba::opis() {
    string nv = to_string(val);
    return nv.erase(nv.find_last_not_of('0') + 2, std::string::npos);
}

pi::pi() {
    this->val = 3.1415;
}

double pi::oblicz() {
    return val;
}

string pi::opis() {
    return "pi";
}

e::e() {
    val = 2.7182;
}

double e::oblicz() {
    return val;
}

string e::opis() {
    return "e";
}

fi::fi() {
    val = (1 + sqrt(5)) / 2;
}

double fi::oblicz() {
    return val;
}

string fi::opis() {
    return "fi";
}

vector<pair<string, double>> zmienna::zmienne;

zmienna::zmienna(string nazwaZmiennej) {
    nazwa = nazwaZmiennej;
}

double zmienna::oblicz() {
    return getWartoscZmiennej(nazwa);
}

string zmienna::opis() {
    return nazwa;
}

void zmienna::przypiszWartoscZmiennej(string nazwaZmiennej, double valueOfZmienna) {
    for (auto &x : zmienne) {
        if (x.first == nazwaZmiennej) {
            x.second = valueOfZmienna;
            return;
        }
    }
    zmienne.push_back(make_pair(nazwaZmiennej, valueOfZmienna));
}

double zmienna::getWartoscZmiennej(string nazwaZmiennej) {
    for (auto &x : zmienne) {
        if (x.first == nazwaZmiennej)
            return x.second;
    }
    throw string("Brak zmiennej w tablicy asocjacyjnej");
}

operator1arg::~operator1arg() {
    delete w1;
}

sinus::sinus(wyrazenie *w) {
    this->w1 = w;
}

double sinus::oblicz() {
    return sin(w1->oblicz());
}

string sinus::opis() {
    return "sinus(" + w1->opis() + ")";
}

cosinus::cosinus(wyrazenie *w) {
    this->w1 = w;
}

double cosinus::oblicz() {
    return cos(w1->oblicz());
}

string cosinus::opis() {
    return "cosinus(" + w1->opis() + ")";
}

expo::expo(wyrazenie *w) {
    this->w1 = w;
}

double expo::oblicz() {
    return exp(w1->oblicz());
}

string expo::opis() {
    return "expo(" + w1->opis() + ")";
}

logarytmNaturalny::logarytmNaturalny(wyrazenie *w) {
    this->w1 = w;
}

double logarytmNaturalny::oblicz() {
    return log(w1->oblicz());
}

string logarytmNaturalny::opis() {
    return "ln(" + w1->opis() + ")";
}

wartoscBezwzgledna::wartoscBezwzgledna(wyrazenie *w) {
    this->w1 = w;
}

double wartoscBezwzgledna::oblicz() {
    return abs(w1->oblicz());
}

string wartoscBezwzgledna::opis() {
    return "|" + w1->opis() + "|";
}

liczbaPrzeciwna::liczbaPrzeciwna(wyrazenie *w) {
    this->w1 = w;
}

double liczbaPrzeciwna::oblicz() {
    return (-1)*(w1->oblicz());
}

string liczbaPrzeciwna::opis() {
    return "-(" + w1->opis() + ")";
}

liczbaOdwrotna::liczbaOdwrotna(wyrazenie *w) {
    this->w1 = w;
}

double liczbaOdwrotna::oblicz() {
    if (w1->oblicz() == 0) throw new string("Nie dzielenie przez zero");
    else return 1 / (w1->oblicz());
}

string liczbaOdwrotna::opis() {
    return "1/(" + w1->opis() + ")";
}

operator2arg::~operator2arg() {
    delete w1;
    delete w2;
    delete this;
}

string operator2arg::nawiasujWyrazenia(string op) {
    string priorytetyNawiasow1;
    string priorytetyNawiasow2;
    if (((w1->priorytetLacznosci > this->priorytetLacznosci) && (this->priorytetLacznosci > 0)) || ((w1->priorytetLacznosci == this->priorytetLacznosci) && (w1->priorytetLacznosci > 0) && this->czyLaczyWPrawo)) {
        priorytetyNawiasow1 = "(" + w1->opis() + ")";
    }

    else {
        priorytetyNawiasow1 = w1->opis();
    }
    if (((w2->priorytetLacznosci > this->priorytetLacznosci) && (this->priorytetLacznosci > 0)) || ((w2->priorytetLacznosci == this->priorytetLacznosci) && (w2->priorytetLacznosci > 0) && !this->czyLaczyWPrawo)) {
        priorytetyNawiasow2 = "(" + w2->opis() + ")";
    }
    else {
        priorytetyNawiasow2 = w2->opis();
    }
    return priorytetyNawiasow1 + " " + op + " " + priorytetyNawiasow2;
}

dodawanie::dodawanie(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = w2;
    this->priorytetLacznosci = 6;
    this->czyLaczyWPrawo = false;

}

double dodawanie::oblicz() {
    return w1->oblicz() + w2->oblicz();
}

string dodawanie::opis() {
    return this->nawiasujWyrazenia("+");
}

odejmowanie::odejmowanie(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 6;
    this->czyLaczyWPrawo = false;
}

double odejmowanie::oblicz() {
    return w1->oblicz() - w2->oblicz();
}

string odejmowanie::opis() {
    return this->nawiasujWyrazenia("-");
}

mnozenie::mnozenie(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 5;
    this->czyLaczyWPrawo = false;
}

double mnozenie::oblicz() {
    return w1->oblicz() * w2->oblicz();
}

string mnozenie::opis() {
    return "(" + this->nawiasujWyrazenia("*") + ")";
}

dzielenie::dzielenie(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 5;
    this->czyLaczyWPrawo = false;
}

double dzielenie::oblicz() {
    if (w2->oblicz() == 0) throw new string("Nie dziel przez zero");
    else return w1->oblicz() / w2->oblicz();
}

string dzielenie::opis() {
    return this->nawiasujWyrazenia("/");
}

logarytm::logarytm(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 0;
    this->czyLaczyWPrawo = false;
}

double logarytm::oblicz() {
    if (w2->oblicz() <= 1 || w1->oblicz() <= 1) throw new string("Złe elementy");
    else return log10(w2->oblicz()) / log10(w1->oblicz());
}

string logarytm::opis() {
    if (w2->oblicz() <= 1 || w1->oblicz() <= 1) throw new string("Złe elementy");
    return "log("+ w1->opis()+")("+ w2->opis()+")";
}

modulo::modulo(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 5;
    this->czyLaczyWPrawo = false;
}

double modulo::oblicz() {
    return (int)(w1->oblicz()) % (int)w2->oblicz();
}

string modulo::opis() {
    return this->nawiasujWyrazenia("%");
}

potega::potega(wyrazenie *W1, wyrazenie *W2) {
    this->w1 = W1;
    this->w2 = W2;
    this->priorytetLacznosci = 4;
    this->czyLaczyWPrawo = true;
}

double potega::oblicz() {
    return pow(w1->oblicz(), w2->oblicz());
}

string potega::opis() {
    return this->nawiasujWyrazenia("^");
}
