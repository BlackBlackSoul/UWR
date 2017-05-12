#ifndef SIODMA_LICZBYRZECZYWISTE_H
#define SIODMA_LICZBYRZECZYWISTE_H

#ifndef RATIONAL_NUM
#define RATIONAL_NUM

#include <iostream>
using namespace std;

class LiczbyWymierne {

private:
    int licznik;
    int mianownik;
    void uproszczenieLiczbyRzeczywistej();
public:
    LiczbyWymierne();
    LiczbyWymierne(double x);
    LiczbyWymierne(int licznik, int mianownik = 1);
    friend LiczbyWymierne operator+(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend LiczbyWymierne operator-(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend LiczbyWymierne operator-(const LiczbyWymierne& obj);
    friend LiczbyWymierne operator*(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend LiczbyWymierne operator/(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend LiczbyWymierne operator!(const LiczbyWymierne& obj);
    friend bool operator==(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend bool operator!=(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend bool operator<(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend bool operator>(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend bool operator<=(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend bool operator>=(const LiczbyWymierne& left, const LiczbyWymierne& right);
    friend ostream& operator<<(ostream& out, const LiczbyWymierne& obj);


    LiczbyWymierne& operator=(const LiczbyWymierne& obj);
    LiczbyWymierne& operator+=(const LiczbyWymierne& obj);
    LiczbyWymierne& operator-=(const LiczbyWymierne& obj);
    LiczbyWymierne& operator*=(const LiczbyWymierne& obj);
    LiczbyWymierne& operator/=(const LiczbyWymierne& obj);


    void setLicznik(int tempLicznik);
    int getLicznik() const;
    void setMianownik(int tempMianownik);
    int getMianownik() const;
};
#endif

#endif //SIODMA_LICZBYRZECZYWISTE_H
