
#include <iostream>
#include <string>
#include "LiczbyWymierne.h"

using namespace std;

liczbaWymierna::liczbaWymierna(int licz, int mian) {
    if (mian == 0)
        throw divisionByZero();
    if (mian < 0) {
        mian *= -1;
        licz *= -1;
    }

    if (licz != 0) {
        int dzielnik;
        dzielnik = nwd((abs(licz)),mian);
        licz /= dzielnik;
        mian /= dzielnik;
    }
    numerator = licz;
    denumerator = mian;
}

liczbaWymierna::liczbaWymierna(int licz) : liczbaWymierna(licz, 1) { }


liczbaWymierna::liczbaWymierna(const liczbaWymierna &obj) {
    numerator = obj.getNumerator();
    denumerator = obj.getDenumerator();
}

liczbaWymierna& liczbaWymierna::operator=(const liczbaWymierna &obj) {
    numerator = obj.getNumerator();
    denumerator = obj.getDenumerator();
    return *this;
}

int liczbaWymierna::getNumerator() const {
    return numerator;
}

int liczbaWymierna::getDenumerator() const {
    return denumerator;
}

liczbaWymierna operator-(const liczbaWymierna &obj) {
    return liczbaWymierna(obj.numerator*(-1), obj.denumerator);
}

liczbaWymierna operator!(const liczbaWymierna &obj) {
    if (obj.numerator == 0) throw divisionByZero();
    liczbaWymierna newWymierna(obj.denumerator, obj.numerator);
    return newWymierna;
}

liczbaWymierna::operator int() {
    return numerator / denumerator;
}


liczbaWymierna::operator double() {
    return static_cast<double>(numerator) / static_cast<double>(denumerator);
}


const liczbaWymierna operator+(const liczbaWymierna &objL, const liczbaWymierna &objR) {
    int pom;
    try {
        pom = nww(objL.getDenumerator(), objR.getDenumerator());
    }
    catch (string war) {
        throw war;
    }
    int denumL = pom/objL.getDenumerator();
    int denumR = pom/objR.getDenumerator();
    int n_licz = (objL.getDenumerator()* denumL) + (objR.getNumerator() * denumR);
    return liczbaWymierna(n_licz, pom);
}


const liczbaWymierna operator-(const liczbaWymierna &objL, const liczbaWymierna &objR) {
    int pom;
    try {
        pom = nww(objL.getDenumerator(), objR.getDenumerator());
    }
    catch (string war) {
        throw war;
    }

    int denumL = pom/objL.getDenumerator();
    int denumR = pom/objR.getDenumerator();
    
    int n_licz = (objL.getDenumerator() * denumL) - (objR.getNumerator() * denumR);
    return liczbaWymierna(n_licz, pom);
}


const liczbaWymierna operator*(const liczbaWymierna &pierwsza, const liczbaWymierna &druga) {
    return liczbaWymierna((pierwsza.getNumerator() * druga.getNumerator()), (pierwsza.getDenumerator()* druga.getDenumerator()));
}

const liczbaWymierna operator/(const liczbaWymierna &pierwsza, const liczbaWymierna &druga) {
    if ((pierwsza.getDenumerator() * druga.getNumerator()) == 0)
        throw divisionByZero();

    int newNumer = pierwsza.getNumerator() * druga.getDenumerator();
    int newDenum = pierwsza.getDenumerator() * druga.getNumerator();

    return liczbaWymierna(newNumer, newDenum);
}

string wyjatekWym::mesgErr() {
    return "Wyjatek liczby wymiernej";
}

string divisionByZero::mesgErr() {
    return "Nie mozna dzielic przez 0!";
}

string rangeError::mesgErr() {
    return "Przekroczony zakres";
}

int nwd(int a, int b) {
    while (b != 0) {
        int r = a % b;
        a = b;
        b = r;
    }
    return a;
}


int nww(int a, int b) {
    long long int mult = (static_cast<long long int>(a)) * (static_cast<long long int>(b));
    mult /= nwd(a, b);

    if (mult > INT32_MAX)
        throw rangeError();
    else
        return static_cast<int>(mult);
}

ostream& operator<<(ostream &wy, const liczbaWymierna &wzor) {
    double z = static_cast<double> (wzor.getNumerator())/(wzor.getDenumerator());
    wy << z <<endl;
    return wy;
}