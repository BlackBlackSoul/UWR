#include <iostream>
#include <cmath>
#include "Header.h"

using namespace std;
Punkt::Punkt(const Punkt &Pkt) {
    x=Pkt.x; y=Pkt.y;
}
Punkt::Punkt(double xx, double yy) {
    x = xx;
    y = yy;
}
Punkt *Punkt::przesuniecie(double xx, double yy, Punkt p1) {
    double xTmp = p1.x + xx;
    double yTmp = p1.y + yy;
    cout << "Stary punkt: x =  " << p1.x << ", y = " << p1.y << ". Przesunięty o wektor [" << xx << "," << yy << "]" << endl;
    cout << "Nowe koordynaty: " << endl;
    cout << "x = " << xTmp << endl;
    cout << "y = " << yTmp << endl;
    return new Punkt(xTmp, yTmp);
}
Odcinek::Odcinek(const Odcinek &Odc) {
    x = Odc.x; y = Odc.y; x1 = Odc.x1; y1 = Odc.y1;
}
Odcinek::Odcinek(double xx, double yy, double x11, double y11) {
    x = xx;
    y = yy;
    x1 = x11;
    y1 = y11;
}
Odcinek Odcinek::przesuniecie(double x, double y, Odcinek d1) {
    double xTmp = d1.x + x;
    double yTmp = d1.y + y;
    double x1Tmp = d1.x1 + x;
    double y1Tmp = d1.y1 + y;
    cout << "Stary odcinek o punktach: x =  " << d1.x << ", y = " << d1.y << ", x1 = " << d1.x1 << ", y1 = " << d1.y1 << ". Przesunięty o wektor [" << x << "," << y << "]" << endl;
    cout << "Nowe koordynaty: " << endl;
    cout << "[x = " << xTmp << "; y = " << yTmp << "]" << endl;
    cout << "[x1 = " << x1Tmp << "; y1 = " << y1Tmp << "]" << endl;
}
double Odcinek::dlugosc_odcnika(Odcinek d1) {
    double dlugosc = sqrt(pow((d1.x - d1.x1), 2) + pow((d1.y - d1.y1),2));
    cout << "Długość odcinka [[" << d1.x << ", " << d1.y << "], [" << d1.x1 << ", " << d1.y1 << "]], to: " << dlugosc << endl;
}
double Odcinek::srodek_odcinka(Odcinek d1) {
    double srodekX = (d1.x + d1.x1) / 2;
    double srodekY = (d1.y + d1.y1) / 2;
    cout << "Środek odcinka [[" << d1.x << ", " << d1.y << "], [" << d1.x1 << ", " << d1.y1 << "]], to: [" << srodekX << ", " << srodekY << "]." << endl;
}
bool Odcinek::punkt_na_odcinku(double x, double y, Odcinek d1) {
    double wyznczanik_macierzy = x * d1.y + y * d1.x1 + d1.x * d1.y1 - d1.x1 * d1.y - d1.y1 * x - d1.x * y;
    if (wyznczanik_macierzy == 0) {
        if ((min(d1.x, d1.x1) <= x) && (x <= max(d1.x, d1.x1))) {
            if ((min(d1.y, d1.y1) <= y) && y <= max(d1.y, d1.y1)) {
                cout << "Jest na tym odcinku. True" << endl;
            }
        }
    } else cout << "Brak punktu na tym odcinku. False" << endl;
}
Trojkat::Trojkat(const Trojkat &troj) {
    x = troj.x;
    y = troj.y;
    x1 = troj.x1;
    y1 = troj.y1;
    x2 = troj.x2;
    y2 = troj.y2;
}
Trojkat::Trojkat(double xx, double yy, double xx1, double yy1, double xx2, double yy2) {
    x = xx;
    y = yy;
    x1 = xx1;
    y1 = yy1;
    x2 = xx2;
    y2 = yy2;
}
double Trojkat::obwod(Trojkat t1) {
    double dlugosc1 = sqrt(pow((t1.x - t1.x1), 2) + pow((t1.y - t1.y1),2));
    double dlugosc2 = sqrt(pow((t1.x - t1.x2), 2) + pow((t1.y - t1.y2),2));
    double dlugosc3 = sqrt(pow((t1.x1 - t1.x2), 2) + pow((t1.y1 - t1.y2),2));
    return dlugosc1+dlugosc2+dlugosc3;
}
Trojkat Trojkat::przesuniecie(double x, double y, Trojkat t1) {
    double xTmp = t1.x + x;
    double yTmp = t1.y + y;
    double x1Tmp = t1.x1 + x;
    double y1Tmp = t1.y1 + y;
    double x2Tmp = t1.x2 + x;
    double y2Tmp = t1.y2 + y;
    cout << "Przesunięty trójkąt to: ([" << xTmp << ", " << yTmp << "], [" << x1Tmp << ", " << y1Tmp <<"], [" << x2Tmp << ", " << y2Tmp << "])." << endl;
}
double Trojkat::pole(Trojkat t1) {
    double pole = 0.5*abs((t1.x1-t1.x)*(t1.y2-t1.y)-(t1.y1-t1.y)*(t1.x2-t1.x));
    cout << "Pole Trójkąta o współrzędnych [" << t1.x << ", " << t1.y << "], [" << t1.x1 <<", " << t1.y1 << "], [" << t1.x2 << ", " << t1.y2 << "]." << endl;
    cout << "Jest równe : " << pole << endl;
}
bool Trojkat::punkt_w_trojkacie(double x, double y, Trojkat t1) {
    double d1, d2, d3;
    d1 = x*(t1.y-t1.y1) + y*(t1.x1-t1.x) + (t1.x*t1.y1-t1.y*t1.x1);
    d2 = x*(t1.y1-t1.y2) + y*(t1.x2-t1.x1) + (t1.x1*t1.y2-t1.y1*t1.x2);
    d3 = x*(t1.y2-t1.y) + y*(t1.x-t1.x2) + (t1.x2*t1.y-t1.y2*t1.x);

    if ((d1<=0)&&(d2<=0)&&(d3<=0) || (d1>=0)&&(d2>=0)&&(d3>=0) ) cout << "Punkt lezy wewnatrz trojkata " << endl;
    else cout << "Punkt nie lezy wewnatrz trojkata" << endl;
}
double Trojkat::srodek_trojkata(Trojkat t1) {
    double x_wspolrzedna = (t1.x+t1.x1+t1.x2) / 3;
    double y_wspolrzedna = (t1.y+t1.y1+t1.y2) / 3;
    cout << "Środek cięzkości trójkata to : [" << x_wspolrzedna << ", " << y_wspolrzedna << "]. " << endl;
}

