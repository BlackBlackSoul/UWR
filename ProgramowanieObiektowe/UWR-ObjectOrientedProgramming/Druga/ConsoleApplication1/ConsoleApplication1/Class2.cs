using System;
using System.Collections.Generic;

namespace ConsoleApplication1
{
    class Pierwsze : ListaLeniwa
    {
        public int rozmiar;
        public int poczatek = 1;
        public List<int> Lista1;
        public bool czyPierwsza(int szukana)
        {
            var granica = (int)Math.Floor(Math.Sqrt(szukana));
            for (int i = 2; i <= granica; ++i)
            {
                if (szukana % i == 0) return false;
            }
            return true;
        }
        public int element(int i)
        {
            if (i < Lista1.Count)
            {
                return Lista1[i];
            }
            else
            {
                if (Lista1.Count == 0)
                {
                    int j = 2;
                    while (Lista1.Count != i)
                    {
                        if (czyPierwsza(j) == true)
                        {
                            Lista1.Add(j);
                            j += 1;
                        }
                        else j += 1;

                    }
                    return Lista1[i - 1];
                }
                else
                {
                    int j = Lista1[Lista1.Count-1]+1;
                    while (Lista1.Count != i)
                    {
                        if (czyPierwsza(j) == true)
                        {
                            Lista1.Add(j);
                            j += 1;
                        }
                        else j += 1;

                    }
                    return Lista1[i - 1];
                }
            }
        }
        public string get_rozmiar()
        {
            return "Rozmiar tej listy to: " + Lista1.Count;
        }
        public void wygladListy()
        {
            for (int i = 0; i < Lista1.Count; i++)
            {
                Console.WriteLine($"{i} = {Lista1[i]}");
            }
        }
        public Pierwsze()
        {
            rozmiar = 0;
            Lista1 = new List<int>();
        }
    }
}
