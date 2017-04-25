#include <iostream>
#include "Lista6.h"

void TEST(wyrazenie *w1, zmienna x, string nazwaZmiennej) {
    std::cout << w1->opis() << std::endl;
    for (double i = 1; i <= 100; i++) {
        double liczba = 0;
        liczba += i/100;
        x.przypiszWartoscZmiennej(nazwaZmiennej, liczba);
        std::cout << w1->oblicz() << std::endl;
    }
}

int main() {
    std::cout << "Hello, World!" << std::endl;
    zmienna *x = new zmienna ("x");
    wyrazenie *w1 = new dzielenie(new mnozenie(new odejmowanie(new zmienna("x"), new liczba(1)),new zmienna("x")), new liczba(2));
    TEST(w1, *x, "x");

}