void dystans(Punkt p1, Punkt p2) {
    double d = sqrt(pow((p1.x - p2.x), 2) + pow((p1.y - p2.y),2));
    cout << "Odległość między punktem P!: [" << p1.x << ", " << p1.y <<"], [" << p2.x << ", " << p2.y << "] to: " << d << endl;
}

void rownolegle(Odcinek d1, Odcinek d2) {
    double kierunkowa_d1 = (d1.y1 - d1.y)/(d1.x1 - d1.x);
    double kierunkowa_d2 = (d2.y1 - d2.y)/(d2.x1 - d2.x);
    if (kierunkowa_d1 == kierunkowa_d2) cout << "Odcinki równoległe" << endl;
    else cout << "Nie są równoległe" << endl;
}
void prostopadle(Odcinek d1, Odcinek d2) {
    double kierunkowa_d1 = (d1.y1 - d1.y)/(d1.x1 - d1.x);
    double kierunkowa_d2 = (d2.y1 - d2.y)/(d2.x1 - d2.x);
    if ((kierunkowa_d1*kierunkowa_d2) == -1) cout << "Prostopadłe" << endl;
    else cout << "Nie są prostopadłe" << endl;
}
bool punkt_przeciecia(Odcinek d1, Odcinek d2) {
    double x=((d1.x1-d1.x)*(d2.x1*d2.y-d2.y1*d2.x)-(d2.x1-d2.x)*(d1.x1*d1.y-d1.y1*d1.x))/((d1.y1-d1.y)*(d2.x1-d2.x)-(d2.y1-d2.y)*(d1.x1-d1.x));
    double y=((d2.y1-d2.y)*(d1.x1*d1.y-d1.y1*d1.x)-(d1.y1-d1.y)*(d2.x1*d2.y-d2.y1*d2.x))/((d2.y1-d2.y)*(d1.x1-d1.x)-(d1.y1-d1.y)*(d2.x1-d2.x));

    if (isinf(x) || isinf(y)) {
        cout << "Brak punktów wspólnych" << endl;
        return false;
    }
    else {
        cout << "Współrzeðne przcięcia odcinków: [" << x << ", " << y << "] ." << endl;
        return true;
    }

}
void punkt_w_trojkacie(Punkt p1, Trojkat t1) {
    double d1, d2, d3;
    d1 = p1.x*(t1.y-t1.y1) + p1.y*(t1.x1-t1.x) + (t1.x*t1.y1-t1.y*t1.x1);
    d2 = p1.x*(t1.y1-t1.y2) + p1.y*(t1.x2-t1.x1) + (t1.x1*t1.y2-t1.y1*t1.x2);
    d3 = p1.x*(t1.y2-t1.y) + p1.y*(t1.x-t1.x2) + (t1.x2*t1.y-t1.y2*t1.x);

    if ((d1<=0)&&(d2<=0)&&(d3<=0) || (d1>=0)&&(d2>=0)&&(d3>=0) ) cout << "Punkt lezy wewnatrz trojkata " << endl;
    else cout << "Punkt nie lezy wewnatrz trojkata" << endl;
}
void jeden_w_drugim(Trojkat t1, Trojkat t2) {
    double d1, d2, d3;
    d1 = t1.x*(t2.y-t2.y1) + t1.y*(t2.x1-t2.x) + (t2.x*t2.y1-t2.y*t2.x1);
    d2 = t1.x*(t2.y1-t2.y2) + t1.y*(t2.x2-t2.x1) + (t2.x1*t2.y2-t2.y1*t2.x2);
    d3 = t1.x*(t2.y2-t2.y) + t1.y*(t2.x-t2.x2) + (t2.x2*t2.y-t2.y2*t2.x);
    double d4, d5, d6;
    d4 = t1.x1*(t2.y-t2.y1) + t1.y1*(t2.x1-t2.x) + (t2.x*t2.y1-t2.y*t2.x1);
    d5 = t1.x1*(t2.y1-t2.y2) + t1.y1*(t2.x2-t2.x1) + (t2.x1*t2.y2-t2.y1*t2.x2);
    d6 = t1.x1*(t2.y2-t2.y) + t1.y1*(t2.x-t2.x2) + (t2.x2*t2.y-t2.y2*t2.x);
    double d7, d8, d9;
    d7 = t1.x2*(t2.y-t2.y1) + t1.y2*(t2.x1-t2.x) + (t2.x*t2.y1-t2.y*t2.x1);
    d8 = t1.x2*(t2.y1-t2.y2) + t1.y2*(t2.x2-t2.x1) + (t2.x1*t2.y2-t2.y1*t2.x2);
    d9 = t1.x2*(t2.y2-t2.y) + t1.y2*(t2.x-t2.x2) + (t2.x2*t2.y-t2.y2*t2.x);
    if ((d1<=0)&&(d2<=0)&&(d3<=0) || (d1>=0)&&(d2>=0)&&(d3>=0)) {
        if ((d4<=0)&&(d5<=0)&&(d6<=0) || (d4>=0)&&(d5>=0)&&(d6>=0)) {
            if ((d7<=0)&&(d8<=0)&&(d9<=0) || (d7>=0)&&(d8>=0)&&(d9>=0))
                cout << "Pierwszy trójkąt leży w drugim trójkącie" << endl;
            else cout << "Nie leży" << endl;
        }
        else cout << "Nie leży" << endl;

    }
    else cout << "Nie leży" << endl;
}
void rozlaczne(Trojkat t1, Trojkat t2) {
    Odcinek xyz;
    xyz = Odcinek(t2.x, t2.y,t2.x1, t2.y1);
    Odcinek xyz1;
    xyz1 = Odcinek(t2.x1, t2.y1,t2.x2,t2.y2);
    Odcinek xyz2;
    xyz2 = Odcinek(t2.x2, t2.y2, t2.x, t2.y);
    if (punkt_przeciecia(t1.x, xyz) || punkt_przeciecia(t1.x, xyz1) || punkt_przeciecia(t1.x, xyz2) || punkt_przeciecia(t1.y, xyz) || punkt_przeciecia(t1.y, xyz1) || punkt_przeciecia(t1.y, xyz2)){
        cout << "Nie są rozłączne" << endl;

    }
    else cout << "Są rozłączne" << endl;
}
void obrot_o_kat(Punkt p1, double a) {
    double x_prim = (p1.x * cos(a) - p1.y * sin(a));
    double y_prim = (p1.x * sin(a) + p1.y * cos(a));
    cout << "Nowy punkt obrócony o " << a << " stopni, to [" <<x_prim << y_prim << "]. " << endl;
}
void obrot_o_kat1(Odcinek d1, double a) {
    double x_prim = (d1.x * cos(a) - d1.y * sin(a));
    double y_prim = (d1.x * sin(a) + d1.y * cos(a));
    double x_prim1 = (d1.x1 * cos(a) - d1.y1 * sin(a));
    double y_prim1 = (d1.x1 * sin(a) + d1.y1 * cos(a));
    cout << "Nowy punkt odcinek o " << a << " stopni, to [" <<x_prim << y_prim << "], [" << x_prim1 << ", " << y_prim1 << "]." << endl;
}
void obrot_o_kat2(Trojkat t1, double a) {
    double x_prim = (t1.x * cos(a) - t1.y * sin(a));
    double y_prim = (t1.x * sin(a) + t1.y * cos(a));
    double x_prim1 = (t1.x1 * cos(a) - t1.y1 * sin(a));
    double y_prim1 = (t1.x1 * sin(a) + t1.y1 * cos(a));
    double x_prim2 = (t1.x2 * cos(a) - t1.y2 * sin(a));
    double y_prim2 = (t1.x2 * sin(a) + t1.y2 * cos(a));
    cout << "Nowy trójkąt przesunięty o " << a << " stopni, to [" <<x_prim << y_prim << "], [" << x_prim1 << ", " << y_prim1 << "]." << ", [" << x_prim2 << ", " << y_prim2 << "]." << endl;
};