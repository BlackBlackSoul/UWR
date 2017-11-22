#include <iostream>
#include "Kolejka.h"

using namespace std;

int main() {
    /*
    string command;
    Kolejka p1 = Kolejka(2);
    while (true){
            cout << "Wpisz wybraną komendę. To są komendy, które można użyć w programie: " << endl;
            cout << "1) exit - wyjście z programu" << endl;
            cout << "2) wstaw - wstaw element do kolejki" << endl;
            cout << "3) pobierz - pobiera element z kolejki" << endl;
            cout << "4) rozmiar - wyświetla rozmiar kolejki" << endl;
        getline(cin, command);
        if (command == "exit") {
            break;
        }
        else {
            string command1;
            if (command == "wstaw") {
                cout << "Podaj nazwę elementu: " << endl;
                getline(cin, command1);
                p1.wstaw(command1);
            } else if (command == "pobierz") {
                try {
                    cout << p1.pobierz() << endl;
                }
                catch (string blad) {cout << blad << endl;};
            }

            else if (command == "rozmiar") {
                cout << p1.rozmiar() << endl;
        }
    }
}
 */

    cout << "KOLEJKA P: " << endl;
    Kolejka p = Kolejka(3);
    p.wstaw("karol");
    p.wstaw("adam");
    p.wstaw("kasia");
    p.wypisz();
    cout << "Element pobrany z kolejki: " << p.pobierz() << endl;
    p.wypisz();
    p.wstaw("bartek");
    p.wypisz();
     }