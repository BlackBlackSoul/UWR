#ifndef UNTITLED_HEADER_H
#define UNTITLED_HEADER_H
#endif //UNTITLED_HEADER_H
#include <iostream>

using namespace std;

class Punkt {
    public:
        double x, y;
        Punkt(double x = 0 , double y = 0);
        Punkt * przesuniecie(double x, double y, Punkt p1);
        Punkt(const Punkt &Pkt);
};

class Odcinek {
    public:
        double x, y, x1, y1;
        Odcinek(const Odcinek &Odc);
        Odcinek(double x = 0 , double y= 0, double x1 = 1, double y1 = 1);
        double dlugosc_odcnika(Odcinek d1);
        bool punkt_na_odcinku(double x, double y, Odcinek d1);
        double srodek_odcinka(Odcinek d1);
        Odcinek przesuniecie(double x, double y, Odcinek d1);
};

class Trojkat {
    public:
        double x,y,x1,y1,x2,y2;
        Trojkat(const Trojkat &troj);
        Trojkat(double x = -1, double y = 0, double x1 = 1, double y1 = 0, double x2 = 0, double y2 = 2);
        Trojkat przesuniecie(double x, double y, Trojkat t1);
        double obwod(Trojkat t1);
        double pole(Trojkat t1);
        bool punkt_w_trojkacie(double x, double y, Trojkat t1);
        double srodek_trojkata(Trojkat t1);

};
void dystans(Punkt p1, Punkt p2);
void rownolegle(Odcinek d1, Odcinek d2);
void prostopadle(Odcinek d1, Odcinek d2);
bool punkt_przeciecia(Odcinek d1, Odcinek d2);
void rozlaczne(Trojkat t1, Trojkat t2);
void jeden_w_drugim(Trojkat t1, Trojkat t2);
void punkt_w_trojkacie(Punkt p1, Trojkat t1);
void obrot_o_kat(Punkt p1, double a);
void obrot_o_kat1(Odcinek d1, double a);
void obrot_o_kat2(Trojkat t1, double a);