#include <iostream>
#include <string>
#include "Wielomian.h"

using namespace std;

Wielomian::Wielomian(int st, double wsp) : stopien(st)
{
    if(wsp==0)
    {
        cerr<<"Ma to byc jednomian, wiec wspolczynnik nie moze byc zerem!"<<endl;
        return;
    }
    wspolczynniki = new double[st+1];
    wspolczynniki[st] = wsp;
    for(int i=0; i<st; i++) {
        wspolczynniki[i] = 0;
    }
    }

Wielomian::Wielomian(int st, const double wsp[]) : stopien(st)
{

    if(wsp[st]==0)
    {
        cerr<<"Wspolczynnik przy najwiekszej potedze jest rowny zero zatem stopien jest bledny!"<<endl;
        return;
    }
    wspolczynniki = new double[st+1];
    for(int i=0; i<=st; i++)
        wspolczynniki[i]=wsp[i];
}

Wielomian::Wielomian (initializer_list<double> wsp)
{
    if(*(wsp.end()-1) == 0)
    {
        cerr<<"Wspolczynnik przy najwiekszej potedze jest rowny zero zatem stopien jest bledny!"<<endl;
        return;
    }
    stopien = wsp.size() - 1;
    wspolczynniki = new double[stopien + 1];
    int i=0;
    for(auto iterator = wsp.begin(); iterator != wsp.end(); i++, iterator++)
        wspolczynniki[i] = *iterator;
}

Wielomian::Wielomian(const Wielomian &pierwotny)
{
    stopien = pierwotny.stopien;
    wspolczynniki = new double[stopien + 1];
    for(int i=0 ; i<stopien; i++)
        wspolczynniki[i] = pierwotny.wspolczynniki[i];
}


Wielomian::Wielomian(Wielomian &&pierwotny)
{
    stopien = pierwotny.stopien;
    wspolczynniki = pierwotny.wspolczynniki;
    pierwotny.wspolczynniki = nullptr;
}

Wielomian& Wielomian::operator = (const Wielomian &pierwotny)
{
    this->~Wielomian();

    stopien = pierwotny.stopien;
    wspolczynniki = new double[stopien + 1];
    for(int i=0 ; i<=stopien; i++)
        wspolczynniki[i] = pierwotny.wspolczynniki[i];
    return *this;
}

Wielomian& Wielomian::operator = (Wielomian &&pierwotny)
{
    this->~Wielomian();

    stopien = pierwotny.stopien;
    wspolczynniki = pierwotny.wspolczynniki;
    pierwotny.wspolczynniki = nullptr;

    return *this;
}

Wielomian::~Wielomian()
{
    delete[] wspolczynniki;
}


istream& operator >> (istream &we, Wielomian &w)
{
    cout<<"Podaj stopien wielomianu, większy bądź równy zero: "<<endl;
    we >> w.stopien;
    w.~Wielomian();
    w.wspolczynniki = new double[w.stopien + 1];
    cout<<"Podawaj kolejne wspolczynniki"<<endl;
    for (int i=0; i<w.stopien; i++)
    {
        we >> w.wspolczynniki[i];
    }
    cout<<"Podaj wspolczynnik przy x o najwiekszej potedze (musi byc rozny od 0)"<<endl;
    we >> w.wspolczynniki[w.stopien];
    return we;
}

ostream& operator << (ostream &wy, const Wielomian &wzor)
{
    for (int i=wzor.stopien; i>=1; i--)
    {
            wy << wzor.wspolczynniki[i] << "*x^" << i << " + ";
    }

    wy << wzor.wspolczynniki[0] << endl;
    return wy;
}


Wielomian operator+(const Wielomian &u, const Wielomian &v)
{
    int st = porownanie_stopni_p(u, v);
    double *wsp = suma_wspolczynnikow(u, v, st);
    Wielomian w(st, wsp);
    delete[] wsp;
    return w;
}

Wielomian operator-(const Wielomian &u, const Wielomian &v)
{
    int st = porownanie_stopni_m(u, v);
    double *wsp = roznica_wspolczynnikow(u, v, st);
    Wielomian w(st, wsp);
    delete[] wsp;
    return w;
}

