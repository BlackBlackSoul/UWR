using System;


namespace ConsoleApplication3
{
    class Macierz : Wektor
    {
        Wektor[] Wektory = new Wektor[10];
        public int wielkosc_macierzy = 0;
        public Macierz(params Wektor[] tablica_wektorow)
        {
            int dlugoscTmp = tablica_wektorow.Length;
            for (int i = 0; i < dlugoscTmp; i++)
            {
                Wektory[i] = new Wektor(tablica_wektorow[i].wspolrzedne);
                wielkosc_macierzy++;
            }
            Array.Resize(ref Wektory, tablica_wektorow.Length);
        }
        public void Info()
        {
            foreach (Wektor w in Wektory)
            {
                w.Informacje();
                Console.WriteLine();
            }
            Console.Write("Wielkość macierzy : " + wielkosc_macierzy);
        }
        public static Macierz operator +(Macierz m1, Macierz m2)
        {
            if (m1.wielkosc_macierzy != m2.wielkosc_macierzy) return null;
            else if (m1.Wektory[0].dlugosc != m2.Wektory[0].dlugosc)
            {
                Console.Write("Błąd dodawania. Różne wielkości wektorów");
                Console.WriteLine();
                return null;
            }
            else
            {
                int wielkoscTmp = m1.wielkosc_macierzy;
                Wektor[] wTmp = new Wektor[wielkoscTmp];

                for (int i = 0; i < wielkoscTmp; i++)
                {
                    float[] xxx = new float[m1.Wektory[0].dlugosc];
                    for (int j = 0; j < m1.Wektory[0].dlugosc; j++)
                    {
                        xxx[j] = m1.Wektory[i].wspolrzedne[j] + m2.Wektory[i].wspolrzedne[j];
                    }
                    wTmp[i] = new Wektor(xxx);

                }
                return new Macierz(wTmp);
            }
        }
        public static Macierz operator *(Macierz m1, Macierz m2)
        {
            if (m1.wielkosc_macierzy == m2.Wektory[0].dlugosc)
            {
                int wielkoscTmp = m2.wielkosc_macierzy;
                Wektor[] wTmp = new Wektor[wielkoscTmp];
                float suma = 0;
                int x, y = 0;
                for (int i = 0; i<m2.Wektory[0].dlugosc;i++)
                {
                }
                    
            }
        }
    }
}

