#include <iostream>


class liczbaWymierna
{
private:
    int numerator;
    int denumerator;

public:
    liczbaWymierna(int licz = 0, int mian = 1);
    liczbaWymierna(int licz);
    liczbaWymierna(const liczbaWymierna &obj);
    liczbaWymierna& operator=(const liczbaWymierna &obj);
    int getNumerator() const;
    int getDenumerator() const;
    explicit operator int();
    explicit operator double();

    friend liczbaWymierna operator-(const liczbaWymierna &wzor);
    friend liczbaWymierna operator!(const liczbaWymierna &wzor);
    friend std::ostream& operator<<(std::ostream &output, const liczbaWymierna &wzor);
    friend const liczbaWymierna operator+(const liczbaWymierna &first, const liczbaWymierna &second);
    friend const liczbaWymierna operator-(const liczbaWymierna &first, const liczbaWymierna &second);
    friend const liczbaWymierna operator*(const liczbaWymierna &first, const liczbaWymierna &second);
    friend const liczbaWymierna operator/(const liczbaWymierna &first, const liczbaWymierna &second);
};

int nwd(int a, int b);
int nww(int a, int b);

class wyjatekWym : public std::exception {
public:
    std::string mesgErr();
};

class divisionByZero : public wyjatekWym {
public:
    std::string mesgErr();
};

class rangeError : public wyjatekWym {
public:
    std::string mesgErr();
};
