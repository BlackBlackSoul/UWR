#include "Wielomian.h"
#include <iostream>

using namespace std;


int main()
{
    double wx[3] = {3,2,6};
    Wielomian w1;
    w1 = Wielomian(2, wx);
    cout << "Pierwszy Wielomian zbudowany przy pomocy konstruktora z tablicą: ";
    cout << w1;
    double wy[3] = {12, 12, 12};
    Wielomian w2;
    w2 = Wielomian(2, wy);
    cout << "Drugi Wielomian zbudowany przy pomocy konstruktora z tablicą: ";
    cout << w2;
    Wielomian w3;
    w3 = Wielomian({1,2,3,4,5});
    cout << "Trzeci Wielomian zbudowany przy pomocy Initiliazer_list: ";
    cout << w3;
    Wielomian w4;
    w4 = Wielomian();
    cout << "Jednomian zbudowany przy pomocy kontruktora domyślnego: ";
    cout << w4;
    cout << "Trochę działań: " << endl;
    cout << "(+) Dodawanie wielomianów pierwszego i drugiego: " << w1 + w2;
    cout << "(-) Odejmowanie wielomianów trzeci minus drugi: " << w3 - w2;
    cout << "(*) Pomnożenie sumy pierwszego i drugiego przez trzeci: " << (w1+w2)*w3;
    cout << "A teraz poproszę o interaktywne stworzenie wielomianu. Postępuj zgodnie z poniższymi komendami. Wynik zatwierdź enterem: " << endl;
    Wielomian w5;
    cin >> w5;
    cout <<"Oto wielomian stworzony przez Ciebie: " << w5;
    Wielomian w6;
    w6 = w5;
    cout << "Teraz tworzymy kolejny wieloman, identyczny ze stworzonym przez Ciebie, poprzez przypisanie kopiujące: " << w6;
    cout << "Jego współczynnikiem przy trzceiej potędze jest: " << w6[3] << endl;
    cout << "Wartośc tego wielomianu w punkcie 1 wynosi: "<< w6(1) << endl;
    cout << "A z kolei w punkt przecięcia z osią OY to: " << w6(0) << endl;

}