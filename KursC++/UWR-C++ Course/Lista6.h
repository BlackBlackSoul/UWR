//
// Created by yoga on 25.04.17.
//
#include <string>
#include <vector>
#ifndef LISTA6_LISTA6_H
#define LISTA6_LISTA6_H
using namespace std;
//-----------Klasa wyrazenia---------------//
class wyrazenie {
    public:
        virtual double oblicz() = 0;
        virtual string opis() = 0;
        int priorytetLacznosci = -1;
        bool czyLaczyWPrawo;
};
//-----------Klasa liczba-----------------//
class liczba : public wyrazenie {
    double val;
    public:
        liczba(double val);
        double oblicz();
        string opis();
};
//-----------Klasy stalych---------------//
class stala : public wyrazenie {
    protected:
        double val;

};
class pi : public stala {
    public:
        pi();
        double oblicz();
        string opis();
};
class e : public stala {
    public:
        e();
        double oblicz();
        string opis();
};
class fi : public stala {
    public:
        fi();
        double oblicz();
        string opis();
};
class zmienna : public wyrazenie {
    static vector<pair<string, double>> zmienne;
    string nazwa;
    public:
        zmienna(string s);
        double oblicz();
        string opis();
        static void przypiszWartoscZmiennej(string, double);
        double getWartoscZmiennej(string);
};
//-----------operatory 1 argumentowe---------------//
class operator1arg : public wyrazenie {
    public:
        ~operator1arg();
    protected:
        wyrazenie *w1;
};
class sinus : public operator1arg {
    public:
        sinus(wyrazenie *);
        double oblicz();
        string opis();
};
class cosinus : public operator1arg {
    public:
        cosinus(wyrazenie *);
        double oblicz();
        string opis();
};
class expo : public operator1arg {
    public:
        expo(wyrazenie *);
        double oblicz();
        string opis();
};
class logarytmNaturalny : public operator1arg {
    public:
        logarytmNaturalny(wyrazenie *);
        double oblicz();
        string opis();
};
class wartoscBezwzgledna : public operator1arg {
    public:
        wartoscBezwzgledna(wyrazenie *);
        double oblicz();
        string opis();
};
class liczbaPrzeciwna : public operator1arg {
    public:
        liczbaPrzeciwna(wyrazenie *);
        double oblicz();
        string opis();
};
class liczbaOdwrotna : public operator1arg {
    public:
        liczbaOdwrotna(wyrazenie *);
        double oblicz();
        string opis();
};
//-----------operatory 2 argumentowe---------------//
class operator2arg : public operator1arg {
    public:
        ~operator2arg();
    protected:
        string nawiasujWyrazenia(string);
        wyrazenie *w2;
};
class dodawanie : public operator2arg {
public:
    dodawanie(wyrazenie *, wyrazenie *);
    double oblicz();
    string opis();
};
class odejmowanie : public operator2arg {
    public:
        odejmowanie(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
class mnozenie : public operator2arg {
    public:
        mnozenie(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
class dzielenie : public operator2arg {
    public:
        dzielenie(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
class logarytm : public operator2arg {
    public:
        logarytm(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
class modulo : public operator2arg {
    public:
        modulo(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
class potega : public operator2arg {
    public:
        potega(wyrazenie *, wyrazenie *);
        double oblicz();
        string opis();
};
#endif //LISTA6_LISTA6_H