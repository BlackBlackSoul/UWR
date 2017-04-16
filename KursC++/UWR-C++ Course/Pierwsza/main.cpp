#include <iostream>

using namespace std;

int arab2bin(const char *x) {
    if (x == nullptr) return -1;
    char tmpChar = x[0];
    if (tmpChar == '0' || tmpChar == '\0') {
        cerr << "Liczba zaczyna sie od zera bądź jest pusta.";
        return 0;
    }
    int i = 0;
    bool is_good = true;
    while (tmpChar != '\0' && is_good) {
        if (i > 3) {
            is_good = false;
            cerr << "Za duża liczba. Przekroczony zakres 1 do 9999.";
        } else if (tmpChar >= 48 && tmpChar <= 57) {
            i++;
            tmpChar = x[i];
        }
        else return 0;

    }
    if (is_good) {
        int n = stoi(string(x));
        return n;
        }
    cerr << "Bład liczby";
}
/*const int B[] = {1000,
                 900, 500, 400, 100,
                 90, 50, 40, 10,
                 9, 5, 4, 1};
const string R[] = {"M",
                    "CM", "D", "CD", "C",
                    "XC", "L", "XL", "X",
                    "IX", "V", "IV", "I"};
*/
 string bin2rzym(int a) {
    struct romandata_t { unsigned int value; char const* numeral; };
    const struct romandata_t romandata[] =
            {
                    {5000, "V¯"},
                    {1000, "M"}, {900, "CM"},
                    {500, "D"}, {400, "CD"},
                    {100, "C"}, { 90, "XC"},
                    { 50, "L"}, { 40, "XL"},
                    { 10, "X"}, { 9, "IX"},
                    { 5, "V"}, { 4, "IV"},
                    { 1, "I"}
            };

    string result;
    for (const romandata_t* current = romandata; current->value > 0; ++current)
    {
        while (a >= current->value)
        {
            result += current->numeral;
            a -= current->value;
        }
    }
    return result;
}

int main(int argv, char **argc) {
    for (int i = 2; i < argv; ++i) {
        if (arab2bin(argc[i]) == 0 ) {
            cout << "Liczba to: " << argc[i] << " " << endl;
            cout << "Brak reprezentacji w systemie rzymskim" << endl;
            cerr << "BŁAÐ" << endl;
        }
        else {
            cout << "Liczba to : ";
            cout << arab2bin(argc[i]) << endl;
            cout << "A jej reprezentacja w systemie rzymskim to: ";
            cout << bin2rzym(arab2bin(argc[i])) << endl;
        }
    }
}