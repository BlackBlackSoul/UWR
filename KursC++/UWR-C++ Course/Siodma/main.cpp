#include <iostream>
#include <string>
#include "LiczbyWymierne.h"

using namespace std;

int main()
{
    cout<<endl<<"TESTY:"<<endl;
    liczbaWymierna *a;
    liczbaWymierna *b;
    try {
        a = new liczbaWymierna(2,0);
    }
    catch(divisionByZero er) {
        cout<< er.mesgErr()<<endl;
    }
    try {
        a = new liczbaWymierna(6,5);
    }
    catch(divisionByZero er) {
        cout<< er.mesgErr()<<endl;
    }

    try {
        b = new liczbaWymierna(5,6);
    }
    catch(divisionByZero er) {
        cout<< er.mesgErr()<<endl;
    }
    cout<<"a = "<<*a<<endl;
    cout<<"b = "<<*b<<endl;


    try {
        cout<<"Dodawanie a + b = "<<*a + *b<<endl;
    }
    catch(rangeError er) {
        cout<< er.mesgErr()<<endl;
    }

    try {
        cout<<"Odejmowanie a - b = "<<*a - *b<<endl;
    }
    catch(rangeError er) {
        cout<< er.mesgErr()<<endl;
    }

    try {
        cout<<"Mnozenie a * b = "<<*a * *b<<endl;
    }
    catch(rangeError er) {
        cout<< er.mesgErr()<<endl;
    }

    try {
        cout<<"Dzielenie a / b = "<<*a / *b<<endl;
    }
    catch(rangeError er) {
        cout<< er.mesgErr()<<endl;
    }

    cout<<"Zamiana znaku a "<<-*a<<endl;


    try {
        cout<<"Odwrotnosc a = "<<!*a<<endl;
    }
    catch(divisionByZero er) {
        cout<< er.mesgErr()<<endl;
    }

}