Wielomian operator*(const Wielomian &u, const Wielomian &v)
{
    int st = u.stopien + v.stopien;
    double *wsp = iloczyn_wspolczynnikow(u, v, st);
    Wielomian w(st, wsp);
    delete[] wsp;
    return w;
}

Wielomian operator*(const Wielomian &u, double m)
{
    Wielomian w = u;
    for (int i = 0; i <= w.stopien; i++)
        w.wspolczynniki[i] *= m;
    return w;
}

Wielomian& Wielomian::operator+=(const Wielomian &v)
{
    int st = porownanie_stopni_p(*this, v);
    double *wsp = suma_wspolczynnikow(*this, v, st);
    *this = Wielomian(st,wsp); //tu korzystamy z przypisania kop
    delete[] wsp;
    return *this;
}

Wielomian& Wielomian::operator-=(const Wielomian &v)
{
    int st = porownanie_stopni_m(*this, v);
    double *wsp = roznica_wspolczynnikow(*this, v, st);
    Wielomian *w = new Wielomian(st, wsp);
    *this = *w;
    delete[] wsp;
    delete w;
    return *this;
}

Wielomian& Wielomian::operator*=(const Wielomian &v)
{
    int st = stopien + v.stopien;
    double *wsp = iloczyn_wspolczynnikow(*this, v, st);
    Wielomian *w = new Wielomian(st, wsp);
    *this = *w;
    delete[] wsp;
    delete w;
    return *this;
}

Wielomian& Wielomian::operator*=(double c)
{
    for (int i = 0; i <= stopien; i++)
        wspolczynniki[i] *= c;
    return *this;
}

double Wielomian::operator()(double x) const
{
    if (stopien == 0)
        return wspolczynniki[0];
    double wynik = x*wspolczynniki[stopien] + wspolczynniki[stopien - 1];
    for (int i = stopien-2; i >= 0; i--)
        wynik = wynik*x + wspolczynniki[i];
    return wynik;
}

double Wielomian::operator[](int i) const
{
    if (i > stopien || i < 0)
    {
        std::cerr << "Zle podany indeks wspolczynnika!\n";
        return 0;
    }

    return wspolczynniki[i];
}
int porownanie_stopni_p(const Wielomian &u, const Wielomian &v)
{
    int st = max(u.stopien, v.stopien);
    while (u.stopien == v.stopien && st > 0 && (u.wspolczynniki[st] + v.wspolczynniki[st] == 0))
        st--;
    return st;
}

int porownanie_stopni_m(const Wielomian &u, const Wielomian &v)
{
    int st = max(u.stopien, v.stopien);
    while (u.stopien == v.stopien && st > 0 && (u.wspolczynniki[st] - v.wspolczynniki[st] == 0))
        st--;
    return st;
}

double* suma_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st)
{
    double *wsp = new double[st + 1];
    int i;
    for (i = 0; i <= u.stopien && i <= v.stopien && i <= st; i++)
        wsp[i] = u.wspolczynniki[i] + v.wspolczynniki[i];
    if (u.stopien > v.stopien)
        for (;i <= u.stopien && i <= st;i++)
            wsp[i] = u.wspolczynniki[i];

    else if (v.stopien > u.stopien)
        for (;i <= v.stopien && i <= st;i++)
            wsp[i] = v.wspolczynniki[i];
    return wsp;
}

double* roznica_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st)
{
    double *wsp = new double[st + 1];
    int i;
    for (i = 0; i <= u.stopien && i <= v.stopien && i <= st; i++)
        wsp[i] = u.wspolczynniki[i] - v.wspolczynniki[i];
    if (u.stopien > v.stopien)
        for (;i <= u.stopien && i <= st; i++)
            wsp[i] = u.wspolczynniki[i];

    else if (v.stopien > u.stopien)
        for (;i <= v.stopien && i <= st; i++)
            wsp[i] = v.wspolczynniki[i] * (-1);
    return wsp;
}

double* iloczyn_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st)
{
    double *wsp = new double[st + 1];
    for (int i = 0; i <= st; i++)
        wsp[i] = 0;

    for (int i = 0; i <= u.stopien; i++)
        for (int j = 0; j <= v.stopien; j++)
            wsp[i + j] += u.wspolczynniki[i] * v.wspolczynniki[j];
    return wsp;
}