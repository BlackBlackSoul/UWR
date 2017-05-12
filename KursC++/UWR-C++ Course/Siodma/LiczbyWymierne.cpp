#include "LiczbyWymierne.h"

#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <limits.h>
using namespace std;


LiczbyWymierne::LiczbyWymierne() {
    setLicznik(0);
    setMianownik(1);
}

LiczbyWymierne::LiczbyWymierne(double x) {
    int i = 1;
    while (x*i-static_cast<int>(x*i) != 0) {
        if (i > INT_MAX/10) {
            cout << "this frational number : " << x << " can not be transfer to rational number, it's too long, now set it 0." << endl;
            setLicznik(0);
            setMianownik(1);
            return ;
        }
        else {
            i *= 10;
        }
    }
    setLicznik(x * i);
    setMianownik(i);
    uproszczenieLiczbyRzeczywistej();
}

LiczbyWymierne::LiczbyWymierne(int licznik, int mianownik) {
    setLicznik(licznik);
    setMianownik(mianownik);
    uproszczenieLiczbyRzeczywistej();
}

int wartoscAbsolutna(int x) {
    if (x >= 0) {
        return x;
    }
    else {
        return -x;
    }
}

void dzielnikiPierwsze(int num, vector<int> &factorSet) {
    if (num != 1) {
        factorSet.push_back(num);
    }
    for (int i = 2; i <= sqrt( static_cast<double>(num) ); i++) {
        if (num%i == 0) {
            factorSet.push_back(i);
            factorSet.push_back(num/i);
        }
    }
}

void skrocenieDzielniki(int &a, int &b) {
    int tempLicznik = a;
    int tempMianownik = b;
    int small, temp;
    vector<int> zbiorDzielnikow;
    if (tempLicznik == tempMianownik) {
        a = 1;
        b = 1;
        return ;
    }
    else if (tempLicznik == -tempMianownik) {
        a = -1;
        b = 1;
        return ;
    }
    else if (tempLicznik == 0) {
        b = 1;
        return ;
    }


    if (wartoscAbsolutna(tempLicznik) < wartoscAbsolutna(tempMianownik)) {
        small = wartoscAbsolutna(tempLicznik);
    }
    else {
        small = wartoscAbsolutna(tempMianownik);
    }

    dzielnikiPierwsze(small, zbiorDzielnikow);
    for (int i = 0; i < zbiorDzielnikow.size(); i++) {
        temp = zbiorDzielnikow[i];
        while (tempLicznik%temp == 0 && tempMianownik%temp == 0) {
            tempLicznik /= temp;
            tempMianownik /= temp;
        }
    }
    a = tempLicznik;
    b = tempMianownik;
}


void LiczbyWymierne::setLicznik(int tempLicznik) {
    licznik = tempLicznik;
}

int LiczbyWymierne::getLicznik() const {
    return licznik;
}

void LiczbyWymierne::setMianownik(int tempMianownik) {
    if (tempMianownik == 0) {
        mianownik = 1;
        licznik = 0;
        cout << "Denominator is 0! Not good! THe whole is set to 0." << endl;
    }
    else {
        mianownik = tempMianownik;
    }
}

int LiczbyWymierne::getMianownik() const {
    return mianownik;
}


void LiczbyWymierne::uproszczenieLiczbyRzeczywistej() {
    int tempN = licznik;
    int tempD = mianownik;
    skrocenieDzielniki(tempN, tempD);
    setLicznik(tempN);
    setMianownik(tempD);
}


//friend functions definitions

LiczbyWymierne operator+(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    LiczbyWymierne temp;
    int tempLewyMianownik = left.getMianownik();
    int tempPrawyMianownik = right.getMianownik();
    skrocenieDzielniki(tempLewyMianownik, tempPrawyMianownik);
    temp.setMianownik(left.getMianownik() * tempPrawyMianownik);
    temp.setLicznik(left.getLicznik() * tempPrawyMianownik + right.getLicznik() * tempLewyMianownik);
    temp.uproszczenieLiczbyRzeczywistej();
    return temp;
}

LiczbyWymierne operator-(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    return left+(-right);
}

LiczbyWymierne operator*(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    LiczbyWymierne temp;
    LiczbyWymierne temp2(right.getLicznik(), left.getMianownik());
    LiczbyWymierne temp3(left.getLicznik(), right.getMianownik());
    int a = temp2.getMianownik();
    int b = temp2.getLicznik();
    int c = temp3.getMianownik();
    int d = temp3.getLicznik();
    temp.setLicznik(b * d);
    temp.setMianownik(a * c);
    return temp;
}

LiczbyWymierne operator/(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    LiczbyWymierne temp_1(left.getLicznik(), left.getMianownik());
    LiczbyWymierne temp_2(right.getMianownik(), right.getLicznik());
    return temp_1*temp_2;
}

bool operator==(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    return (left.licznik == right.licznik && left.mianownik == right.mianownik);
}

bool operator!=(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    return !(left == right);
}

bool operator<(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    int lside = left.getLicznik()* right.getMianownik();
    int rside = left.getMianownik()* right.getLicznik();
    return (lside < rside);
}

bool operator>(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    int lside = left.getLicznik()* right.getMianownik();
    int rside = left.getMianownik()* right.getLicznik();
    return (lside > rside);
}

bool operator<=(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    return ( (left < right) || (left == right) );
}

bool operator>=(const LiczbyWymierne& left, const LiczbyWymierne& right) {
    return ( (left > right) || (left == right) );
}

ostream& operator<<(ostream& out, const LiczbyWymierne& obj) {
    out << obj.licznik;
    if (obj.licznik != 0 && obj.mianownik != 1) {
        out << "/" << obj.mianownik;
    }
    return out;
}

LiczbyWymierne& LiczbyWymierne::operator=(const LiczbyWymierne& obj) {
    setLicznik(obj.getLicznik());
    setMianownik(obj.getMianownik());
    return *this;
}

LiczbyWymierne& LiczbyWymierne::operator+=(const LiczbyWymierne& obj) {
    *this = *this+obj;
    return *this;
}

LiczbyWymierne& LiczbyWymierne::operator-=(const LiczbyWymierne& obj) {
    *this = *this-obj;
    return *this;
}

LiczbyWymierne& LiczbyWymierne::operator*=(const LiczbyWymierne& obj) {
    *this = *this*obj;
    return *this;
}

LiczbyWymierne& LiczbyWymierne::operator/=(const LiczbyWymierne& obj) {
    *this = *this/obj;
    return *this;
}

LiczbyWymierne operator-(const LiczbyWymierne &obj) {
    LiczbyWymierne temp;
    int tempLicznik = obj.getLicznik();
    int tempMianownik = obj.getMianownik();
    temp.setLicznik((-1)*tempLicznik);
    temp.setMianownik(tempMianownik);
    return temp;
}

LiczbyWymierne operator!(const LiczbyWymierne &obj) {
    LiczbyWymierne temp;
    int tempMianownik = obj.getLicznik();
    int tempLicznik = obj.getMianownik();
    if(tempMianownik < 0) { tempMianownik = (-1)*tempMianownik; tempLicznik = (-1)*tempLicznik; }
    temp.setLicznik(tempLicznik);
    temp.setMianownik(tempMianownik);
    return temp;
}
