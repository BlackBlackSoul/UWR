#ifndef CZWARTA_WIELOMIAN_H
#define CZWARTA_WIELOMIAN_H
#include <iostream>


class Wielomian
{
private:
    int stopien;
    double *wspolczynniki;

public:
    Wielomian(int st = 0, double wsp = 1);
    Wielomian(int st, const double wsp[]);
    Wielomian(std::initializer_list<double> wsp);
    Wielomian(const Wielomian &w);
    Wielomian(Wielomian &&w);
    Wielomian& operator=(const Wielomian &w);
    Wielomian& operator=(Wielomian &&w);
    ~Wielomian();

    Wielomian& operator+=(const Wielomian &v);
    Wielomian& operator-=(const Wielomian &v);
    Wielomian& operator*=(const Wielomian &v);
    Wielomian& operator*=(double c);
    double operator()(double x) const;
    double operator[](int i) const;

    friend std::istream& operator>>(std::istream &we, Wielomian &w);
    friend std::ostream& operator<<(std::ostream &wy, const Wielomian &w);
    friend Wielomian operator+(const Wielomian &u, const Wielomian &v);
    friend Wielomian operator-(const Wielomian &u, const Wielomian &v);
    friend Wielomian operator*(const Wielomian &u, const Wielomian &v);
    friend Wielomian operator*(const Wielomian &u, double c);
    friend int porownanie_stopni_p(const Wielomian &u, const Wielomian &v);
    friend int porownanie_stopni_m(const Wielomian &u, const Wielomian &v);
    friend double* suma_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st);
    friend double* roznica_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st);
    friend double* iloczyn_wspolczynnikow(const Wielomian &u, const Wielomian &v, int st);

     };
#endif //CZWARTA_WIELOMIAN_H
