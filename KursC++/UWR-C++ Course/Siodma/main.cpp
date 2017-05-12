#include <iostream>
#include "LiczbyWymierne.h"

int main() {
    std::cout << "MODUŁ: LICZBY RZECZYWISTE " << std::endl;
    LiczbyWymierne R1(3,5);
    cout << R1 << endl;
    R1 = -R1;
    cout << R1 << endl;
    R1 = !R1;
    cout << R1;
// -------------TODO INTERAKTYWNE TESTY--------------- //
}